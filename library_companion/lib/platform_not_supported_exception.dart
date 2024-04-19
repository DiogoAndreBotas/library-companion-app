class PlatformNotSupportedException implements Exception {
  String cause;
  PlatformNotSupportedException(this.cause);
}