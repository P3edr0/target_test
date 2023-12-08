import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:target_test/presentation/ui/controller/info_page_controller.dart';
import 'package:target_test/utils/constants.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final InfoPageController _infoPageController = InfoPageController();

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
                      decoration: BoxDecoration(
                          color: ProjectColors().white,
                          borderRadius: BorderRadius.circular(5)),
                      child: ListView.separated(
                        itemCount: 10,
                        physics: const ClampingScrollPhysics(),
                        separatorBuilder: (_, values) => Container(
                          color: ProjectColors().darkGrey.withOpacity(0.5),
                          width: 220,
                          height: 1,
                        ),
                        itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                width: 180,
                                height: 50,
                                child: const Text(
                                  'Texto digitado 1',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                            InkWell(
                                onTap: () {
                                  log('Editar $index');
                                },
                                child: const Icon(Icons.edit)),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  log('Deletar $index');
                                },
                                child: Icon(
                                  Icons.cancel_rounded,
                                  color: ProjectColors().red,
                                ))
                          ],
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    margin: const EdgeInsets.only(top: 40, bottom: 80),
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ProjectColors().white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Form(
                      child: TextFormField(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        controller: _infoPageController.infoController,
                        onFieldSubmitted: (value) {},
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            hintText: "Digite Seu Texto",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            contentPadding: EdgeInsets.only(top: 7),
                            prefixStyle: TextStyle(),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Política de Privacidade',
                      style: TextStyle(color: ProjectColors().white),
                    ),
                    onPressed: () async {
                      _infoPageController.abrirLink(
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
