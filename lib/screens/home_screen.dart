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
                  title: 'São Caetano aprova criação do Hospital Universitário da USCS',
                  description: 'A Câmara de São Caetano aprovou, em sessão extraordinária realizada na noite desta quinta-feira (17/06), o projeto de lei que autoriza a Prefeitura a firmar convênio com a USCS (Universidade Municipal de São Caetano do Sul) para a criação do Hospital Universitário da USCS.',
                  imageUrl: Image.asset('assets/new_hospital.png'),
                  date: DateTime.parse('2021-06-17'),
                  url: "https://www.reporterdiario.com.br/noticia/3039770/camara-de-sao-caetano-aprova-criacao-do-hospital-universitario-da-uscs/",
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png'),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
                BoxNewsWidget(
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
