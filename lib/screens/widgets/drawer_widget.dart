// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigma/_core/routes/sigma_routes.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/controller/auth_screen_controller.dart';
import 'package:sigma/screens/widgets/show_confirm_logout_dialog.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final AuthScreenController controller = AuthScreenController();

  late String nameUser = '';
  late String emailUser = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? name = prefs.getString('name');
      final String? email = prefs.getString('email');

      setState(() {
        nameUser = name ?? 'Nome não disponível';
        emailUser = email ?? 'Email não disponível';
      });
    } catch (e) {
      print('Erro ao carregar dados do usuário: $e');
    }
  }

  String? photoURL = "assets/profile_picture.png";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Observer(
            builder: (_) => UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: SigmaColors.blue,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(photoURL!),
              ),
              accountName: Text(nameUser),
              accountEmail: Text(emailUser),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, size: 40),
            title: const Text("Página Inicial", style: TextStyle(fontSize: 18)),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month, size: 40),
            title:
                const Text("Agendar Consulta", style: TextStyle(fontSize: 18)),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.schedule);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit_calendar, size: 40),
            title:
                const Text("Meus Agendamentos", style: TextStyle(fontSize: 18)),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.mySchedule);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_outlined, size: 40),
            title: const Text("Suporte", style: TextStyle(fontSize: 18)),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.support);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined, size: 40),
            title: const Text("Sair", style: TextStyle(fontSize: 18)),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              showConfirmLogoutDialog(context: context);
            },
          ),
          const SizedBox(height: 220),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Desenvolvido por: SIGMA\nCopyright ©. Todos os direitos reservados.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
