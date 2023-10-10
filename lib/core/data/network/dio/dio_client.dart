import 'dart:convert';

import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:dio/dio.dart';

import 'configs/dio_configs.dart';

class DioClient {
  final DioConfigs dioConfigs;
  final Dio _dio;

  final SharedPreferenceHelper storage = getIt<SharedPreferenceHelper>();

  DioClient({required this.dioConfigs})
      : _dio = Dio()
          ..options.baseUrl = dioConfigs.baseUrl
          ..options.connectTimeout =
              Duration(milliseconds: dioConfigs.connectionTimeout)
          ..options.receiveTimeout =
              Duration(milliseconds: dioConfigs.receiveTimeout) {
    initDio();
  }
  initDio() async {
    _dio.options.headers = await addAuthorOpt();
  }

  Dio get dio => _dio;

  String get url => Endpoints.baseUrl;

  Dio addInterceptors(Iterable<Interceptor> interceptors) {
    return _dio..interceptors.addAll(interceptors);
  }

  Future<Response> getData(String path) async {
    _dio.options.headers = await addAuthorOpt();
    try {
      var response = await _dio.get(path);
      return response;
    } on DioException catch (ex) {
      throw Exception(json.decode(ex.response.toString())['error']);
    }
  }

  Future<Response> postData(String path, dynamic data) async {
    _dio.options.headers = await addAuthorOpt();
    try {
      var response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (ex) {
      throw Exception(json.decode(ex.response.toString())['message']);
    }
  }

  Future<Map<String, dynamic>?> addAuthorOpt() async {
    var token = await storage.authToken;
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
}
