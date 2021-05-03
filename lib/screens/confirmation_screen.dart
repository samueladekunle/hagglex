import 'package:flutter/material.dart';
import 'package:hagglex/screens/screens.dart';

class ConfirmationScreen extends StatelessWidget {
  static const routeName = '/confirmation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                'assets/images/check-gradient.png',
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Setup Complete',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Thank you for setting up your HaggleX account.',
                style: TextStyle(
                  fontSize: 9,
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        DashboardScreen.routeName, (_) => false);
                  },
                  child: Text(
                    'START EXPLORING',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
