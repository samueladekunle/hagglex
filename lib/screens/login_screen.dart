import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/graphql/graphql.dart';
import 'package:hagglex/mixins/mixins.dart';
import 'package:hagglex/models/models.dart';
import 'package:hagglex/screens/screens.dart';
import 'package:hagglex/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with CustomForm<LoginScreen> {
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome!',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Mutation(
                      options: MutationOptions(
                        document: gql(Document.login),
                        onCompleted: (data) {
                          toggleShowModal(false);
                          if (data != null) {
                            final login = Login.fromJson(data['login']);
                            final isUserEmailVerified =
                                login.user.emailVerified;
                            if (!isUserEmailVerified) {
                              Navigator.of(context).pushNamed(
                                  VerificationScreen.routeName,
                                  arguments: login);
                            } else {
                              Navigator.of(context).pushReplacementNamed(
                                  DashboardScreen.routeName);
                            }
                          }
                        },
                        onError: (exception) {
                          toggleShowModal(false);
                          if (exception != null) {
                            showSnackBar(exception.graphqlErrors.first.message);
                          }
                        },
                      ),
                      builder: (runMutation, queryResult) {
                        return Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomTextFormField(
                                labelText: 'Email Address',
                                controller: emailController,
                                isRequired: true,
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextFormField(
                                labelText: 'Password (Min. 8 characters)',
                                controller: passwordController,
                                isRequired: true,
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('Forgot Password?'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Navigator.of(context)
                                  //     .pushNamed(DashboardScreen.routeName);
                                  if (formKey.currentState!.validate()) {
                                    toggleShowModal(true);
                                    runMutation({
                                      'input': emailController.text,
                                      'password': passwordController.text,
                                    });
                                  }
                                },
                                child: Text(
                                  'LOG IN',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).accentColor,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'New user? ',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Create a new account.',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.of(context)
                                            .pushNamed(
                                                RegistrationScreen.routeName),
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
