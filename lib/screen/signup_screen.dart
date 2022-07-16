import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_loan_app/model/user.dart';
import 'package:flutter_loan_app/screen/home_screen.dart';

import '../constant.dart';
import '../form_validation.dart';
import '../widget/button_loader.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';
import '../widget/password_indicator.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();
  final fname = TextEditingController();
  final lname = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirmPass = TextEditingController();

  bool obscureText = true;
  void get onIconToggle => setState(() => obscureText = !obscureText);
  IconData get icon => !obscureText ? Icons.visibility : Icons.visibility_off;
  bool isLoading = false;

  Future<void> signUp() async {
    try {
      setState(() => isLoading = true);
      await Future.delayed(const Duration(seconds: 3),
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
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('CREATE ACCOUNT')),
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Sign up to get loan with ease',
                    style: style.copyWith(fontSize: 17),
                  ),
                  const SizedBox(height: 30),
                  Material(
                    shape: textFieldDecoration,
                    child: CustomTextfield(
                        controller: fname,
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: lightGreen,
                        ),
                        validator: (val) =>
                            val!.isEmpty ? 'Field is required' : null,
                        hintText: 'First name'),
                  ),
                  const SizedBox(height: 16),
                  Material(
                    shape: textFieldDecoration,
                    child: CustomTextfield(
                        controller: lname,
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: lightGreen,
                        ),
                        validator: (val) =>
                            val!.isEmpty ? 'Field is required' : null,
                        hintText: 'Last name'),
                  ),
                  const SizedBox(height: 16),
                  Material(
                    shape: textFieldDecoration,
                    child: CustomTextfield(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: lightGreen,
                        ),
                        validator: (val) => validateEmail(val!),
                        hintText: 'Email'),
                  ),
                  const SizedBox(height: 16),
                  Material(
                    shape: textFieldDecoration,
                    child: CustomTextfield(
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        prefixIcon: const Icon(
                          Icons.phone_outlined,
                          color: lightGreen,
                        ),
                        validator: (val) => validatePhoneNumber(val!),
                        hintText: 'Phone number'),
                  ),
                  const SizedBox(height: 16),
                  Material(
                    shape: textFieldDecoration,
                    child: CustomTextfield(
                      controller: password,
                      prefixIcon:
                          const Icon(Icons.lock_outline, color: lightGreen),
                      suffixIcon: IconButton(
                          onPressed: () => onIconToggle, icon: Icon(icon)),
                      obscureText: obscureText,
                      validator: (val) =>
                          val!.isEmpty ? 'Field is required' : null,
                      onChanged: (val) => setState(() {}),
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: List.generate(4, (i) => buildIndicators(i)),
                  ),
                  const SizedBox(height: 16),
                  Material(
                    shape: textFieldDecoration,
                    child: CustomTextfield(
                        controller: confirmPass,
                        prefixIcon:
                            const Icon(Icons.lock_outline, color: lightGreen),
                        suffixIcon: IconButton(
                            onPressed: () => onIconToggle, icon: Icon(icon)),
                        obscureText: obscureText,
                        validator: (val) => !val!.contains(password.text)
                            ? 'Password does not match'
                            : null,
                        hintText: 'Confirm password'),
                  ),
                  const SizedBox(height: 70),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          signUp();
                        }
                      },
                      child: ButtonLoader(
                        isLoading: isLoading,
                        text: 'Sign up',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      const SizedBox(width: 3),
                      GestureDetector(
                          onTap: () => push(context, const SignInScreen()),
                          child: Text('Sign in',
                              style: style.copyWith(fontSize: 14)))
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )),
    );
  }

  Widget buildIndicators(int i) {
    if (password.text.isEmpty) return const SizedBox.shrink();
    if (password.text.length <= 6 && i == 0) {
      return const PasswordIndicator(Colors.red);
    } else if (password.text.length >= 7 && i == 1) {
      return PasswordIndicator(Colors.yellow[300]!);
    } else if (password.text.length >= 8 && i == 2) {
      return PasswordIndicator(Colors.green[200]!);
    } else if (password.text.length >= 9 && i == 3) {
      return const PasswordIndicator(Colors.green);
    }
    return Container();
  }
}
