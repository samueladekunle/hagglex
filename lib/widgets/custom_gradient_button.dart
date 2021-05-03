import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomGradientButton(
      {Key? key, required this.onPressed, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF432B7B),
            Color(0xFF6A4BBC),
          ],
        ),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        child: child,
        textColor: Colors.white,
      ),
    );
  }
}
