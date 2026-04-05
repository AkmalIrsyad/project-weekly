
import 'package:flutter/material.dart';
import 'package:whatsapp/data/enum/message_status.dart';
import 'package:whatsapp/data/local_chat_data_provider.dart';
import 'package:whatsapp/data/model/chat.dart';

class ChatProvider extends ChangeNotifier {

  final List<Chat> _chats = [];
  final List<String> _filters = ['All', 'Unread', 'Favourites', 'Groups'];
  String _selectedFilter = 'All';

  List<Chat> get chats => _chats;
  List<String> get filters => _filters;
  String get selectedFilter => _selectedFilter;

  void loadChats() {
    _chats.clear();
    _chats.addAll(LocalChatDataProvider.messages);

    notifyListeners();
  }

  void setFilter(String filter) {
    _selectedFilter = filter;
    _chats.clear();
    
    switch (filter) {
      case "All":
        _chats.addAll(LocalChatDataProvider.messages);
        break;
      case "Unread":
        _chats.addAll(
            LocalChatDataProvider.messages.where((chat) => !chat.isMe && chat.status != MessageStatus.read)
        );

        break;
      case "Favourites":
        // todo: pass
        break;
      case "Groups":
        // todo: pass
        break;
    }

    notifyListeners();
  }

}
