// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigma/authentication/services/dio_endpoints.dart';
import 'package:sigma/model/speciality_doctor.dart';

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


  Future<List<SpecialityDoctor>> getSpecialityDoctorApi() async {
    try {
      final response = await _dio.get('${DioEndpoints.baseUrl}/especialidades');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('specialityDoctor', response.data.toString());
      prefs.getString('specialityDoctor');
      print('apiResponse: ${response.data}');
      print('apiResponse: ${response.data.runtimeType}');

     
      List<SpecialityDoctor> specialityDoctors = (response.data as List)
          .map((data) => SpecialityDoctor.fromJson(data))
          .toList();

      return specialityDoctors;
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dados da resposta: ${e.response!.data}');
        print('Cabeçalhos da resposta: ${e.response!.headers}');
        print('Status code: ${e.response!.statusCode}');
      } else {
        print('Erro sem resposta: ${e.requestOptions}');
      }
      throw Exception('Erro ao obter dados: ${e.message}');
    } on Exception catch (e) {
      print('Erro inesperado: $e');
      throw Exception('Erro inesperado ao obter dados: $e');
    }
  }
}
