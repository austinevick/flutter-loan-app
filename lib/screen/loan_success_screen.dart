import 'package:flutter/material.dart';
import 'package:flutter_loan_app/screen/home_screen.dart';
import 'package:flutter_loan_app/widget/custom_button.dart';

import '../constant.dart';

class LoanSuccessScreen extends StatefulWidget {
  final double? amount;
  final int? duration;
  final double? monthlyInstallment;
  const LoanSuccessScreen(
      {Key? key, this.amount, this.duration, this.monthlyInstallment})
      : super(key: key);

  @override
  State<LoanSuccessScreen> createState() => _LoanSuccessScreenState();
}

class _LoanSuccessScreenState extends State<LoanSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation iconAnimation;
  late Animation avatarAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    iconAnimation = Tween(begin: 0.0, end: 100.0).animate(controller);
    avatarAnimation = Tween(begin: 0.0, end: 100.0).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              'Congratulations',
              textAlign: TextAlign.center,
              style: style.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: lightGreen,
              radius: avatarAnimation.value,
              child: Icon(
                Icons.done,
                color: Colors.white,
                size: iconAnimation.value,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Your loan has been approved we will get back to you shortly.',
              textAlign: TextAlign.center,
              style: style.copyWith(fontSize: 17),
            ),
            const SizedBox(height: 25),
            const Spacer(),
            CustomButton(
              onPressed: () => pushAndRemoveUntil(context, const HomeScreen()),
              text: 'return home',
            )
          ],
        ),
      ),
    );
  }
}
