import 'package:flutter/material.dart';
import 'package:whatsapp/data/model/channel_model.dart';

class UpdatesSectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const UpdatesSectionHeader({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class ChannelTile extends StatelessWidget {
  final ChannelModel channel;

  const ChannelTile({super.key, required this.channel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://api.dicebear.com/7.x/personas/png?seed=${channel.seed}',
        ),
      ),
      title: Row(
        spacing: 4,
        children: [
          Text(
            channel.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          if (channel.verified)
            const Icon(Icons.verified, color: Colors.blue, size: 16),
        ],
      ),
      subtitle: Text('${channel.followers} followers'),
      trailing: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.green),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text('Follow', style: TextStyle(color: Colors.green)),
      ),
    );
  }
}
