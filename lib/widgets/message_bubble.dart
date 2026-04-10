import 'package:flutter/material.dart';
import 'package:whatsapp/data/model/chat.dart';
import 'package:whatsapp/utils/color.dart';
import 'package:whatsapp/utils/time.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: chat.isMe ? AppColors.teaGreen : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: chat.isMe ? const Radius.circular(12) : Radius.zero,
          bottomRight: chat.isMe ? Radius.zero : const Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(chat.message, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                formatTime(chat.timeInMillis),
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
              if (chat.isMe) ...[
                const SizedBox(width: 4),
                const Icon(Icons.done_all, size: 16, color: AppColors.blue),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
