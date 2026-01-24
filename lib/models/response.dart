import 'package:qjay/models/common.dart';
import 'package:qjay/models/presets.dart';
import 'package:qjay/models/song.dart';
import 'package:qjay/transport/proto/adapters.dart';
import 'package:qjay/transport/proto/error.pb.dart' as pberror;
import 'package:qjay/transport/proto/error.pb.dart' show GenericError;
import 'package:qjay/transport/proto/error.pbenum.dart';
import 'package:qjay/transport/proto/remote.pb.dart' show PresetInfo;
import 'package:qjay/transport/proto/response.pb.dart';
import 'package:qjay/transport/transport_events.dart';

extension ResponseToGeneric on Response {
  Result<T> parse<T>() {
    switch (T) {
      case const (Response):
        return Ok<Response>(this) as Result<T>;
      case const (WifiNetworkList):
        return ProtoResponse._wifiNetworkList(this) as Result<T>;
      case const (PresetInfo):
        return ProtoResponse._presetInfo(this) as Result<T>;
      case const (List<Preset>):
        return ProtoResponse._presetList(this) as Result<T>;
      case const (Schedule):
        return ProtoResponse._schedule(this) as Result<T>;
      case const (List<ScheduleRotation>):
        return ProtoResponse._rotations(this) as Result<T>;
      case const (Selection):
        return ProtoResponse._selection(this) as Result<T>;
      case const (List<Song>):
        return ProtoResponse._songList(this) as Result<T>;
      case const (bool):
        return ProtoResponse._bool(this) as Result<T>;
      case const (int):
        return ProtoResponse._integer(this) as Result<T>;
      case const (double):
        return ProtoResponse._decimal(this) as Result<T>;  
      case const (DateTime):
        return ProtoResponse._date(this) as Result<T>;  
      default:
        return ProtoResponse._okOrError(this) as Result<T>;
    }
  }
}

extension ResponseToUpdaterEvent on UpdateProgressEvent {
  UpdaterEvent toEvent() => switch (value) {
    0 || 1 => SetupStarted(),
    2 => ExternalFoundSimilar(),
    3 => LocalFoundSimilar(),
    4 => LocalFoundNewer(),
    5 => FetchingUserData(),
    6 => ParsingData(),
    7 => FetchingSongs(0),
    8 => FetchingSongs(progress),
    9 => DatabaseSetup(),
    10 => CleanupSongs(),
    11 => SetupComplete(),
    _ => SetupError("Unexpected error")
  };
}

final class ProtoResponse {

  ProtoResponse._();

  static Result<PresetInfo> _presetInfo(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasPresetInfo()) return Ok(response.presetInfo);
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse PresetInfo", type: ErrorType.WARNING)));
  }

  static Result<List<Preset>> _presetList(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasPresetList()) return Ok(response.presetList.presets.map((p) => p.toPreset()).whereType<Preset>().toList());
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse PresetList", type: ErrorType.WARNING)));
  }

  static Result<Schedule> _schedule(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasSchedule()) return Ok(response.schedule.toSchedule());
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse Schedule", type: ErrorType.WARNING)));
  }

  static Result<List<ScheduleRotation>> _rotations(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasScheduleRotations()) return Ok(response.scheduleRotations.rotations.map((p) => p.toRotation()).whereType<ScheduleRotation>().toList());
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse Rotations", type: ErrorType.WARNING)));
  }

  static Result<Selection> _selection(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasSelection()) return Ok(response.selection.toSelection());
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse Selection", type: ErrorType.WARNING)));
  }

  static Result<bool> _bool(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasBool_3()) return Ok(response.bool_3);
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse Boolean", type: ErrorType.WARNING)));
  }

  static Result<int> _integer(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasUint32()) return Ok(response.uint32);
    if (response.hasUint64()) return Ok(response.uint64.toInt());
    if (response.hasInt32()) return Ok(response.int32);
    if (response.hasInt64()) return Ok(response.int64.toInt());
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse Integer", type: ErrorType.WARNING)));
  }

  static Result<double> _decimal(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasFloat()) return Ok(response.float);
    if (response.hasDouble_9()) return Ok(response.double_9);
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse Decimal", type: ErrorType.WARNING)));
  }

  static Result<DateTime> _date(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasDate()) return Ok(response.date.toDateTime());
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse Date", type: ErrorType.WARNING)));
  }

  static Result<List<Song>> _songList(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasSongList()) return Ok(response.songList.songs.map((s) => s.toSong()).toList(growable: false));
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse SongList", type: ErrorType.WARNING)));
  }

  static Result<WifiNetworkList> _wifiNetworkList(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasWifiNetworkList()) return Ok(response.wifiNetworkList);
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse WifiNetworkList", type: ErrorType.WARNING)));
  }

  static Result<()> _okOrError(Response response) {
    if (response.hasError()) return Err(response.error);
    if (response.hasOk()) return Ok(());
    return Err(pberror.Error(generic: GenericError(title: "Unexpected Error", message: "Failed to parse Ok/Default result", type: ErrorType.WARNING)));
  }
}
