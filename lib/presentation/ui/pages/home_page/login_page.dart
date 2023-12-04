import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:target_test/presentation/ui/controller/login_page_controller.dart';
import 'package:target_test/presentation/ui/pages/home_page/components/custom_alert_dialog.dart';
import 'package:target_test/presentation/ui/pages/home_page/components/login_button_component.dart';
import 'package:target_test/presentation/ui/pages/home_page/components/login_textform_component.dart';
import 'package:target_test/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageController _loginPageController = LoginPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: MediaQuery.sizeOf(context).height - 24,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ProjectColors().darkBlue,
                    ProjectColors().navyBlue,
                    ProjectColors().blue,
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    LoginTextFormComponents(
                      label: 'Usuário',
                      prefixIcon: Icons.person,
                      controller: _loginPageController.userController,
                    ),
                    const SizedBox(height: 10),
                    LoginTextFormComponents(
                      label: 'Senha',
                      prefixIcon: Icons.lock,
                      controller: _loginPageController.passwordController,
                    ),
                    const SizedBox(height: 20),
                    LoginButtonComponent(callback: () async {
                      String message = validateFields();
                      if (message != '') {
                        await CustomAlertDialog().alertdialog(context, message);
                      } else {
                        log('Próxima Página');
                      }
                    }),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      child: Text(
                        'Política de Privacidade',
                        style: TextStyle(color: ProjectColors().white),
                      ),
                      onPressed: () {
                        log("Apertou politicas");
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String validateFields() {
    if (_loginPageController.userController.text.isEmpty ||
        _loginPageController.passwordController.text.isEmpty) {
      return 'O nome de usuário e senha não podem ser vazios';
    }

    if (_loginPageController.userController.text.endsWith(' ')) {
      return 'O nome de usuário não pode terminar com espaço';
    }
    if (_loginPageController.passwordController.text.endsWith(' ')) {
      return 'O campo de senha não pode terminar com espaço';
    }
    if (_loginPageController.passwordController.text.length <= 1) {
      return 'O campo de senha não pode ter menos de 2 caracteres';
    }

    return '';
  }
}
