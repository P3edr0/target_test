import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_test/presentation/ui/controller/login_page_controller.dart';
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
                      inputAction: TextInputAction.done,
                      onSubmitt: (_) => _loginPageController.login(context),
                      inputFormaters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9]'))
                      ],
                    ),
                    const SizedBox(height: 20),
                    LoginButtonComponent(
                        callback: () => _loginPageController.login(context)),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      child: Text(
                        'Política de Privacidade',
                        style: TextStyle(color: ProjectColors().white),
                      ),
                      onPressed: () async {
                        _loginPageController.abrirLink(
                            'https://www.google.com.br/', context);
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
}
