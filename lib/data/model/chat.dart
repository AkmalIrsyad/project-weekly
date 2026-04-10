import '../enum/message_status.dart';

class Chat {

  double id; // ID untuk bubble chat
  double chatID; // ID percakapan (grup/personal)
  String name;
  String message;
  int timeInMillis;
  bool isMe;
  MessageStatus status;

  Chat({
    required this.id,
    required this.chatID,
    required this.name,
    required this.message,
    required this.timeInMillis,
    required this.isMe,
    required this.status
  });

}
