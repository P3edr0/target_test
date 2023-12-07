import 'package:flutter/material.dart';
import 'package:target_test/presentation/ui/controller/login_page_controller.dart';
import 'package:target_test/utils/constants.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
                Column(children: [
                  Container(
                      width: 250,
                      height: 300,
                      color: ProjectColors().white,
                      child: ListView.separated(
                        itemCount: 10,
                        separatorBuilder: (_, values) => Container(
                          color: ProjectColors().darkGrey.withOpacity(0.5),
                          width: 220,
                          height: 1,
                        ),
                        itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                                width: 140,
                                child: Text(
                                  'Texto digitado 1',
                                  textAlign: TextAlign.center,
                                )),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.cancel_rounded,
                                  color: ProjectColors().red,
                                ))
                          ],
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 80),
                      width: 250,
                      height: 50,
                      color: ProjectColors().white),
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
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
