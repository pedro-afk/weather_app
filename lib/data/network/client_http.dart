import 'package:dio/dio.dart';
import 'package:weatherapp/data/network/api_endpoints.dart';

abstract class ClientFactory {
  static HttpClient getInstance() {
    HttpClient client = HttpClient();
    client.options.baseUrl = ApiEndpoints.baseUrl;
    return client;
  }
}

class HttpClient extends DioMixin {
  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return super.get(
      path,
      queryParameters: queryParameters,
      data: data,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
