import 'package:flutter/material.dart';
import 'package:target_test/presentation/ui/components/custom_alert_dialog.dart';
import 'package:target_test/presentation/ui/components/login_button_component.dart';
import 'package:target_test/presentation/ui/controller/info_page_controller.dart';
import 'package:target_test/utils/constants.dart';

class CustomEditElementDialog {
  Future<void> editDialog(BuildContext context, int index, String oldValue,
      InfoPageController infoPageController) {
    infoPageController.editInfoController.text = oldValue;
    String newValue = '';
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext _,
      ) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: Icon(
            Icons.edit,
            color: ProjectColors().navyBlue,
            size: 50,
          ),
          content: SizedBox(
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Insira o novo texto',
                  textAlign: TextAlign.center,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: ProjectColors().navyBlue, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Form(
                    child: TextFormField(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      onChanged: (value) => newValue = value,
                      controller: infoPageController.editInfoController,
                      onFieldSubmitted: (value) async {
                        await infoPageController.updateItem(
                            value, index, context);
                      },
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                          hintText: "Digite Seu Texto",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          contentPadding: EdgeInsets.only(bottom: 10),
                          prefixStyle: TextStyle(),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            LoginButtonComponent(
              callback: () async {
                if (newValue == '') {
                  () => Navigator.of(context).pop();

                  CustomAlertDialog().alertdialog(
                      context,
                      'O campo de texto não pode ser vazio',
                      'Sair',
                      () => Navigator.of(context).pop());
                } else {
                  await infoPageController.updateItem(newValue, index, context);
                }
              },
              label: 'Salvar',
              colorButton: ProjectColors().navyBlue,
            ),
          ],
        );
      },
    );
  }
}
