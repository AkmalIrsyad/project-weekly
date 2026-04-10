class ChannelModel {
  final String name;
  final String seed;
  final String followers;
  final bool verified;
  final String? lastMessage;
  final String? time;
  final int unreadCount;

  const ChannelModel({
    required this.name,
    required this.seed,
    required this.followers,
    required this.verified,
    this.lastMessage,
    this.time,
    this.unreadCount = 0,
  });
}
