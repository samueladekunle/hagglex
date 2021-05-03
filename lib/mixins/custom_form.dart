import 'package:flutter/material.dart';

mixin CustomForm<T extends StatefulWidget> on State<T> {
  bool _showModal = false;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final referralCodeController = TextEditingController();
  final verificationCodeController = TextEditingController();

  bool get showModal => _showModal;

  void toggleShowModal(bool showModal) =>
      setState(() => _showModal = showModal);

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
