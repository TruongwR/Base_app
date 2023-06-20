
// ignore_for_file: constant_identifier_names

enum ChatMessageType { file, audio, image, video }
extension TypeFileExtension on ChatMessageType {
  String getString() {
    switch (this) {
      case ChatMessageType.file:
        return "FILE";
    case ChatMessageType.audio:
        return "AUDIO";
        case ChatMessageType.image:
        return "IMAGE";
        case ChatMessageType.video:
        return "VIDEO";
      default:
        return ""; // Giá trị mặc định khi không tìm thấy giá trị tương ứng
    }
  }
}
enum MessageStatus { notSent, notView, viewed }
enum StatusChanel {
  sttnew,
  sttcanceled,
  sttrejected,
  sttpublic,
  sttaccepted,
  sttwaiting,
}

enum TypeChanel {
  sttPRIVATE,
  sttDEFAULT,
  sttPROTECTED,
  sttPUBLIC,
}

enum TypeMessage {
  sttSETTING,
  sttMESSAGE, text,
}

extension TypeMessageExtension on TypeMessage {
  String getString() {
    switch (this) {
      case TypeMessage.sttMESSAGE:
        return "MESSAGE ";
      case TypeMessage.sttSETTING:
        return "SETTING";
      default:
        return "MESSAGE"; // Giá trị mặc định khi không tìm thấy giá trị tương ứng
    }
  }
}

extension TypeChanelExtension on TypeChanel {
  String getString() {
    switch (this) {
      case TypeChanel.sttDEFAULT:
        return "DEFAULT";
      case TypeChanel.sttPRIVATE:
        return "PRIVATE";
      case TypeChanel.sttPROTECTED:
        return "PROTECTED";
      case TypeChanel.sttPUBLIC:
        return "PUBLIC";
      default:
        return "PUBLIC"; // Giá trị mặc định khi không tìm thấy giá trị tương ứng
    }
  }
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

enum TimeUnit {
  Minute,
  Hour,
  Day,
  Week,
  Month,
  Year,
}
