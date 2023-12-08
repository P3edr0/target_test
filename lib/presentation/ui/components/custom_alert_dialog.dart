import 'package:flutter/material.dart';
import 'package:target_test/presentation/ui/components/login_button_component.dart';
import 'package:target_test/utils/constants.dart';

class CustomAlertDialog {
  Future<void> alertdialog(BuildContext context, String message,
      String buttonLabel, Function() callback) {
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
              callback: callback,
              label: buttonLabel,
              colorButton: ProjectColors().navyBlue,
            ),
          ],
        );
      },
    );
  }
}
