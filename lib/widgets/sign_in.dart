import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flicker_play/widgets/rich_button.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final signFormKey = GlobalKey<FormState>();
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Form(
          key: signFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailField,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) {
                  if (email!.isEmpty) {
                    return "Enter email";
                  } else if (!EmailValidator.validate(email)) {
                    return "Enter valid email";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: passwordField,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Enter min. 6 characters'
                    : null,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 30,
              ),
              RichButton(
                btnName: "Sign In",
                onPressed: signIn,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    final isValid = signFormKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailField.text.trim(), password: passwordField.text.trim());
    } on Exception catch (e) {
      // TODO
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
