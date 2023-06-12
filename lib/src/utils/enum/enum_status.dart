enum StatusChanel {
  sttnew,
  sttcanceled,
  sttrejected,
  sttpublic,
  sttaccepted,
  sttwaiting,
}
extension StatusChanelExtension on StatusChanel {
  String getString() {
    switch (this) {
      case StatusChanel.sttnew:
        return "NEW";
      case StatusChanel.sttcanceled:
        return "CANCELED";
      case StatusChanel.sttrejected:
        return "REJECTED";
      case StatusChanel.sttpublic:
        return "PUBLIC";
      case StatusChanel.sttaccepted:
        return "ACCEPTED";
      case StatusChanel.sttwaiting:
        return "ACCEPTED";
      default:
        return "PUBLIC"; // Giá trị mặc định khi không tìm thấy giá trị tương ứng
    }
  }
}