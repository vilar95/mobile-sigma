import 'package:flutter/material.dart';
import 'package:sigma/_core/sigma_routes.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/authentication/services/model/mock_user.dart';
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
              color: SigmaColors.green,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  user.photoURL != null ? AssetImage(user.photoURL!) : null,
              backgroundColor: const Color.fromARGB(255, 190, 252, 252)
            ),
            accountName: Text(
              user.displayName != null ? user.displayName! : "",
            ),
            accountEmail: Text(user.email!),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, size: 40,),
            title: const Text("Home", style: TextStyle(fontSize: 18),),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month_outlined, size: 40,),
            title: const Text("Agendar Consulta", style: TextStyle(fontSize: 18),),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.schedule);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_outlined, size: 40,),
            title: const Text("Suporte", style: TextStyle(fontSize: 18),),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushNamed(context, SigmaRoutes.support);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline_rounded, size: 40,),
            title: const Text("Remover conta", style: TextStyle(fontSize: 18),),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              showConfirmPasswordDialog(context: context, email: "");
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, size: 40,),
            title: const Text("Sair", style: TextStyle(fontSize: 18),),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            minVerticalPadding: 20,
            onTap: () {
              Navigator.pushReplacementNamed(context, SigmaRoutes.auth);
            },
          ),
        ],
      ),
    );
  }
}
