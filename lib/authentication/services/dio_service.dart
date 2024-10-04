import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sigma/authentication/services/dio_endpoints.dart';
import 'package:sigma/authentication/services/dio_interceptor.dart';
import 'package:sigma/data/database.dart';

class DioService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: DioEndpoints.baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  DioService() {
    _dio.interceptors.add(DioInterceptor());
  }

  Future<String?> saveLocalToServer(AppDatabase appdatabase) async {
    Map<String, dynamic> localData =
        await LocalDataHandler().localDataToMap(appdatabase: appdatabase);
    try {
      await _dio.put(
        DioEndpoints.scheduleLists,
        data: json.encode(
          localData["scheduleLists"],
        ),
      );
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        return e.response!.data!.toString();
      } else {
        return e.message;
      }
    } on Exception {
      return "Um erro aconteceu!";
    }
    return null;
  }

  getDataFromServer(AppDatabase appDatabase) async {
    Response response = await _dio.get(
      DioEndpoints.scheduleLists,
      queryParameters: {
        "orderBy": '"name"',
        "startAt": 0,
      },
    );
    // print(response.statusCode);
    // print(response.headers.toString());
    // print(response.data);
    // print(response.data.runtimeType);

    if (response.data != null) {
      Map<String, dynamic> map = {};

      if (response.data.runtimeType == List) {
        if ((response.data as List<dynamic>).isNotEmpty) {
          map["scheduleLists"] = response.data;
        }
      } else {
        List<Map<String, dynamic>> tempList = [];

        for (var mapResponse in (response.data as Map).values) {
          tempList.add(mapResponse);
        }
        map["scheduleLists"] = tempList;
      }
      await LocalDataHandler().mapToLocalData(
        map: map,
        appdatabase: appDatabase,
      );
    }
  }

  Future<void> clearServerData() async {
    await _dio.delete(
      DioEndpoints.scheduleLists,
    );
  }
}
