import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String labelText;
  final bool obscureText;
  final bool isRequired;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.isRequired,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: (value) {
        if (!isRequired) {
          return null;
        }

        if (value == null || value.isEmpty) {
          return 'This field is required';
        }

        return null;
      },
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
    );
  }
}
