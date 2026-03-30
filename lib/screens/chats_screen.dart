import 'package:flutter/material.dart';
import 'package:whatsapp/data/message.dart';
import 'package:whatsapp/screens/detail_chat_screen.dart';
import 'package:whatsapp/utils/color.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text(
          'WhatsApp',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],

        // Bottom AppBar
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(45),
          // Search Bar
          child: Container(
            height: 45,
            margin: EdgeInsets.symmetric(horizontal: 14).copyWith(bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(30),
            ),

            // Widget Layout untuk menyusun widget secara horizontal atau dari kiri ke kanan
            child: Row(
              spacing: 9,
              children: [
                Icon(Icons.search, color: Colors.black54),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ask Meta AI or Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Body
      body: ListView.builder(
        itemCount: dummyChats.length,
        itemBuilder: (context, index) {
          final message = dummyChats[index];
          return ListTile(
            // title
            title: Text(
              message['name']!,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            // subTitle
            subtitle: Text(message['message']!),

            // leading
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://api.dicebear.com/7.x/personas/png?seed=$index',
              ),
            ),

            // trailing
            trailing: Text(message['time']!),

            // onTap
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailChatScreen()),
              );
            },
          );
        },
      ),

      // FloatingActionButton
      floatingActionButton: Column(
        spacing: 20,
        mainAxisAlignment: .end,
        children: [
          FloatingActionButton.small(
            heroTag: '1',
            backgroundColor: AppColors.backgroundColor,
            onPressed: () {},
            child: Image.network(
              height: 30,
              width: 30,
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Meta_AI_Logo_%28Ring_Only%29.png/120px-Meta_AI_Logo_%28Ring_Only%29.png',
            ),
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {},
            child: Icon(Icons.message),
          ),
        ],
      ),
    );
  }
}
