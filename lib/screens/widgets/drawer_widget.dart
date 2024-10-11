import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigma/_core/routes/sigma_routes.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/controller/auth_screen_controller.dart';
import 'package:sigma/screens/widgets/show_confirm_logout_dialog.dart';
import 'package:sigma/screens/widgets/show_confirm_password_dialog.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final AuthScreenController controller = AuthScreenController();
  Map<String, dynamic>? userData;

  // Declare variáveis para armazenar o nome e email
  String nameUser = '';
  String emailUser = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? apiResponse = prefs.getString('apiResponse');

    if (apiResponse != null) {
      // Decodifica a resposta da API e extrai os dados do paciente
      final decodedResponse = jsonDecode(apiResponse);
      setState(() {
        userData = decodedResponse;
        nameUser = decodedResponse['patient']['name'] ?? 'Nome não disponível';
        emailUser = decodedResponse['patient']['email'] ?? 'Email não disponível';
      });
    }
  }

  String? photoURL = "assets/profile_picture.png";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: SigmaColors.blue,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: userData?['photoURL'] != null
                  ? NetworkImage(userData!['photoURL'])
                  : null,
              child: userData?['photoURL'] == null
                  ? const Icon(Icons.person, size: 40)
                  : null,
            ),
            accountName: Text(nameUser),
            accountEmail: Text(emailUser),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month, size: 40),
            title: const Text("Agendar Consulta", style: TextStyle(fontSize: 18)),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.schedule);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit_calendar, size: 40),
            title: const Text("Meus Agendamentos", style: TextStyle(fontSize: 18)),
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
            leading: const Icon(Icons.delete_outline_rounded, size: 40),
            title: const Text("Remover conta", style: TextStyle(fontSize: 18)),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              showConfirmPasswordDialog(context: context, email: "");
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
