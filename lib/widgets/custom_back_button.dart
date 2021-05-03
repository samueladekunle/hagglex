import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset('assets/images/back-button.png'),
      onTap: () => Navigator.of(context).pop(),
    );
  }
}
