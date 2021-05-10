import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailRepository extends Disposable {
  Dio _dio;

  DetailRepository() {
    _dio = Dio();
    _dio.interceptors.add(LogInterceptor(responseBody: true, logPrint: print));

    _dio.options.baseUrl = 'https://dog.ceo/api/';
    _dio.options.connectTimeout = 150 * 1000;
    _dio.options.receiveTimeout = 130 * 1000;
  }

  Future<List> getImagesOfBreed(String breed) async {
    final Response<dynamic> response = await _dio.get('breed/$breed/images');

    print(response);
    Map<String, dynamic> data = response.data;
    List images = data['message'];

    print(images);

    return images;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _dio.close();
  }
}
