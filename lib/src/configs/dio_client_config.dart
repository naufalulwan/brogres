import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import '../global/constants/url_string.dart';
import '../global/global.dart';

class DioClientConfig {
  late Dio dio;

  DioClientConfig() {
    dio = Dio(
      BaseOptions(
        baseUrl: UrlString.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        error: false,
        maxWidth: 90,
        logPrint: (object) => PrintHelper.logInfo(object),
        enabled: kDebugMode,
        filter: (options, args) {
          return !args.isResponse || !args.hasUint8ListData;
        }));

    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: PrintHelper.logWarning,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
  }
}

class DioClient {
  DioClientConfig dioClient;
  DioClient.create(this.dioClient);
  DioClient._(this.dioClient);
  static DioClient get instance => DioClient.create(DioClientConfig());
}
