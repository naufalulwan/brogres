part of '../global.dart';

class DioClient {
  late Dio dio;

  DioClient() {
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
        enabled: kDebugMode,
        filter: (options, args) {
          return !args.isResponse || !args.hasUint8ListData;
        }));

    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: PrintUtil.logWarning,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3)
      ],
    ));
  }
}

class DioClientUtil {
  DioClient dioClient;

  DioClientUtil.create(this.dioClient);

  DioClientUtil._(this.dioClient);

  static DioClientUtil get instance => DioClientUtil.create(DioClient());
}
