import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_loan_app/model/user.dart';
import 'package:flutter_loan_app/screen/home_screen.dart';
import 'package:flutter_loan_app/screen/signup_screen.dart';

import '../constant.dart';
import '../widget/button_loader.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  bool obscureText = true;
  void get onIconToggle => setState(() => obscureText = !obscureText);
  IconData get icon => !obscureText ? Icons.visibility : Icons.visibility_off;
  bool isLoading = false;

  Future<void> signIn() async {
    try {
      setState(() => isLoading = true);
      await Future.delayed(const Duration(seconds: 4),
          () => pushReplacement(context, HomeScreen()));
    } catch (_) {
      setState(() => isLoading = false);
      snackBar(context, somethingwentwrong);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('WELCOME')),
      body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Sign in to continue',
                        style: style.copyWith(fontSize: 17),
                      ),
                      const SizedBox(height: 30),
                      Material(
                        shape: textFieldDecoration,
                        child: CustomTextfield(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.person_outline,
                                color: lightGreen),
                            validator: (val) =>
                                val!.isEmpty ? 'Field is required' : null,
                            hintText: 'Email'),
                      ),
                      const SizedBox(height: 16),
                      Material(
                          shape: textFieldDecoration,
                          child: CustomTextfield(
                              controller: password,
                              prefixIcon: const Icon(Icons.lock_outline,
                                  color: lightGreen),
                              validator: (val) =>
                                  val!.isEmpty ? 'Field is required' : null,
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                  onPressed: () => onIconToggle,
                                  icon: Icon(icon)),
                              obscureText: obscureText)),
                      const SizedBox(height: 70),
                      Center(
                        child: CustomButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                signIn();
                              }
                            },
                            child: ButtonLoader(
                              isLoading: isLoading,
                              text: 'Login',
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  const SizedBox(width: 3),
                  GestureDetector(
                      onTap: () => push(context, const SignUpScreen()),
                      child:
                          Text('Sign up', style: style.copyWith(fontSize: 14)))
                ],
              )
            ],
          )),
    );
  }
}
