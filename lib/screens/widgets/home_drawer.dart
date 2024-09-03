import 'package:flutter/material.dart';
import 'package:sigma/screens/widgets/show_confirm_password_dialog.dart';


class HomeDrawer extends StatelessWidget {
  final String user;
  const HomeDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        children: [
          // UserAccountsDrawerHeader(
          //   currentAccountPicture: CircleAvatar(
          //     backgroundImage:
          //         user.photoURL != null ? AssetImage(user.photoURL!) : null,
          //   ),
          //   accountName: Text(
          //     user.displayName != null ? user.displayName! : "",
          //   ),
          //   accountEmail: Text(user.email!),
          // ),
          ListTile(
            leading: const Icon(Icons.image_outlined),
            title: const Text("Mudar foto de perfil"),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline_rounded),
            title: const Text("Remover conta"),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            onTap: () {
              showConfirmPasswordDialog(context: context, email: "");
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Sair"),
            contentPadding: const EdgeInsets.only(left: 16),
            dense: true,
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
