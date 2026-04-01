import 'package:flutter/material.dart';
import 'package:whatsapp/data/message.dart';
import 'package:whatsapp/widgets/chat_input_field.dart';
import 'package:whatsapp/widgets/message_bubble.dart';
import '../utils/color.dart';

class DetailChatScreen extends StatelessWidget {
  const DetailChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text('Budi'),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isMe = message['isMe'];

                  return Align(
                    alignment: isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: MessageBubble(isMe: isMe, message: message),
                  );
                },
              ),
            ),

            // Input Area
            ChatInputField(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
