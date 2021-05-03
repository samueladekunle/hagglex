import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/graphql/graphql.dart';
import 'package:hagglex/mixins/mixins.dart';
import 'package:hagglex/models/models.dart';
import 'package:hagglex/screens/screens.dart';
import 'package:hagglex/widgets/widgets.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with CustomForm<RegistrationScreen> {
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
                  Theme(
                    data: ThemeData.light(),
                    child: Card(
                      child: Mutation(
                        options: MutationOptions(
                          document: gql(Document.register),
                          onCompleted: (data) {
                            toggleShowModal(false);
                            if (data != null) {
                              final login = Login.fromJson(data['register']);
                              Navigator.of(context).pushNamed(
                                  VerificationScreen.routeName,
                                  arguments: login);
                            }
                          },
                          onError: (exception) {
                            toggleShowModal(false);
                            if (exception != null) {
                              showSnackBar(
                                  exception.graphqlErrors.first.message);
                            }
                          },
                        ),
                        builder: (runMutation, queryResult) {
                          return Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Create a new account',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFormField(
                                    labelText: 'Email Address',
                                    controller: emailController,
                                    textInputAction: TextInputAction.next,
                                    isRequired: true,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFormField(
                                    labelText: 'Password (Min. 8 characters)',
                                    controller: passwordController,
                                    textInputAction: TextInputAction.next,
                                    isRequired: true,
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFormField(
                                    labelText: 'Create a username',
                                    controller: usernameController,
                                    textInputAction: TextInputAction.next,
                                    isRequired: true,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () => Navigator.of(context)
                                            .pushNamed(CountryScreen.routeName),
                                        child: Container(
                                          color: Color(0xFFE8E8E8),
                                          width: 75,
                                          height: 36,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/nigerian-flag.png',
                                                  width: 24,
                                                  height: 24,
                                                ),
                                                Text(
                                                  ' (+234)',
                                                  style: TextStyle(fontSize: 9),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: CustomTextFormField(
                                          labelText: 'Enter your phone number',
                                          controller: phoneNumberController,
                                          textInputAction: TextInputAction.next,
                                          isRequired: true,
                                          keyboardType: TextInputType.phone,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFormField(
                                    labelText: 'Referral code (optional)',
                                    controller: referralCodeController,
                                    isRequired: false,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'By signing, you agree to HaggleX terms and privacy policy.',
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomGradientButton(
                                    onPressed: () {
                                      // Navigator.of(context)
                                      //     .pushReplacementNamed(
                                      //         VerificationScreen.routeName);
                                      if (formKey.currentState!.validate()) {
                                        toggleShowModal(true);
                                        runMutation({
                                          'email': emailController.text,
                                          'username': usernameController.text,
                                          'password': passwordController.text,
                                          'country': 'NG',
                                          'phonenumber':
                                              '234${phoneNumberController.text}',
                                          'currency': 'NGN',
                                          'referralCode':
                                              referralCodeController.text,
                                        });
                                      }
                                    },
                                    child: Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
