import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/graphql/config.dart';
import 'package:hagglex/screens/screens.dart';

void main() async {
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/icon.png'), context);
    return GraphQLProvider(
      client: Config.initialise(),
      child: MaterialApp(
        title: 'HaggleX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF2E1963),
          primaryColor: Color(0xFF2E1963),
          brightness: Brightness.dark,
          fontFamily: 'Basis Grotesque Pro',
          accentColor: Color(0xFFFFC175),
        ),
        home: SplashScreen(),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          RegistrationScreen.routeName: (context) => RegistrationScreen(),
          CountryScreen.routeName: (context) => CountryScreen(),
          VerificationScreen.routeName: (context) => VerificationScreen(),
          ConfirmationScreen.routeName: (context) => ConfirmationScreen(),
          DashboardScreen.routeName: (context) => DashboardScreen(),
        },
      ),
    );
  }
}
