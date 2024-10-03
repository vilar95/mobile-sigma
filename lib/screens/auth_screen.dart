import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/authentication/services/auth_service.dart';
import 'package:sigma/controller/auth_screen_controller.dart';
import 'package:sigma/screens/widgets/show_confirm_register_dialog.dart';
import 'package:sigma/screens/widgets/show_custom_snackbar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthScreenController controller = AuthScreenController();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController =
      TextEditingController(text: "eduardo.vilar@uscsonline.com.br");
  final TextEditingController _senhaController =
      TextEditingController(text: "123456");
  final TextEditingController _confirmaController = TextEditingController();
    bool _isPasswordVisible = true;

  final _formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: SigmaColors.blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      (controller.isAuthentication)
                          ? Image.asset(
                              "assets/logo_icon.png",
                              height: 250,
                            )
                          : const SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (controller.isAuthentication)
                              ? "Bem vindo(a) ao"
                              : "Vamos começar?",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        controller.isAuthentication
                            ? 'Sistema Integrado de Gestão Médica e Atendimento'
                            : 'Faça seu cadastro: ',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Visibility(
                        visible: !controller.isAuthentication,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nomeController,
                              decoration: const InputDecoration(
                                label: Text("Nome"),
                              ),
                              validator: (value) {
                                if (value == null || value.length < 4) {
                                  return "Insira o nome completo.";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _phoneController,
                              decoration: const InputDecoration(
                                label: Text("Telefone"),
                                                                                                
                              ),
                              inputFormatters: [
                                MaskedInputFormatter("(##) #####-####"),
                              ],
                            
                              validator: (value) {
                                if (value == null || value.length <= 15) {
                                  return "Insira o número de telefone.";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration:
                            const InputDecoration(label: Text("E-mail")),
                        validator: (value) {
                          if (value == null || value == "") {
                            return "O valor de e-mail deve ser preenchido";
                          }
                          if (!value.contains("@") ||
                              !value.contains(".") ||
                              value.length < 4) {
                            return "O valor do e-mail deve ser válido";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _senhaController,
                        obscureText: _isPasswordVisible,
                        decoration: InputDecoration(
                          label: const Text("Senha"),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                            ),
                            onPressed: () => setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            }),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.length < 4) {
                            return "Insira uma senha válida.";
                          }
                          return null;
                        },

                      ),
                      Visibility(
                        visible: controller.isAuthentication,
                        child: TextButton(
                          onPressed: () {
                            forgotPasswordClicked();
                          },
                          child: const Text(
                            "Esqueci minha senha",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !controller.isAuthentication,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _confirmaController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                label: Text("Confirme a senha"),
                              ),
                              validator: (value) {
                                if (value == null || value.length < 4) {
                                  return "Insira uma confirmação de senha válida.";
                                }
                                if (value != _senhaController.text) {
                                  return "As senhas devem ser iguais.";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 25, 57, 105),
                          ),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                        onPressed: () {
                          controller.isAuthentication
                              ? handleSendButtonClicked()
                              : showConfirmRegisterDialog(
                                  context: context,
                                  email: _emailController.text);
                        },
                        child: Text(
                          controller.isAuthentication ? "Entrar" : "Cadastrar",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            controller.isAuthentication =
                                !controller.isAuthentication;
                          });
                        },
                        child: Text(
                          controller.isAuthentication
                              ? "Não tem conta? Clique aqui para cadastrar."
                              : "Já tem conta? Clique aqui para entrar.",
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleSendButtonClicked() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    String nome = _nomeController.text;

    if (_formKey.currentState!.validate()) {
      if (controller.isAuthentication) {
        _loginUser(email: email, senha: senha);
      } else {
        _createUser(email: email, senha: senha, nome: nome);
      }
    }
  }

  _loginUser({required String email, required String senha}) {
    showCustomSnackBar(
      context: context,
      message: "TODO: Login com e-mail e senha.",
      isError: false,
      showContinue: true,
      duration: const Duration(seconds: 30),
    );
  }

  _createUser({
    required String email,
    required String senha,
    required String nome,
  }) {
    showConfirmRegisterDialog(context: context, email: email);
  }

  forgotPasswordClicked() {
    String email = _emailController.text;
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController redefincaoSenhaController =
            TextEditingController(text: email);
        return AlertDialog(
          title: const Text("Confirme o e-mail para redefinição de senha"),
          content: TextFormField(
            controller: redefincaoSenhaController,
            decoration: const InputDecoration(label: Text("Confirme o e-mail")),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))),
          actions: [
            TextButton(
              onPressed: () {
                showCustomSnackBar(
                  context: context,
                  message: "E-mail de redefinição enviado!",
                  isError: false,
                  duration: const Duration(seconds: 30),
                );
                Navigator.pop(context);
              },
              child: const Text("Redefinir senha"),
            ),
          ],
        );
      },
    );
  }
}
