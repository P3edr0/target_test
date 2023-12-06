import 'package:flutter/material.dart';
import 'package:target_test/presentation/ui/components/login_button_component.dart';
import 'package:target_test/utils/constants.dart';

class CustomAlertDialog {
  Future<void> alertdialog(BuildContext context, String message) {
    return showDialog<void>(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: Icon(
            Icons.info_rounded,
            color: ProjectColors().navyBlue,
            size: 50,
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            LoginButtonComponent(
              callback: () => Navigator.of(context).pop(),
              label: 'Sair',
              colorButton: ProjectColors().navyBlue,
            ),
          ],
        );
      },
    );
  }
}
