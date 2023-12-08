import 'package:flutter/material.dart';
import 'package:target_test/presentation/ui/components/custom_alert_dialog.dart';
import 'package:target_test/presentation/ui/components/login_button_component.dart';
import 'package:target_test/presentation/ui/controller/info_page_controller.dart';
import 'package:target_test/utils/constants.dart';

class CustomEditElementDialog {
  final snackbar = SnackBar(
    backgroundColor: ProjectColors().darkGreen,
    content: const Text('Item editado com sucesso.'),
  );
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
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Insira o novo texto',
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 250,
                  height: 30,
                  decoration: BoxDecoration(
                      color: ProjectColors().green,
                      borderRadius: BorderRadius.circular(5)),
                  child: Form(
                    child: TextFormField(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      onChanged: (value) => newValue = value,
                      controller: infoPageController.editInfoController,
                      onFieldSubmitted: (value) {
                        if (value == '') {
                          Navigator.of(context).pop();

                          CustomAlertDialog().alertdialog(
                              context,
                              'O campo de texto não pode ser vazio',
                              'Sair',
                              () => Navigator.of(context).pop());
                        } else {
                          infoPageController.infoList[index] = value;
                          Navigator.of(context).pop();
                        }

                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                          prefix: Icon(Icons.edit),
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
              callback: () {
                if (newValue == '') {
                  () => Navigator.of(context).pop();

                  CustomAlertDialog().alertdialog(
                      context,
                      'O campo de texto não pode ser vazio',
                      'Sair',
                      () => Navigator.of(context).pop());
                } else {
                  infoPageController.infoList[index] = newValue;
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              //////////////////////////////
              label: 'Salvar',
              colorButton: ProjectColors().navyBlue,
            ),
          ],
        );
      },
    );
  }
}
