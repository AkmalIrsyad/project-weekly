
import 'package:flutter/material.dart';
import 'package:whatsapp/data/local_chat_data_provider.dart';
import 'package:whatsapp/data/model/chat.dart';

class DetailChatProvider extends ChangeNotifier {

  late String _contactName = "";
  late List<Chat> _chats = [];

  String get contactName => _contactName;
  List<Chat> get chats => _chats;

  void loadMessages(int chatID) {
    final chatList = LocalChatDataProvider.messages.where((chat) => chat.chatID == chatID);
    _contactName = chatList.first.name;

    _chats.clear();
    _chats.addAll(chatList);
    notifyListeners();
  }

}
