import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/authentication/services/model/mock_user.dart';
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
      body: const Center(
        child: Text(
          'Bem-vindo à tela de Notícias da Saúde! Não há notícias ):',
          style: TextStyle(fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
