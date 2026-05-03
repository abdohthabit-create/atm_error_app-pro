class ErrorCode {
  final String code;
  final String title;
  final String description;
  final String solution;

  ErrorCode({
    required this.code,
    required this.title,
    required this.description,
    required this.solution,
  });

  factory ErrorCode.fromJson(Map<String, dynamic> json) {
    return ErrorCode(
      code: json['code'],
      title: json['title'],
      description: json['description'],
      solution: json['solution'],
    );
  }
}
