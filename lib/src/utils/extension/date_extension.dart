extension DateExtension on DateTime {
  DateTime formatDate(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date, isUtc: true);
  }
}
