class Feedback {
  final String type;
  final String message;

  Feedback({required this.type, required this.message});

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(type: json['type'], message: json['message']);
  }
}
