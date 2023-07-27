import 'dart:convert';

import 'package:ecom_app/models/exception/exception.dart';

import '../../models/response/api_response.dart';
import 'package:http/http.dart' as http;

class PaginatedApiService {
  String baseUrl = 'https://dummyjson.com/';
  String endPoint;
  int limit;

  int? total;
  int skip = 0;

  PaginatedApiService({
    required this.endPoint,
    this.limit = 10,
  });

  Future<ApiResponse> get(user) async {
    if (total != null && (total! == skip)) {
      throw MyHttpException(
        code: "2",
        message: "No more date to load!",
      );
    }
    final uri = Uri.parse('$baseUrl$endPoint?skip=$skip&limit=$limit');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw MyHttpException(
        code: "1",
        message: "Unable to fetch data!",
      );
    }

    final data = json.decode(response.body);

    final apiResponse = ApiResponse.fromJson(endPoint, data);
    skip = apiResponse.skip + limit;
    total = apiResponse.total;

    return apiResponse;
  }
}
