import 'package:flutter/foundation.dart';

import 'package:qjay/transport/proto/request.pb.dart';
import 'package:qjay/transport/proto/request_client.pb.dart';
import 'package:qjay/transport/proto/request_repo.pb.dart';
import 'package:qjay/transport/proto/request_playback.pb.dart';
import 'package:qjay/models/common.dart';
import 'package:qjay/models/song.dart';

final class ProtoRequest {

  static const dbPath = kDebugMode ? "/home/fady/Test/mstr.cdb" : "/home/fady/Test/mstr.cdb";
  static const songDir = kDebugMode ? "/home/fady/Test/Data" : "/home/fady/Test/Data";
  static const updateDir = kDebugMode ? "/home/fady/Test/" : "/home/fady/Test/";
  static const updatePackage = kDebugMode ? "/media/Ventoy/test/Data" : "asd";

  ProtoRequest._();

  static Request setupRuntime()
    => Request(client: ClientRequest(setupRuntime: SetupRuntime(dbPath: dbPath, songDir: songDir, updateDir: updateDir, updatePackage: updatePackage)));

  static Request setupClient(String userId, String userName)
    => Request(client: ClientRequest(setupClient: SetupClient(dbPath: dbPath, id: userId, name: userName)));
    
  static Request setupWithUpdate()
    => Request(client: ClientRequest(setupWithUpdate: SetupWithUpdate(dbPath: dbPath, songDir: songDir)));

  static Request getWifiNetworkCount()
    => Request(client: ClientRequest(getWifiNetworkCount: GetWifiNetworkCount()));

  static Request getWifiNetworks(int offset, int count)
    => Request(client: ClientRequest(getWifiNetworks: GetWifiNetworks(startIndex: offset, endIndex: offset + count)));

  static Request connectToSsid(String ssid, List<int> encPass, List<int> passNonce)
    => Request(client: ClientRequest(connectToSsid: ConnectToSsid(ssid: ssid, encPass: encPass, passNonce: passNonce)));

  static Request subscriptionStatus()
    => Request(client: ClientRequest(subscriptionStatus: SubscriptionStatus()));

  static Request validateSubscription()
    => Request(client: ClientRequest(validateSubscription: ValidateSubscription()));

  static Request addOfflineKey(String key)
    => Request(client: ClientRequest(addOfflineKey: AddOfflineKey(key: key)));
  
  static Request getPresetCount()
    => Request(repo: RepoRequest(getPresetCount: GetPresetCount()));

  static Request getPresets(int offset, int count)
    => Request(repo: RepoRequest(getPresets: GetPresets(startIndex: offset, endIndex: offset + count)));

  static Request setSchedule(String scheduleId)
    => Request(repo: RepoRequest(setSchedule: SetSchedule(scheduleId: scheduleId.toUuid())));

  static Request getSchedule(String scheduleId)
    => Request(repo: RepoRequest(getSchedule: GetSchedule(scheduleId: scheduleId.toUuid())));

  static Request getScheduleRotations(String scheduleId, int offset, int count)
    => Request(repo: RepoRequest(getScheduleRotations: GetScheduleRotations(scheduleId: scheduleId.toUuid(), startIndex: offset, endIndex: offset + count)));

  static Request setSelection(String selectionId, String? startingSongId, List<int> energies, SongDuration songDuration)
    => Request(
      repo: RepoRequest(
        setSelection: SetSelection(
          selectionId: selectionId.toUuid(),
          startSongId: startingSongId?.toUuid(),
          energies: energies,
          songDuration: songDuration.value,
        ),
      ),
    );

  static Request getSelection(String selectionid)
    => Request(repo: RepoRequest(getSelection: GetSelection(selectionId: selectionid.toUuid())));

  static Request getSelectionCount(String selectionId, List<int> energies)
    => Request(
      repo: RepoRequest(
        getSelectionSongCount: GetSelectionSongCount(selectionId: selectionId.toUuid(), energies: energies),
      ),
    );

  static Request getSelectionSongs(String selectionId, List<int> energies, SongSortMode sortMode, int offset, int count)
    => Request(
      repo: RepoRequest(
        getSelectionSongs: GetSelectionSongs(
          selectionId: selectionId.toUuid(),
          energies: energies,
          sortMode: sortMode.index,
          startIndex: offset,
          endIndex: offset + count,
        ),
      ),
    );

  static Request getCurrentPreset()
    => Request(
      playback: PlaybackRequest(
        getCurrentPreset: GetCurrentPreset(),
      ),
    );

  static Request getCurrentSong()
    => Request(
      playback: PlaybackRequest(
        getCurrentSong: GetCurrentSong(),
      ),
    );

  static Request getCurrentState()
    => Request(
      playback: PlaybackRequest(
        getCurrentState: GetCurrentState(),
      ),
    );

  static Request getVolume()
    => Request(
      playback: PlaybackRequest(
        getVolume: GetVolume()
      )
    );

  static Request getSong(String songId)
    => Request(
      repo: RepoRequest(
        getSong: GetSong(
          songId: songId.toUuid()
        )
      )
    );

  static Request searchResultCount(String query)
    => Request(repo: RepoRequest(searchGetCount: SearchGetCount(query: query)));

  static Request searchResultSongs(String query, int offset, int count)
    => Request(
      repo: RepoRequest(
        searchGetSongs: SearchGetSongs(
          query: query,
          startIndex: offset,
          endIndex: offset + count,
        ),
      ),
    );

  static Request addToExceptions(String songId, bool skipToNext)
    => Request(
      repo: RepoRequest(
        addToExceptions: AddToExceptions(songId: songId.toUuid(), skipToNext: skipToNext),
      ),
    );

  static Request removeFromExceptions(String songId)
    => Request(
      repo: RepoRequest(
        removeFromExceptions: RemoveFromExceptions(songId: songId.toUuid()),
      ),
    );

  static Request getPinnedCount()
    => Request(repo: RepoRequest(getPinnedSongCount: GetPinnedSongCount()));

  static Request getPinnedSongs(int offset, int count)
    => Request(
      repo: RepoRequest(
        getPinnedSongs: GetPinnedSongs(
          startIndex: offset,
          endIndex: offset + count,
        ),
      ),
    );

  static Request addPinnedSong(int index, String songId)
    => Request(
      repo: RepoRequest(
        addToPinned: AddToPinned(songId: songId.toUuid(), index: index),
      ),
    );

  static Request deletePinnedSong(String songId)
    => Request(
      repo: RepoRequest(
        removeFromPinned: RemoveFromPinned(songId: songId.toUuid()),
      ),
    );

  static Request reorderPinnedSongs(int a, int b)
    => Request(
      repo: RepoRequest(
        reorderPinned: ReorderPinned(a: a, b: b),
      ),
    );

  static Request setupPlayer()
    => Request(playback: PlaybackRequest(setup: Setup()));

  static Request stop()
    => Request(playback: PlaybackRequest(stop: Stop()));

  static Request play()
    => Request(playback: PlaybackRequest(play: Play()));

  static Request pause()
    => Request(playback: PlaybackRequest(pause: Pause()));

  static Request next()
    => Request(playback: PlaybackRequest(next: Next()));

  static Request skipToSong(String songId)
    => Request(playback: PlaybackRequest(skipToSong: SkipToSong(songId: songId.toUuid())));

  static Request setProgress(double percentage)
    => Request(playback: PlaybackRequest(setProgress: SetProgress(percentage: percentage)));

  static Request setVolume(double percentage)
    => Request(playback: PlaybackRequest(setVolume: SetVolume(percentage: percentage)));
}