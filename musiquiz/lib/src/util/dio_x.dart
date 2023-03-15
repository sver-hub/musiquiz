import 'package:dio/dio.dart';

extension DioX on Dio {
  Future<Response<Map<String, dynamic>>> getJson(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) =>
      get<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
}

extension ResponseX<T> on Response<T> {
  T get requireData {
    final data = this.data;
    if (data == null) {
      throw StateError('data is null');
    }
    return data;
  }
}
