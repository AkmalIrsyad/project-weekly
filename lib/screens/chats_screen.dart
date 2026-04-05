import 'package:flutter/material.dart';
import 'package:whatsapp/data/message.dart';
import 'package:whatsapp/screens/detail_chat_screen.dart';
import 'package:whatsapp/utils/color.dart';
import 'package:whatsapp/utils/time.dart';

import '../data/enum/message_status.dart';
import '../data/local_chat_data_provider.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  // Filter yang tersedia
  final List<String> _filters = ['All', 'Unread', 'Favourites', 'Groups'];
  String _selectedFilter = 'All';

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
          preferredSize: Size.fromHeight(100),
          child: Column(
            children: [
              // Search Bar
              Container(
                height: 45,
                margin: EdgeInsets.symmetric(
                  horizontal: 14,
                ).copyWith(bottom: 8),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(30),
                ),
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

              // Chat Filters
              SizedBox(
                height: 45,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  itemCount: _filters.length,
                  separatorBuilder: (_, __) => SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final filter = _filters[index];
                    final isSelected = _selectedFilter == filter;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.green.shade100
                              : AppColors.lightGray,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? Colors.green
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected ? Colors.green : Colors.black54,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Body
      body: ListView.builder(
        itemCount: LocalChatDataProvider.messages.length,
        itemBuilder: (context, index) {
          final chat = LocalChatDataProvider.messages[index];

          return ListTile(
            // title
            title: Text(
              chat.name,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            // subTitle
            subtitle: Builder(builder: (ctx) {

              // Kalo pengirimnya kita, ubag layoutnya, kasih status pengiriman
              if (chat.isMe) {
                return Row(
                  children: [
                    switch (chat.status) {
                      MessageStatus.pending => const Icon(Icons.access_time_rounded, size: 16, color: Colors.grey),
                      MessageStatus.sent => const Icon(Icons.done, size: 16, color: Colors.grey),
                      MessageStatus.delivered => const Icon(Icons.done_all, size: 16, color: Colors.grey),
                      MessageStatus.read => const Icon(Icons.done_all, size: 16, color: Colors.blue),
                    },
                    const SizedBox(width: 4),
                    Text(chat.message)
                  ],
                );
              }

              return Text(chat.message);
            }),

            // leading
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://api.dicebear.com/7.x/personas/png?seed=$index',
              ),
            ),

            // trailing
            trailing: Text(formatTime(chat.timeInMillis)),

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
        mainAxisAlignment: MainAxisAlignment.end,
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
