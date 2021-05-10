import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeRepository extends Disposable {
  Dio _dio;

  HomeRepository() {
    _dio = Dio();
    _dio.interceptors.add(LogInterceptor(responseBody: true, logPrint: print));

    _dio.options.baseUrl = 'https://dog.ceo/api/';
    _dio.options.connectTimeout = 150 * 1000;
    _dio.options.receiveTimeout = 130 * 1000;
  }

  Future<List> getAllBreeds() async {
    final Response<dynamic> response = await _dio.get('breeds/list/all');

    print(response);
    Map<String, dynamic> data = response.data;
    List breeds = data['message']
        .entries
        .map((something) => {
              "name": something.key,
              "sub": something.value,
            })
        .toList();

    print(breeds);

    return breeds;
  }



  @override
  void dispose() {
    _dio.close();
  }
}
