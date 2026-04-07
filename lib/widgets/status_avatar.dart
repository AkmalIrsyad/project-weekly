import 'package:flutter/material.dart';
import 'package:whatsapp/data/model/status_model.dart';

class StatusAvatar extends StatelessWidget {
  final StatusModel status;
  final bool isMe;

  const StatusAvatar({super.key, required this.status, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: status.hasStory
                      ? Border.all(color: Colors.green, width: 2.5)
                      : Border.all(color: Colors.transparent, width: 2.5),
                ),
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                    'https://api.dicebear.com/7.x/personas/png?seed=${status.seed}',
                  ),
                ),
              ),
              if (isMe)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: const Icon(Icons.add, size: 16, color: Colors.white),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            status.name,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
