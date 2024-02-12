import 'package:dio/dio.dart';
import 'package:weatherapp/data/network/api_endpoints.dart';

abstract class ClientFactory {
  static ClientHttp getInstance() {
    Dio dio = Dio();
    dio.options.baseUrl = ApiEndpoints.baseUrl;
    ClientHttp client = ClientHttp(dio);
    return client;
  }
}

class ClientHttp with DioMixin {
  final Dio _dio;
  ClientHttp(this._dio);
  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      data: data,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}

class ClientHttpException extends DioException {
  ClientHttpException({
    required RequestOptions requestOptions,
    Response<dynamic>? response,
    String? message,
    StackTrace? stackTrace,
  }) : super(
            requestOptions: requestOptions,
            response: response,
            message: message,
            stackTrace: stackTrace);
}
