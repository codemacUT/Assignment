class MatchModel {
  final int id;
  final String title;
  final String body;

  MatchModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
