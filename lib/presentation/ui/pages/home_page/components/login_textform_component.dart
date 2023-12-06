import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_test/utils/constants.dart';

class LoginTextFormComponents extends StatefulWidget {
  const LoginTextFormComponents(
      {super.key,
      required this.label,
      required this.prefixIcon,
      required this.controller,
      this.inputFormaters,
      this.inputAction,
      this.onSubmitt});
  final String label;
  final IconData prefixIcon;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormaters;
  final TextInputAction? inputAction;
  final Function(String)? onSubmitt;

  @override
  State<LoginTextFormComponents> createState() =>
      _LoginTextFormComponentsState();
}

class _LoginTextFormComponentsState extends State<LoginTextFormComponents> {
  final _formKey = GlobalKey<FormState>();

  String saved = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          width: 250,
          child: Text(
            widget.label,
            style: TextStyle(color: ProjectColors().white),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: ProjectColors().white,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 250,
          height: 40,
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: widget.controller,
              onFieldSubmitted: widget.onSubmitt,
              textInputAction: widget.inputAction ?? TextInputAction.next,
              inputFormatters: widget.inputFormaters ?? [],
              onChanged: (value) {
                if (value.length == 20) {
                  saved = value;
                }
                if (value.length >= 21) {
                  widget.controller.text = saved;
                }
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    widget.prefixIcon,
                    size: 20,
                    color: ProjectColors().darkGrey,
                  ),
                  contentPadding: const EdgeInsets.only(top: 7),
                  prefixStyle: const TextStyle(),
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
