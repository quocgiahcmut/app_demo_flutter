extension StringExtension on String {
  String ensureTrailingSlash() {
    return endsWith('/') ? this : '$this/';
  }

  String ensureNoTrailingSlash() {
    return endsWith('/') ? substring(0, length - 1) : this;
  }

  String ensureLeadingSlash() {
    return startsWith('/') ? this : '/$this';
  }

  String ensureNoLeadingSlash() {
    return startsWith('/') ? substring(1) : this;
  }
}