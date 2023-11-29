import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:target_test/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Usuário',
                style: TextStyle(color: ProjectColors().white),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 200,
                height: 40,
                color: ProjectColors().white,
              ),
              Text(
                'Senha',
                style: TextStyle(color: ProjectColors().white),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 200,
                height: 40,
                color: ProjectColors().white,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ProjectColors().green)),
                onPressed: () {
                  log("Apertou politicas");
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(color: ProjectColors().white),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
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
          ),
        ),
      ),
    );
  }
}
