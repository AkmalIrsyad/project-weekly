import 'package:whatsapp/data/model/status_model.dart';
import 'package:whatsapp/data/model/channel_model.dart';

final StatusModel myStatus = StatusModel(name: 'My Status', seed: 'myself');

final List<StatusModel> recentUpdates = [
  StatusModel(
    name: 'Andi',
    seed: 'andi99',
    time: '10 minutes ago',
    hasStory: true,
  ),
  StatusModel(
    name: 'Sari',
    seed: 'sari21',
    time: '25 minutes ago',
    hasStory: true,
  ),
  StatusModel(name: 'Budi', seed: 'budi55', time: '1 hour ago', hasStory: true),
  StatusModel(
    name: 'Dewi',
    seed: 'dewi88',
    time: '2 hours ago',
    hasStory: true,
  ),
];

final List<StatusModel> viewedUpdates = [
  StatusModel(name: 'Reza', seed: 'reza12', time: 'Yesterday', hasStory: true),
  StatusModel(name: 'Nita', seed: 'nita34', time: 'Yesterday', hasStory: true),
];

final List<ChannelModel> channels = [
  ChannelModel(
    name: 'Flutter Dev',
    seed: 'flutter',
    followers: '120K',
    verified: true,
  ),
  ChannelModel(
    name: 'UI Design',
    seed: 'uidesign',
    followers: '85K',
    verified: true,
  ),
  ChannelModel(
    name: 'Tech News',
    seed: 'technews',
    followers: '200K',
    verified: false,
  ),
  ChannelModel(
    name: 'Dart Lang',
    seed: 'dartlang',
    followers: '45K',
    verified: true,
  ),
];
