  String calculateTimeDifference(DateTime startTime, DateTime endTime) {
    final difference = endTime.difference(startTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} phút';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      final minutes = difference.inMinutes.remainder(60);
      return '$hours giờ $minutes phút';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ngày';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      final days = difference.inDays % 7;
      return '$weeks tuần $days ngày';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      final days = difference.inDays % 30;
      return '$months tháng $days ngày';
    } else {
      final years = (difference.inDays / 365).floor();
      final months = (difference.inDays % 365) ~/ 30;
      return '$years năm $months tháng';
    }
  }