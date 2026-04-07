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
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Status Section ──
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: Text(
                'Status',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),

            // ── Status Cards Horizontal ──
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  StatusCard(status: myStatus, isMe: true),
                  ...recentUpdates.map((s) => StatusCard(status: s)),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Channels Section ──
            UpdatesSectionHeader(
              title: 'Channels',
              trailing: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: const Text(
                  'Explore',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),

            // ── Channel List ──
            ...channels.map(
              (c) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://api.dicebear.com/7.x/personas/png?seed=${c.seed}',
                  ),
                ),
                title: Row(
                  spacing: 4,
                  children: [
                    Text(
                      c.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    if (c.verified)
                      const Icon(Icons.verified, color: Colors.blue, size: 16),
                  ],
                ),
                subtitle: Text(
                  c.lastMessage ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      c.time ?? '',
                      style: const TextStyle(color: Colors.green, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    if (c.unreadCount > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${c.unreadCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),

      // FAB
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 12,
        children: [
          FloatingActionButton(
            heroTag: 'edit',
            mini: true,
            backgroundColor: Colors.grey.shade800,
            onPressed: () {},
            child: const Icon(Icons.edit, color: Colors.white),
          ),
          FloatingActionButton(
            heroTag: 'camera',
            backgroundColor: Colors.green,
            onPressed: () {},
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
