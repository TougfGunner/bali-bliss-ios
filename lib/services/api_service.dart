import 'package:dio/dio.dart';

class ApiService {
  static const String _baseUrl = 'https://baliblissweddings.com/api';

  late final Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ));

    _dio.interceptors.add(LogInterceptor(
      requestBody: false,
      responseBody: false,
      logPrint: (obj) => debugPrint(obj.toString()),
    ));
  }

  Future<List<Map<String, dynamic>>> getVendors({String? category}) async {
    try {
      final resp = await _dio.get('/vendors', queryParameters: {
        if (category != null) 'category': category,
        'site': 'bali',
      });
      final data = resp.data as List? ?? [];
      return data.cast<Map<String, dynamic>>();
    } catch (e) {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMagazineArticles() async {
    try {
      final resp = await _dio.get('/magazine/articles', queryParameters: {'site': 'bali'});
      final data = resp.data as List? ?? [];
      return data.cast<Map<String, dynamic>>();
    } catch (e) {
      return [];
    }
  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final resp = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });
      return resp.data as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getMe() async {
    try {
      final resp = await _dio.get('/auth/me');
      return resp.data as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  void debugPrint(String msg) {
    // ignore: avoid_print
    print('[ApiService] $msg');
  }
}
