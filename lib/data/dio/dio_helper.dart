import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pro_mina_task/presentation/managers/url_manager.dart';
import '../../presentation/managers/constant_manager.dart';
import '../../presentation/managers/storage_manager.dart';


class DioHelper {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: UrlManager.baseURL,
      headers: {
        'Authorization':
            'Bearer ${StorageManager.mainStorage.read(ConstantsManager.tokenKey)}',
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );

  Future<dynamic> getData(url) async {
    late Response response;

    try {
      response = await dio.get(url);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return Future.value(jsonDecode(jsonEncode(response.data)));
  }

  Future<dynamic> postData(url, data) async {
    late Response response;

    try {
      response = await dio.post(url, data: FormData.fromMap(data));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return Future.value(jsonDecode(jsonEncode(response.data)));
  }

  Future<dynamic> patchData(url, data) async {
    late Response response;

    try {
      response = await dio.patch(url, data: FormData.fromMap(data));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return Future.value(jsonDecode(jsonEncode(response.data)));
  }

  Future<dynamic> deleteData(url, data) async {
    late Response response;

    try {
      response = await dio.delete(url, data: FormData.fromMap(data));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return Future.value(jsonDecode(jsonEncode(response.data)));
  }
}
