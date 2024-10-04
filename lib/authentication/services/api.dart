import 'package:dio/dio.dart';


void postHttp() async {
  try {
    final dio = Dio();
    final postApi = await dio.post(
      "http://35.193.111.224/backend/login",
      data: {"email" : "teste@yahoo.com",    "password" : "123@Mudar"},
    );
    print(postApi.data);
  } catch (e) {
    if (e is DioException) {
      print('Erro na requisição: ${e.message}');
      if (e.response != null) {
        print('Dados da resposta: ${e.response!.data}');
        print('Cabeçalhos da resposta: ${e.response!.headers}');
        print('Status code: ${e.response!.statusCode}');
      } else {
        print('Erro sem resposta: ${e.requestOptions}');
      }
    } else {
      print('Erro inesperado: $e');
    }
  }
}
