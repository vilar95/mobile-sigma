// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigma/services/dio_endpoints.dart';

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
          "password": password,
          // 123@Mudar
        },
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', postApi.data['patient']['name'] ?? '');
      await prefs.setString('email', postApi.data['patient']['email'] ?? '');
      await prefs.setInt('id', postApi.data['patient']['id'] ?? 0);
      await prefs.setString('token', postApi.data['token'] ?? '');
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
    final prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('id');
    final String? token = prefs.getString('token');

    const String url = ('${DioEndpoints.baseUrl}/consulta');
    String? bearerToken = token;

    final Map<String, dynamic> requestData = {
      "modalidade": specialityDoctor,
      "paciente": id,
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

  Future<List<dynamic>> getPatientConsultations() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final int? id = prefs.getInt('id');

    // Validar token e ID
    if (token == null || id == null) {
      throw Exception(
          'Token ou ID está faltando. Por favor, faça login novamente.');
    }

    final String url = '${DioEndpoints.baseUrl}/pacientes/$id/consultas';

    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      print('Response: ${response.data}');

      if (response.statusCode == 200) {
        // Verifique se a resposta contém os dados esperados
        if (response.data is Map && response.data.containsKey('dados')) {
          List<dynamic> consultations = response.data['dados'];
          print('Consultas recuperadas: $consultations');
          return consultations; // Retorne a lista de consultas
        } else {
          throw Exception('Formato de resposta inesperado.');
        }
      } else {
        print(
            'Falha ao recuperar consultas: ${response.statusCode} - ${response.data}');
        throw Exception('Falha ao recuperar consultas: ${response.statusCode}');
      }
    } catch (e) {
      print('Ocorreu um erro: $e');
      throw Exception('Ocorreu um erro: $e');
    }
  }

  Future<void> deleteConsultation(int consultationId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final int? id = prefs.getInt('id');

    // Validar token e ID
    if (token == null || id == null) {
      throw Exception(
          'Token ou ID está faltando. Por favor, faça login novamente.');
    }

    final String url = '${DioEndpoints.baseUrl}/consultas/$consultationId';

    try {
      final response = await _dio.delete(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Consulta deletada com sucesso.');
      } else {
        print(
            'Falha ao deletar consulta: ${response.statusCode} - ${response.data}');
        throw Exception('Falha ao deletar consulta: ${response.statusCode}');
      }
    } catch (e) {
      print('Ocorreu um erro: $e');
      throw Exception('Ocorreu um erro: $e');
    }
  }
}
