import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../network/api_constance.dart';

class DioLogger {
  static Dio getDio() {
    Dio dio = Dio();

    dio.options.baseUrl = ApiConstance.baseUrl;

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZWZiNTZhMzVhYWI5YTcxMGExZjA4ODEyZGFhMGE4MSIsInN1YiI6IjYxNDBkZDJkMTQ5NTY1MDA2NDU1ODA2MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KMciUOvbvu4jJ-Yso40z4mskkr7UgHOcXYZArh5voh8',
    };
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        request: true,
        compact: true,
        error: true,
        responseHeader: true,
        logPrint: (object) {
          debugPrint(object.toString());
        },
      ),
    );
    return dio;
  }
}
