import 'package:dio/dio.dart';
import 'api_client_exception.dart';

class ApiClient {
  String apiUrl = 'https://www.alphavantage.co/';

  final Dio _dio = Dio();

  ApiClient();

  Future<dynamic> makeRequest({
    required String path,
    dynamic body,
  }) async {
    Response? response;
    Options? options;

    try {
      _dio.options.baseUrl = apiUrl;

      response = await _dio.get(
        path,
        options: options,
      );

      return response.data;

    } on DioException catch (e) {
      throw ApiClientException(
        originalException: e,
        httpStatusCode: e.response?.statusCode ?? 0,
        appErrorCode: e.response?.data['code'],
        appErrorMessage: e.response?.data['message'],
      );
    } catch (e) {
      rethrow;
    }
  }
}
