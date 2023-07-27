class ApiResponse {
  final List<dynamic> items;
  final int total;
  final int limit;
  final int skip;

  ApiResponse({
    required this.items,
    required this.limit,
    required this.skip,
    required this.total,
  });

  factory ApiResponse.fromJson(String endPoint, Map<String, dynamic> json) {
    return ApiResponse(
      items: json[endPoint],
      limit: json['limit'],
      skip: json['skip'],
      total: json['total'],
    );
  }
}
