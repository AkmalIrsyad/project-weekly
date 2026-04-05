import '../enum/message_status.dart';

class Chat {

  String name;
  String message;
  int timeInMillis;
  bool isMe;
  MessageStatus status;

  Chat({
    required this.name,
    required this.message,
    required this.timeInMillis,
    required this.isMe,
    required this.status
  });

}
