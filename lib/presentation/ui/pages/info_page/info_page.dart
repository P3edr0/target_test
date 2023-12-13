import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_test/presentation/ui/components/custom_alert_dialog.dart';
import 'package:target_test/presentation/ui/controller/info_page_controller.dart';
import 'package:target_test/presentation/ui/pages/info_page/components/custom_edit_element_dialog.dart';
import 'package:target_test/utils/constants.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final InfoPageController _infoPageController = InfoPageController();

  @override
  void initState() {
    super.initState();
    // carregarLista();
    _infoPageController.fetchList();
  }

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
                    child: Observer(
                      builder: (_) => _infoPageController.infoList.isEmpty
                          ? Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info,
                                  color: ProjectColors().navyBlue,
                                  size: 30,
                                ),
                                const SizedBox(height: 10),
                                const Text("Lista Vazia"),
                              ],
                            ))
                          : ListView.separated(
                              itemCount: _infoPageController.infoList.length,
                              physics: const ClampingScrollPhysics(),
                              separatorBuilder: (_, values) => Container(
                                color:
                                    ProjectColors().darkGrey.withOpacity(0.5),
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
                                      child: Text(
                                        _infoPageController.infoList[index],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      )),
                                  InkWell(
                                      onTap: () {
                                        CustomEditElementDialog().editDialog(
                                          context,
                                          index,
                                          _infoPageController.infoList[index],
                                          _infoPageController,
                                        );
                                      },
                                      child: const Icon(Icons.edit)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        await CustomAlertDialog().alertdialog(
                                            context,
                                            'Deseja remover o elemento\n "${_infoPageController.infoList[index]}" ?',
                                            'Remover',
                                            () async =>
                                                _infoPageController.removeItem(
                                                  context,
                                                  index,
                                                ));
                                        log('Deletar $index');
                                      },
                                      child: Icon(
                                        Icons.cancel_rounded,
                                        color: ProjectColors().red,
                                      ))
                                ],
                              ),
                            ),
                    ),
                  ),
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
                        onFieldSubmitted: (value) async {
                          _infoPageController.insertItem(value, context);
                        },
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
