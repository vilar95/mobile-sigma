import 'package:flutter/material.dart';
import 'package:sigma/_core/routes/sigma_routes.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/authentication/services/model/mock_user.dart';
import 'package:sigma/screens/widgets/show_confirm_logout_dialog.dart';
import 'package:sigma/screens/widgets/show_confirm_password_dialog.dart';

class DrawerWidget extends StatelessWidget {
  final MockUser user;
  const DrawerWidget({super.key, required this.user});

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
                backgroundImage:
                    user.photoURL != null ? AssetImage(user.photoURL!) : null,
                backgroundColor: SigmaColors.blue),
            accountName: Text(
              user.displayName != null ? user.displayName! : "",
            ),
            accountEmail: Text(user.email!),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              size: 40,
            ),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.home);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_month,
              size: 40,
            ),
            title: const Text(
              "Agendar Consulta",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.schedule);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.edit_calendar,
              size: 40,
            ),
            title: const Text(
              "Meus Agendamentos",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.mySchedule);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.chat_outlined,
              size: 40,
            ),
            title: const Text(
              "Suporte",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.support);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.delete_outline_rounded,
              size: 40,
            ),
            title: const Text(
              "Remover conta",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              showConfirmPasswordDialog(context: context, email: "");
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app_outlined,
              size: 40,
            ),
            title: const Text(
              "Sair",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              showConfirmLogoutDialog(context: context);
            },
          ),
            const SizedBox(height: 220,),
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
