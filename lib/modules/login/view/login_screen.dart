// ignore_for_file: avoid_print

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/modules/login/service/login_service.dart';
import 'package:test/modules/register/view/register_screen.dart';
import 'package:test/modules/structure/view/structure_screen.dart';
import 'package:test/shared/widgets/purple_button_style.dart';
import 'package:test/shared/widgets/text_form_field_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'images/petscool-logo.png',
                  width: 216,
                  height: 43,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Para acessar sua conta, faça o seu login.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF545566),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormFieldStyle(
                      controller: _email,
                      labelText: 'E-mail',
                      hintText: 'example@gmail.com',
                      validator: (value) => _validation(value, 'E-mail'),
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldStyle(
                      controller: _password,
                      labelText: 'Senha',
                      hintText: '********',
                      validator: (value) => _validation(value, 'Senha'),
                    ),
                    const SizedBox(height: 20),
                    PurpleButtonStyle(
                      label: 'Entrar',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            session(
                              email: _email.text,
                              password: _password.text,
                            ).then((response) async {
                              if (response != null) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          StructureScreen(customer: response),
                                    ),
                                    (route) => false);
                              } else {
                                showErrorMessage();
                              }
                            });
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não possui uma conta, ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF545566),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(4),
                    hoverColor: Colors.white.withOpacity(0),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      'cadastre-se',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF642CA9),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              anotherOptionStyle(label: 'Google'),
              const SizedBox(height: 10),
              anotherOptionStyle(label: 'Facebook'),
            ],
          ),
        ),
      ),
    );
  }

  Widget anotherOptionStyle({required String label}) {
    String svg;
    Color fontColor;
    void Function() onTap;

    if (label == 'Google') {
      svg = 'icons/google.svg';
      fontColor = const Color(0xFF4265E3);
      onTap = () {};
    } else {
      svg = 'icons/facebook.svg';
      fontColor = const Color(0xFF1D40BA);
      onTap = () {};
    }

    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color(0xFFB4B5CC),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svg),
            const SizedBox(width: 10),
            Text(
              'Entrar com $label',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validation(String? value, String? type) {
    if (value == null || value.isEmpty) {
      return 'Campo vazio';
    } else if (type == 'E-mail' && !EmailValidator.validate(value)) {
      return 'Informe um e-mail válido';
    } else if (type == 'Senha' && value.length < 6) {
      return 'Informe uma senha com pelos 6 digitos';
    }

    return null;
  }

  void showErrorMessage() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        content: const Text(
          'Dados inválidos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(4),
            hoverColor: Colors.white.withOpacity(0),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Voltar',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF642CA9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
