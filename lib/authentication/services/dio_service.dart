// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigma/authentication/services/dio_endpoints.dart';

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

  Future<Response> postLogin(String email, String password) async {
    print('${DioEndpoints.baseUrl}/login/paciente');
    try {
      final postApi = await _dio.post(
        "${DioEndpoints.baseUrl}/login/paciente",
        data: {
          "email": email,
          // sigma@uscs.com.br
          "password": password,
          // 123@Mudar
        },
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('apiResponse', postApi.data.toString());
      prefs.getString('apiResponse');
      print('login: $email, senha: $password');
      print('apiResponse: ${postApi.data}');
      print('apiResponse: ${postApi.data.runtimeType}');
      print('FOOOOOOOOOOOOOOOOOOOOOOI');
      return postApi;
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dados da resposta: ${e.response!.data}');
        print('Cabeçalhos da resposta: ${e.response!.headers}');
        print('Status code: ${e.response!.statusCode}');
        print('erroooooooooooooooooooooooooooooooooooo');
      } else {
        print('Erro sem resposta: ${e.requestOptions}');
      }
    } on Exception catch (e) {
      print('Erro inesperado: $e');
    }
    throw Exception('Erro ao fazer login');
  }

  Future<Response> postRegister(
    String email,
    String password,
    String name,
    String birthDate,
    String gender,
    String cpf,
    String cidcard,
    String address,
    //String phone,
  ) async {
    print('${DioEndpoints.baseUrl}/cadastrar/paciente');
    try {
      final postApi = await _dio.post(
        "${DioEndpoints.baseUrl}/cadastrar/paciente",
        data: {
          "email": email,
          // sigma@uscs.com.br
          "password": password,
          // 123@Mudar
          "name": name,
          "data_nascimento": birthDate,
          "genero": gender,
          "cpf": cpf,
          "cid_card": cidcard,
          "endereco": address,
          //"telefone": phone,
        },
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('apiResponse', postApi.data.toString());
      prefs.getString('apiResponse');
      print('login: $email, senha: $password');
      print('apiResponse: ${postApi.data}');
      print('apiResponse: ${postApi.data.runtimeType}');

      return postApi;
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dados da resposta: ${e.response!.data}');
        print('Cabeçalhos da resposta: ${e.response!.headers}');
        print('Status code: ${e.response!.statusCode}');
      } else {
        print('Erro sem resposta: ${e.requestOptions}');
      }
    } on Exception catch (e) {
      print('Erro inesperado: $e');
    }
    throw Exception('Erro ao fazer o cadastro.');
  }

  // Future<String?> saveLocalToServer(AppDatabase appdatabase) async {
  //   Map<String, dynamic> localData =
  //       await LocalDataHandler().localDataToMap(appdatabase: appdatabase);
  //   try {
  //     await _dio.put(
  //       DioEndpoints.scheduleLists,
  //       data: json.encode(
  //         localData["scheduleLists"],
  //       ),
  //     );
  //   } on DioException catch (e) {
  //     if (e.response != null && e.response!.data != null) {
  //       return e.response!.data!.toString();
  //     } else {
  //       return e.message;
  //     }
  //   } on Exception {
  //     return "Um erro aconteceu!";
  //   }
  //   return null;
  // }

  // getDataFromServer(AppDatabase appDatabase) async {
  //   Response response = await _dio.get(
  //     DioEndpoints.scheduleLists,
  //     queryParameters: {
  //       "orderBy": '"name"',
  //       "startAt": 0,
  //     },
  //   );
  //   // print(response.statusCode);
  //   // print(response.headers.toString());
  //   // print(response.data);
  //   // print(response.data.runtimeType);

  //   if (response.data != null) {
  //     Map<String, dynamic> map = {};

  //     if (response.data.runtimeType == List) {
  //       if ((response.data as List<dynamic>).isNotEmpty) {
  //         map["scheduleLists"] = response.data;
  //       }
  //     } else {
  //       List<Map<String, dynamic>> tempList = [];

  //       for (var mapResponse in (response.data as Map).values) {
  //         tempList.add(mapResponse);
  //       }
  //       map["scheduleLists"] = tempList;
  //     }
  //     await LocalDataHandler().mapToLocalData(
  //       map: map,
  //       appdatabase: appDatabase,
  //     );
  //   }
  // }

  // Future<void> clearServerData() async {
  //   await _dio.delete(
  //     DioEndpoints.scheduleLists,
  //   );
  // }
}
