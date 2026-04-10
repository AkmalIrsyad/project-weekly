import 'package:whatsapp/data/model/status_model.dart';
import 'package:whatsapp/data/model/channel_model.dart';

// Single object, bukan List
final StatusModel myStatus = StatusModel(name: 'Add status', seed: 'myself');

final List<StatusModel> recentUpdates = [
  StatusModel(
    name: 'Ammar Ug',
    seed: 'andi99',
    time: '10 minutes ago',
    hasStory: true,
  ),
  StatusModel(
    name: 'Arif Agar Supaya',
    seed: 'sari21',
    time: '25 minutes ago',
    hasStory: true,
  ),
  StatusModel(
    name: 'Royyy',
    seed: 'budi55',
    time: '1 hour ago',
    hasStory: true,
  ),
  StatusModel(
    name: 'Dewi',
    seed: 'dewi88',
    time: '2 hours ago',
    hasStory: true,
  ),
];

final List<ChannelModel> channels = [
  ChannelModel(
    name: 'Flutter Dev',
    seed: 'flutter',
    followers: '120K',
    verified: true,
    lastMessage: 'New Flutter 3.x release is out!',
    time: '09:20',
    unreadCount: 1,
  ),
  ChannelModel(
    name: 'UI Design',
    seed: 'uidesign',
    followers: '85K',
    verified: true,
    lastMessage: 'This week\'s top design trends...',
    time: '04:07',
    unreadCount: 27,
  ),
  ChannelModel(
    name: 'Tech News',
    seed: 'technews',
    followers: '200K',
    verified: false,
    lastMessage: '📷 Photo',
    time: '03:00',
    unreadCount: 7,
  ),
  ChannelModel(
    name: 'Dart Lang',
    seed: 'dartlang',
    followers: '45K',
    verified: true,
    lastMessage: 'Hari terakhir join Academy...',
    time: 'Yesterday',
    unreadCount: 78,
  ),
  ChannelModel(
    name: 'erico dev',
    seed: 'dartlang',
    followers: '45K',
    verified: true,
    lastMessage: 'Promo Hari Raya',
    time: 'Yesterday',
    unreadCount: 100,
  ),
];
