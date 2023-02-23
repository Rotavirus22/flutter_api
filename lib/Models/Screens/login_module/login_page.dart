// ignore_for_file: camel_case_types;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_api/Models/Screens/login_module/login_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_api/common/constants.dart';
import 'package:flutter_api/common/buttons/small_button.dart';

class LoginPage extends StatelessWidget {
  static String id = '/loginPage';
  final _formKey = GlobalKey<FormState>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 100,
                    child: Image.asset('assets/images/—Pngtree—soccer ball in goal 2022_8732685.png'),
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'permanent marker',
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'FIFA World Cup',
                          textStyle: TextStyle(color: Colors.black,),
                          speed: Duration(milliseconds: 400),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    onChanged: loginState.onEmailChanged,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      value = loginState.email;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: inputDecoration,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: TextFormField(
                    onChanged: loginState.onPasswordChanged,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an password';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: inputDecoration.copyWith(
                      hintText: 'Enter an password',
                    ),
                  ),
                ),
                SmallButton(
                  onPressed: loginState.isLoading
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            return;
                          } else {
                            // ignore: avoid_print
                            print('Unsuccessful');
                          }
                          return null;
                        }
                      : () {
                          loginState.login();
                        },
                  label: 'Log in',
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
