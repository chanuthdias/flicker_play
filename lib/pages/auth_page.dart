import 'package:flicker_play/widgets/sign_in.dart';
import 'package:flicker_play/widgets/sign_up.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isThisSignPage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            child: isThisSignPage ? const SignIn() : const SignUp(),
          ),
          isThisSignPage
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isThisSignPage = !isThisSignPage;
                    });
                  },
                  child: RichText(
                      text: const TextSpan(
                    text: 'No Account?',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  )),
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      isThisSignPage = !isThisSignPage;
                    });
                  },
                  child: RichText(
                      text: const TextSpan(
                    text: 'Already Have an Account?',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign In',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  )),
                )
        ],
      ),
    );
  }
}
