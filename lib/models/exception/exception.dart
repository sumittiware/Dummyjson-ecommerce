class MyHttpException implements Exception {
  final String code;
  final String message;

  MyHttpException({
    required this.message,
    required this.code,
  });

  @override
  String toString() {
    return message;
  }
}
