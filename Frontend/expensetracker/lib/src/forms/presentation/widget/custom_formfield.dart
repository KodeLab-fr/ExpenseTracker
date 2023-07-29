import 'package:flutter/material.dart';

class CustTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Widget prefixIcon;
  final String labelText;
  final String hintText;
  final String errorText;
  final Function? onTap;
  const CustTextFormField(
      {super.key,
      required this.controller,
      required this.prefixIcon,
      required this.labelText,
      required this.hintText,
      required this.errorText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        hintText: hintText,
      ),
      onTap: onTap as void Function()?,
      validator: (value) {
        return value!.isEmpty ? errorText : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
