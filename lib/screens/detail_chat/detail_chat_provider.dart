
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp/data/enum/message_status.dart';
import 'package:whatsapp/data/local_chat_data_provider.dart';
import 'package:whatsapp/data/model/chat.dart';

class DetailChatProvider extends ChangeNotifier {

  late String _contactName = "";
  late final List<Chat> _chats = [];
  late final ScrollController _scrollController = ScrollController();

  String get contactName => _contactName;
  List<Chat> get chats => _chats;
  ScrollController get scrollController => _scrollController;

  void loadMessages(double chatID) {
    final chatList = LocalChatDataProvider.messages.where((chat) => chat.chatID == chatID);
    _contactName = chatList.first.name;

    _chats.clear();
    _chats.addAll(chatList);
    notifyListeners();
  }

  void send(String message) {
    final chatToSend = Chat(
        id: Random().nextDouble(),
        chatID: double.maxFinite,
        name: _contactName,
        message: message,
        timeInMillis: DateTime.now().millisecondsSinceEpoch,
        isMe: true,
        status: MessageStatus.read
    );

    Future.delayed(
      Duration(seconds: 2),
      () {
        final targetChat = Chat(
            id: Random().nextDouble(),
            chatID: double.maxFinite,
            name: _contactName,
            message: "{Placeholder balasan chat}",
            timeInMillis: DateTime.now().millisecondsSinceEpoch,
            isMe: false,
            status: MessageStatus.read
        );

        _chats.add(targetChat);
        notifyListeners();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        });
      }
    );

    _chats.add(chatToSend);
    notifyListeners();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

}
