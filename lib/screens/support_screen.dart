import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/controller/auth_screen_controller.dart';
import 'package:sigma/controller/support_screen_controller.dart';
import 'package:sigma/screens/widgets/drawer_widget.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final controller = SupportScreenController();
  final authController = AuthScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: SigmaColors.blue,
      appBar: AppBar(
        title: const Text(
          'Suporte',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Como podemos te ajudar?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Digite o assunto da sua mensagem:',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                        borderSide: BorderSide(color: SigmaColors.blue),
                      ),
                      hintText: 'Digite o assunto...',
                      border: OutlineInputBorder(
                        gapPadding: BorderSide.strokeAlignOutside,
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                        borderSide: BorderSide(
                          color: SigmaColors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'No campo abaixo, digite suas dúvidas ou sugestões de melhorias:',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    onChanged: (value) => controller.message = value,
                    maxLines: 12,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                        borderSide: BorderSide(color: SigmaColors.blue),
                      ),
                      hintText:
                          'Digite suas dúvidas ou sugestões de melhorias...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                        borderSide: BorderSide(color: SigmaColors.blue),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: SigmaColors.blue,
                  ),
                  onPressed: () {
                    controller.sendMessage(
                      context,
                      controller.message,
                    );
                  },
                  child: const Text(
                    'Enviar',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
