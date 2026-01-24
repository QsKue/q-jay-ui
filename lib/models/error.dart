
// TODO: change error handing ids
enum HostErrorKind {
    disconnected(0),
    userSetup(1),
    userDataEmpty(2),
    unexpected(400),
    timeout(401),
    invalidArgument(402);

    final int _value;
    const HostErrorKind(this._value);

    int get code => _value;

    static HostErrorKind fromValue(int value) {
    for (final e in HostErrorKind.values) {
      if (e._value == value) return e;
    }
    return HostErrorKind.unexpected;
  }
}

class HostError {
  final HostErrorKind kind;
  final String message;
  const HostError(this.kind, this.message);
}