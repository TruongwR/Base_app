extension DateTimeExtensions on DateTime {
  String toFormattedString() {
    final year = this.year.toString();
    final month = this.month.toString().padLeft(2, '0');
    final day = this.day.toString().padLeft(2, '0');
    return '$day-$month-$year';
  }
}