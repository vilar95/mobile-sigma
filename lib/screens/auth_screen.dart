import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';
import 'package:sigma/controller/auth_screen_controller.dart';
import 'package:sigma/screens/widgets/show_custom_snackbar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthScreenController controller = AuthScreenController();

  bool _isPasswordVisible = true;
  bool _isPasswordVisiblePasswordConfirm = true;

  final _formKey = GlobalKey<FormState>();

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
                      Observer(
                        builder: (_) => Text(
                          (controller.isAuthentication)
                              ? "Bem vindo(a) ao"
                              : "Vamos começar?",
                          key: const Key('AuthTitle'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => Text(
                          controller.isAuthentication
                              ? 'Sistema Integrado de Gestão Médica e Atendimento'
                              : 'Faça seu cadastro: ',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => Visibility(
                          visible: !controller.isAuthentication,
                          child: Column(
                            children: [
                              TextFormField(
                                onChanged: (value) => controller.name = value,
                                decoration: InputDecoration(
                                  errorText: controller.nameError,
                                  errorMaxLines: 3,
                                  errorStyle: const TextStyle(
                                    color: Colors.red,
                                  ),
                                  label: const Text("Nome"),
                                ),
                              ),
                              TextFormField(
                                onChanged: (value) =>
                                    controller.birthDate = value,
                                decoration: InputDecoration(
                                  errorText: controller.birthDateError,
                                  errorMaxLines: 3,
                                  errorStyle: const TextStyle(
                                    color: Colors.red,
                                  ),
                                  label: const Text("Data de Nascimento"),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime now = DateTime.now();
                                  DateTime lastDate = DateTime.now();
                                  DateTime initialDate =
                                      now.isAfter(lastDate) ? lastDate : now;

                                  DateTime? pickedDate = await showDatePicker(
                                    locale: const Locale("pt", "BR"),
                                    context: context,
                                    initialDate: initialDate,
                                    firstDate: DateTime(1910, 1, 1),
                                    lastDate: lastDate,
                                  );
                                  if (pickedDate != null) {
                                    setState(() {
                                      controller.birthDate =
                                          pickedDate.toString();
                                    });
                                  }
                                },
                                controller: TextEditingController(
                                  text: controller.birthDate.isNotEmpty
                                      ? "${DateTime.parse(controller.birthDate).day.toString().padLeft(2, '0')}/${DateTime.parse(controller.birthDate).month.toString().padLeft(2, '0')}/${DateTime.parse(controller.birthDate).year}"
                                      : "",
                                ),
                              ),
                              DropdownButtonFormField(
                                onChanged: (value) =>
                                    controller.gender = value.toString(),
                                decoration: InputDecoration(
                                  errorText: controller.genderError,
                                  errorMaxLines: 3,
                                  errorStyle: const TextStyle(
                                    color: Colors.red,
                                  ),
                                  label: const Text("Gênero"),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: "Masculino",
                                    child: Text("Masculino"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Feminino",
                                    child: Text("Feminino"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Não informar",
                                    child: Text("Não informar"),
                                  ),
                                ],
                              ),
                              TextField(                                
                                onChanged: (value) => controller.cpf = value,
                                decoration: InputDecoration(
                                  label: const Text("CPF"),
                                  errorText: controller.cpfError,
                                  errorMaxLines: 3,
                                  errorStyle: const TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  MaskedInputFormatter("###.###.###-##"),
                                  TextEditingControllerWithEndCursor(maxDigits: 14),
                                ],
                                
                              ),
                              TextFormField(
                                onChanged: (value) =>
                                    controller.cidcard = value,
                                decoration: InputDecoration(
                                  label: const Text("CidCard"),
                                  errorText: controller.cidcardError,
                                  errorMaxLines: 3,
                                  errorStyle: const TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  MaskedInputFormatter("#########-##"),
                                  TextEditingControllerWithEndCursor(maxDigits: 14),
                                ],
                              ),
                              TextFormField(
                                onChanged: (value) =>
                                    controller.address = value,
                                decoration: InputDecoration(
                                  errorText: controller.addressError,
                                  errorMaxLines: 3,
                                  errorStyle: const TextStyle(
                                    color: Colors.red,
                                  ),
                                  label: const Text("Endereço"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => TextFormField(
                          onChanged: (value) => controller.email = value,
                          decoration: InputDecoration(
                            label: const Text("E-mail"),
                            errorText: controller.emailError,
                            errorMaxLines: 3,
                            errorStyle: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => InkWell(
                          child: TextFormField(
                            onChanged: (value) => controller.password = value,
                            obscureText: _isPasswordVisible,
                            decoration: InputDecoration(
                              errorText: controller.passwordValidationError,
                              errorMaxLines: 3,
                              errorStyle: const TextStyle(
                                color: Colors.red,
                              ),
                              label: const Text("Senha"),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                ),
                                onPressed: () => setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => InkWell(
                          child: Visibility(
                            visible: !controller.isAuthentication,
                            child: Column(
                              children: [
                                TextFormField(
                                  onChanged: (value) =>
                                      controller.passwordConfirm = value,
                                  obscureText:
                                      _isPasswordVisiblePasswordConfirm,
                                  decoration: InputDecoration(
                                    errorText:
                                        controller.passwordValidationError,
                                    errorMaxLines: 3,
                                    errorStyle: const TextStyle(
                                      color: Colors.red,
                                    ),
                                    label: const Text("Confirme a senha"),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisiblePasswordConfirm
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                      ),
                                      onPressed: () => setState(() {
                                        _isPasswordVisiblePasswordConfirm =
                                            !_isPasswordVisiblePasswordConfirm;
                                      }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => InkWell(
                          child: Visibility(
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
                        ),
                      ),
                      const SizedBox(height: 16),
                      Observer(
                          builder: (_) => InkWell(
                                child: ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Color.fromARGB(255, 25, 57, 105),
                                    ),
                                    foregroundColor:
                                        WidgetStatePropertyAll(Colors.white),
                                  ),
                                  onPressed: () async {
                                    if (controller.isAuthentication) {
                                      controller.login(
                                        context,
                                        controller.email,
                                        controller.password,
                                      );
                                    }
                                    if (!controller.isAuthentication) {
                                      controller.register(
                                          context,
                                          controller.email,
                                          controller.password,
                                          controller.name,
                                          controller.birthDate,
                                          controller.gender,
                                          controller.cpf,
                                          controller.cidcard,
                                          controller.address);
                                    }
                                  },
                                  child: Text(
                                    key: const Key("button"),
                                    controller.isAuthentication
                                        ? "Entrar"
                                        : "Cadastrar",
                                  ),
                                ),
                              )),
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

  forgotPasswordClicked() {
    String email = controller.email;
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

class TextEditingControllerWithEndCursor extends TextInputFormatter {
  TextEditingControllerWithEndCursor({this.maxDigits = 14});
  
  final int maxDigits;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    
    if(newValue.text.length > maxDigits)return oldValue;

    if(newValue.text.isEmpty)return newValue;
    
    String newText = newValue.text;
    
    if (newText.length > maxDigits) {
      newText = oldValue.text;
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}