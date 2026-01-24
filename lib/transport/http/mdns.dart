import 'dart:async';
import 'dart:io';

import 'package:multicast_dns/multicast_dns.dart';

class MdnsQjayDiscoveryResult {
  final InternetAddress address;
  final int port;
  final Map<String, String> txt;
  MdnsQjayDiscoveryResult(this.address, this.port, this.txt);
}

class MdnsQjayDiscovery {
  static const String serviceType = '_qjay._tcp.local';
  static const String instanceName = 'qjay';

  /// Discovers first matching qjay service on the LAN.
  static Future<MdnsQjayDiscoveryResult?> discover({
    Duration timeout = const Duration(seconds: 6),
    bool preferIpv4 = true,
  }) async {
    final client = MDnsClient(
      rawDatagramSocketFactory: (dynamic host, int port, {bool? reuseAddress, bool? reusePort, int? ttl}) {
        return RawDatagramSocket.bind(
          host is InternetAddress ? host : InternetAddress.anyIPv4,
          port,
          reuseAddress: reuseAddress ?? true,
          reusePort: reusePort ?? true,
          ttl: ttl ?? 255,
        );
      },
    );
      
    try {
      await client.start();
    
      final ptrStream = client.lookup<PtrResourceRecord>(
        ResourceRecordQuery.serverPointer(serviceType),
      );
      
      final deadline = DateTime.now().add(timeout);
      
      await for (final ptr in ptrStream) {
        
        final fullInstance = ptr.domainName;
        if (!fullInstance.startsWith('$instanceName.')) continue;
        
        final srv = await _firstBeforeDeadline<SrvResourceRecord>(
          client.lookup<SrvResourceRecord>(
            ResourceRecordQuery.service(fullInstance),
          ),
          deadline,
        );
        if (srv == null) continue;

        final txtRec = await _firstBeforeDeadline<TxtResourceRecord>(
          client.lookup<TxtResourceRecord>(
            ResourceRecordQuery.text(fullInstance),
          ),
          deadline,
        );

        final txt = <String, String>{};
        if (txtRec != null) {
          for (final part in txtRec.text.split(RegExp(r'[ ;]'))) {
            final idx = part.indexOf('=');
            if (idx > 0) {
              txt[part.substring(0, idx)] = part.substring(idx + 1);
            }
          }
        }

        final target = srv.target;
        
        InternetAddress? ip;

        if (preferIpv4) {
          ip = (await _firstBeforeDeadline<IPAddressResourceRecord>(
            client.lookup<IPAddressResourceRecord>(
              ResourceRecordQuery.addressIPv4(target),
            ),
            deadline,
          ))?.address;

          ip ??= (await _firstBeforeDeadline<IPAddressResourceRecord>(
            client.lookup<IPAddressResourceRecord>(
              ResourceRecordQuery.addressIPv6(target),
            ),
            deadline,
          ))?.address;
        } else {
          ip = (await _firstBeforeDeadline<IPAddressResourceRecord>(
            client.lookup<IPAddressResourceRecord>(
              ResourceRecordQuery.addressIPv6(target),
            ),
            deadline,
          ))?.address;

          ip ??= (await _firstBeforeDeadline<IPAddressResourceRecord>(
            client.lookup<IPAddressResourceRecord>(
              ResourceRecordQuery.addressIPv4(target),
            ),
            deadline,
          ))?.address;
        }


        if (ip == null) continue;

        return MdnsQjayDiscoveryResult(ip, srv.port, txt);
      }

    } catch (e) {
      client.stop();
    } finally {
      client.stop();
    }

    return null;
  }

  static Future<T?> _firstBeforeDeadline<T>(
    Stream<T> stream,
    DateTime deadline,
  ) async {
    final remaining = deadline.difference(DateTime.now());
    if (remaining.isNegative) return null;
    try {
      return await stream.first.timeout(remaining);
    } catch (_) {
      return null;
    }
  }
}
