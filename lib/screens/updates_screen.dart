import 'package:flutter/material.dart';
import 'package:whatsapp/data/updates.dart';
import 'package:whatsapp/widgets/status_avatar.dart';
import 'package:whatsapp/widgets/updates_section.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Updates',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Status Section Header ──
            UpdatesSectionHeader(
              title: 'Status',
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit, color: Colors.green),
              ),
            ),

            // ── Horizontal Status List ──
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  StatusAvatar(status: myStatus, isMe: true),
                  ...recentUpdates.map((s) => StatusAvatar(status: s)),
                ],
              ),
            ),

            // ── Recent Updates List ──
            const UpdatesSectionHeader(title: 'Recent updates'),
            ...recentUpdates.map(
              (s) => ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 2.5),
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://api.dicebear.com/7.x/personas/png?seed=${s.seed}',
                    ),
                  ),
                ),
                title: Text(
                  s.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(s.time ?? ''),
              ),
            ),

            // ── Viewed Updates List ──
            const UpdatesSectionHeader(title: 'Viewed updates'),
            ...viewedUpdates.map(
              (s) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://api.dicebear.com/7.x/personas/png?seed=${s.seed}',
                  ),
                ),
                title: Text(
                  s.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(s.time ?? ''),
              ),
            ),

            const Divider(thickness: 8, color: Color(0xFFF0F0F0)),

            // ── Channels Section ──
            UpdatesSectionHeader(
              title: 'Channels',
              trailing: TextButton(
                onPressed: () {},
                child: const Text(
                  'Explore',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),

            ...channels.map((c) => ChannelTile(channel: c)),

            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
    );
  }
}
