import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ModalBackground extends StatelessWidget {
  final bool showModal;
  final Widget child;

  const ModalBackground({
    Key? key,
    required this.showModal,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showModal,
      child: child,
    );
  }
}
