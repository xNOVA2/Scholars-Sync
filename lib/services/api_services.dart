// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class APIService {
  final Dio _dio = Dio();
  final String baseURL="https://scholar-sync-be-r58o.vercel.app/api";

  APIService._() {
    _initializeInterceptors();
  }

  void _initializeInterceptors() {
    // _dio.interceptors.add(PrettyDioLogger());
    // _dio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: false,
    //   responseHeader: false,
    //   error: true,
    //   compact: true,
    //   maxWidth: 90,
    // ));
  }

  static final APIService _instance = APIService._();

  factory APIService() {
    return _instance;
  }

  Future<Map<String, dynamic>> post(String endpoint, Object? data) async {
    try {
      final response = await _dio.post(baseURL + endpoint, data: data);
      return {'success': true, "data": response.data['data']};
    } catch (e) {
      return {'success': false, "data": e};
    }
  }

  Future<Map<String, dynamic>> put(String endpoint, Object? data) async {
    try {
      final response = await _dio.put(baseURL + endpoint, data: data);
      return {'success': true, "data": response.data['data']};
    } catch (e) {
      return {'success': false, "data": e};
    }
  }

  Future<Map<String, dynamic>> get(String endpoint, Object? data) async {
    try {
      final response = await _dio.get(baseURL + endpoint, data: data);
      return {'success': true, "data": response.data['data']};
    } catch (e) {
      return {'success': false, "data": e};
    }
  }
}

APIService apiService = APIService();
