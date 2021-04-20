extension DurationExtension on Duration {
  String toMinutesSeconds() {
    if (this < Duration.zero) {
      return "-${(-this).toMinutesSeconds()}";
    }

    final twoDigitSeconds = _twoDigits(
      inSeconds.remainder(Duration.secondsPerMinute),
    );
    return '$inMinutes:$twoDigitSeconds';
  }

  String toHoursMinutesSeconds() {
    if (this < Duration.zero) {
      return "-${(-this).toHoursMinutesSeconds()}";
    }

    final twoDigitMinutes = _twoDigits(
      inMinutes.remainder(Duration.minutesPerHour),
    );
    final twoDigitSeconds = _twoDigits(
      inSeconds.remainder(Duration.secondsPerMinute),
    );
    return '$inHours:$twoDigitMinutes:$twoDigitSeconds';
  }

  static String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  static String _sixDigits(int n) {
    if (n >= 100000) return '$n';
    if (n >= 10000) return '0$n';
    if (n >= 1000) return '00$n';
    if (n >= 100) return '000$n';
    if (n >= 10) return '0000$n';
    return '00000$n';
  }
}
