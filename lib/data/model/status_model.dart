class StatusModel {
  final String name;
  final String seed;
  final String? time;
  final bool hasStory;

  const StatusModel({
    required this.name,
    required this.seed,
    this.time,
    this.hasStory = false,
  });
}
