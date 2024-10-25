// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigma/authentication/services/dio_endpoints.dart';

class DioService {
  Map<String, dynamic>? apiData;
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
      await prefs.setString('name', postApi.data['name'] ?? '');
      await prefs.setString('email', postApi.data['email'] ?? '');

      prefs.getString('apiResponse');

      apiData = postApi.data;

      return postApi;
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dados da resposta: ${e.response!.data}');
        print('Cabeçalhos da resposta: ${e.response!.headers}');
        print('Status code: ${e.response!.statusCode}');
        if (e.response!.statusCode == 400) {
          print(
              'Erro 400: A requisição contém sintaxe incorreta ou não pode ser atendida.');
        }
      } else {
        print('Erro sem resposta: ${e.requestOptions}');
        print('erro: ${e.message}');
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
          "password": password,
          "name": name,
          "data_nascimento": birthDate,
          "genero": gender,
          "cpf": cpf,
          "cid_card": cidcard,
          "endereco": address,
        },
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('apiResponse', postApi.data.toString());
      prefs.getString('apiResponse');
      print('apiResponse: ${postApi.data.runtimeType}');

      return postApi;
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dados da resposta: ${e.response!.data}');
        print('Cabeçalhos da resposta: ${e.response!.headers}');
        print('Status code: ${e.response!.statusCode}');
        if (e.response!.statusCode == 400) {
          print(
              'Erro 400: A requisição contém sintaxe incorreta ou não pode ser atendida.');
        }
      } else {
        print('Erro sem resposta: ${e.requestOptions}');
      }
      throw Exception('Erro ao fazer o cadastro: ${e.message}');
    } on Exception catch (e) {
      print('Erro inesperado: $e');
      throw Exception('Erro inesperado ao fazer o cadastro: $e');
    }
  }

  Future<Response> postSchedule(
    String specialityDoctor,
    int patientId,
    String dateSchedule,
    String hourSchedule,
  ) async {
    const String url =
        ('${DioEndpoints.baseUrl}/consulta'); // Update with your API URL
    const String bearerToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzI5ODA5OTU1LCJleHAiOjE3MzA0MTQ3NTV9.88N4jv3Bh5ki-QiUduknyuVwuUra2V_08Ra8Se0xoaI'; // Replace with your actual token

    final Map<String, dynamic> requestData = {
      "modalidade": specialityDoctor,
      "paciente": patientId,
      "data": dateSchedule,
      "horario": hourSchedule,
    };

    final Dio dio = Dio();

    try {
      final response = await dio.post(
        url,
        data: requestData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $bearerToken',
            'Content-Type': 'application/json',
          },
        ),
      );

      // Handle the response
      if (response.statusCode == 200) {
        print('Consulta created: ${response.data}');
        return response;
      } else {
        print(
            'Failed to create consulta: ${response.statusCode} - ${response.data}');
        throw Exception('Failed to create consulta');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Error occurred: $e');
    }
  }
}
