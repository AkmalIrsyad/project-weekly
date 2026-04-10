import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/widgets/chat_input_field.dart';
import 'package:whatsapp/widgets/message_bubble.dart';

import '../../utils/color.dart';
import 'detail_chat_provider.dart';

class DetailChatScreen extends StatefulWidget {
  const DetailChatScreen({super.key, required this.chatID});

  final double chatID;

  @override
  State createState() => _DetailChatScreenState();
}

class _DetailChatScreenState extends State<DetailChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailChatProvider>(builder: (ctx, provider, child) {
      return Scaffold(
        backgroundColor: AppColors.lightGray,
        // Appbar
        appBar: AppBar(
          title: Row(
            spacing: 12,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://api.dicebear.com/7.x/personas/png?seed=3232',
                ),
              ),
              Text(provider.contactName),
            ],
          ),
          centerTitle: false,
          leadingWidth: 25,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.video_call_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),

        // Body
        body: Container(
          // Wallpaper Chat
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/chat_wallpaper.jpg'),
              fit: BoxFit.cover,
              opacity: 0.5, // Atur transparansi wallpaper (0.0 - 1.0)
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: provider.scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: provider.chats.length,
                  itemBuilder: (context, index) {
                    final chat = provider.chats[index];

                    return Align(
                      alignment: chat.isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: MessageBubble(chat: chat),
                    );
                  },
                ),
              ),

              // Input Area
              ChatInputField(
                onSubmit: (message) {
                  provider.send(message);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    // Load chat setelah frame pertama di render
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DetailChatProvider>().loadMessages(widget.chatID);
    });
  }
}
