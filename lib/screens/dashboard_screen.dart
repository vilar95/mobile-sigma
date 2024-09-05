import 'package:flutter/material.dart';
import 'package:sigma/authentication/services/model/mock_user.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required MockUser user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          children: [
             IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
             }, icon: const Icon(Icons.menu)),
            const Text('SIGMA NEWS\'s' ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Bem-vindo à tela de dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}