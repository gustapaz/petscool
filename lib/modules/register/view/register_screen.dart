import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:test/modules/login/view/login_screen.dart';
import 'package:test/modules/register/service/customer_service.dart';
import 'package:test/shared/widgets/purple_button_style.dart';
import 'package:test/shared/widgets/text_form_field_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _cpf = TextEditingController();
  final _phone = TextEditingController();

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
                'Cadastre-se',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Faça sua conta na petscool.',
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
                      controller: _name,
                      labelText: 'Nome',
                      hintText: 'Nome Completo',
                      validator: (value) => _validation(value, 'Nome'),
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldStyle(
                      controller: _cpf,
                      labelText: 'CPF',
                      hintText: '12345678900',
                      validator: (value) => _validation(value, 'CPF'),
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldStyle(
                      controller: _phone,
                      labelText: 'Telefone',
                      hintText: '44987654321',
                      validator: (value) => _validation(value, 'Telefone'),
                    ),
                    const SizedBox(height: 20),
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
                      label: 'Cadastrar',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            createCustomer(
                              email: _email.text,
                              password: _password.text,
                              name: _name.text,
                              cpf: _cpf.text,
                              phone: _phone.text,
                            ).then((response) async {
                              if (response) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
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
                    'Tenho uma conta, ',
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
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      'entrar',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF642CA9),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validation(String? value, String? type) {
    if (value == null || value.isEmpty) {
      return 'Campo vazio';
    } else if (type == 'E-mail' && !EmailValidator.validate(value)) {
      return 'Informe um e-mail válido';
    } else if ((type == 'CPF' || type == 'Telefone') &&
        (value.length != 11 || int.tryParse(value) == null)) {
      return 'Informe um ${type!.toLowerCase()} válido';
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
          'E-mail já cadastrado',
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
