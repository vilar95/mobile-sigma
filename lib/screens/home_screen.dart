import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/authentication/model/mock_user.dart';
import 'package:sigma/screens/widgets/box_news_widget.dart';
import 'package:sigma/screens/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  final MockUser user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SigmaColors.blue,
      drawer: DrawerWidget(user: widget.user),
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
                  title: 'Notícia da Saúde',
                  description: 'Descrição da notícia da saúde',
                  imageUrl: Image.asset('assets/logo_icon.png', width: 150),
                  date: DateTime.now(),
                  url: "https://www.google.com",
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
