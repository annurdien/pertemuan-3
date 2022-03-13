import 'package:dio/dio.dart';
import 'package:pertemuan_3/core/api.dart';
import 'package:riverpod/riverpod.dart';

final httpProvider = Provider<RestClient>((ref) {
  final dio = Dio()
    ..options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    }
    ..options.receiveTimeout = 30000
    ..options.connectTimeout = 30000;

  const String baseUrl = "https://api.quotable.io/";

  return RestClient(dio, baseUrl: baseUrl);
});
