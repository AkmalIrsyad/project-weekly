import 'package:flutter/material.dart';

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
  final String name;
  final String seed;
  final String followers;
  final bool verified;

  const ChannelTile({
    super.key,
    required this.name,
    required this.seed,
    required this.followers,
    required this.verified,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://api.dicebear.com/7.x/personas/png?seed=$seed',
        ),
      ),
      title: Row(
        spacing: 4,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
          if (verified)
            const Icon(Icons.verified, color: Colors.blue, size: 16),
        ],
      ),
      subtitle: Text('$followers followers'),
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
