import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/graphql/graphql.dart';
import 'package:hagglex/mixins/mixins.dart';
import 'package:hagglex/models/models.dart';
import 'package:hagglex/screens/screens.dart';
import 'package:hagglex/widgets/widgets.dart';

class VerificationScreen extends StatefulWidget {
  static const routeName = '/verification';

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with CustomForm<VerificationScreen> {
  late final ValueNotifier<GraphQLClient> _client;
  late final Login _login;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _client = GraphQLProvider.of(context);
      _login = ModalRoute.of(context)!.settings.arguments as Login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalBackground(
      showModal: showModal,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Verify your account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Theme(
                    data: ThemeData.light(),
                    child: Card(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Image.asset('assets/images/check.png'),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'We just sent a verification code to your email. Please enter the code.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextFormField(
                                labelText: 'Verification code',
                                controller: verificationCodeController,
                                isRequired: true,
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomGradientButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    toggleShowModal(true);
                                    try {
                                      // There's no query for verifying the verification code sent to the
                                      // user's email address. I tried to use the verifyUser query, but
                                      // I get an "Unauthorised" error message response, even after the
                                      // user has signed in.
                                      final result = await _client.value.query(
                                          QueryOptions(
                                              document:
                                                  gql(Document.verifyUser),
                                              variables: {
                                            'code': int.parse(
                                                verificationCodeController
                                                    .text),
                                          }));
                                      print(result);
                                      toggleShowModal(false);
                                      // For the sake of this demo, I directed the user to the confirmation screen,
                                      // as I was not able to ascertain whether the user has verified their email
                                      // address or not.
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              ConfirmationScreen.routeName);
                                    } on GraphQLError catch (e) {
                                      toggleShowModal(false);
                                      showSnackBar(e.message);
                                    }
                                  }
                                },
                                child: Text('VERIFY ME'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'This code will expire in 10 minutes.',
                                style: TextStyle(
                                  fontSize: 9,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Resend code',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      try {
                                        toggleShowModal(true);
                                        final result = await _client.value
                                            .query(QueryOptions(
                                                document: gql(Document
                                                    .resendVerificationCode),
                                                variables: {
                                              'email': _login.user.email
                                            }));
                                        toggleShowModal(false);
                                        if (result
                                            .data?['resendVerificationCode']) {
                                          verificationCodeController.clear();
                                          showSnackBar(
                                              'A new verification code has been sent to your email.');
                                        }
                                      } on GraphQLError catch (e) {
                                        toggleShowModal(false);
                                        showSnackBar(e.message);
                                      }
                                    },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
