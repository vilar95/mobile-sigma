import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/screens/widgets/box_news_widget.dart';
import 'package:sigma/screens/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SigmaColors.blue,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'Notícias da Saúde',
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BoxNewsWidget(
                  title:
                      'São Caetano aprova criação do Hospital Universitário da USCS',
                  description:
                      'A Câmara de São Caetano aprovou, em sessão extraordinária realizada na noite desta quinta-feira (17/06), o projeto de lei que autoriza a Prefeitura a firmar convênio com a USCS (Universidade Municipal de São Caetano do Sul) para a criação do Hospital Universitário da USCS.',
                  imageUrl: Image.asset('assets/new_hospital.png'),
                  date: DateTime.parse('2021-06-17'),
                  url:
                      "https://www.reporterdiario.com.br/noticia/3039770/camara-de-sao-caetano-aprova-criacao-do-hospital-universitario-da-uscs/",
                ),
                BoxNewsWidget(
                  title:
                      'Desafios na Saúde de São Caetano: Médicos Aumentam a Pressão para Reduzir tempo de atendimento',
                  description:
                      'A administração do prefeito de São Caetano, José Auricchio Júnior (PSD), que tem como secretário de Saúde Guilherme Crepaldi Esposito,'
                      'está forçando os médicos da rede pública a diminuir em 25% o tempo de consulta por paciente, passando de 20 minutos para no máximo 15 minutos. A meta é aliviar a demanda reprimida por atendimento básico e primário. Durante os meses de junho e julho, o líder do Executivo realizou mutirões para diminuir as filas na clínica geral.',
                  imageUrl: Image.asset('assets/desafio_saude.png'),
                  date: DateTime.parse('2024-09-30'),
                ),
                BoxNewsWidget(
                  title:
                      'Atende Fácil Saúde Extraordinário realiza mais de 3 mil atendimentos em SCS',
                  description:
                      'A Prefeitura de São Caetano do Sul realizou no fim de semana (21 e 22/9) o Atende Fácil Saúde Extraordinário, com exames e consultas em diversas especialidades.'
                      'Foram 3.096 atendimentos, com envolvimento de 150 colaboradores, entre médicos, enfermeiros e equipes administrativas e de apoio.',
                  imageUrl: Image.asset('assets/atende-facil-saude-SCS.png'),
                  date: DateTime.parse('2024-09-24'),
                ),
                BoxNewsWidget(
                  title:
                      'São Caetano inaugura Super Centro de Saúde com quatro serviços',
                  description:
                      'O prefeito de São Caetano do Sul, José Auricchio Júnior, e a secretária de Saúde, Regina Maura Zetone, inauguraram em 9 de março a Unidade Médica Especializada Super Centro de Saúde, que funciona em parceria com a Fundação do ABC.',
                  imageUrl: Image.asset('assets/super-centro-de-saude.png'),
                  date: DateTime.parse('2024-03-15'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
