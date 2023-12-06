import 'package:flutter/material.dart';
import 'package:target_test/utils/constants.dart';

class LoginButtonComponent extends StatelessWidget {
  const LoginButtonComponent({
    super.key,
    required this.callback,
    this.label = 'Entrar',
    this.colorButton = Colors.green,
  });
  final VoidCallback callback;
  final String? label;
  final Color? colorButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(colorButton!)),
      onPressed: () {
        callback();
      },
      child: Container(
        width: 100,
        height: 30,
        padding: const EdgeInsets.only(top: 6),
        child: Text(label!,
            style: TextStyle(color: ProjectColors().white),
            textAlign: TextAlign.center),
      ),
    );
  }
}
