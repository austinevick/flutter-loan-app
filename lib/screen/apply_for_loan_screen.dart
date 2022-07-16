import 'package:flutter/material.dart';
import 'package:flutter_loan_app/constant.dart';
import 'package:flutter_loan_app/form_validation.dart';
import 'package:flutter_loan_app/screen/loan_calculator_screen.dart';
import 'package:flutter_loan_app/screen/loan_success_screen.dart';
import 'package:flutter_loan_app/widget/custom_button.dart';
import 'package:flutter_loan_app/widget/custom_textfield.dart';

class ApplyForLoanScreen extends StatefulWidget {
  const ApplyForLoanScreen({Key? key}) : super(key: key);

  @override
  State<ApplyForLoanScreen> createState() => _ApplyForLoanScreenState();
}

class _ApplyForLoanScreenState extends State<ApplyForLoanScreen> {
  List<int> loanDuration = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  int selectedDuration = 1;
  final formkey = GlobalKey<FormState>();
  final fullnameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final bankAcctNoCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final bankNameCtrl = TextEditingController();
  final amountCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Personal info'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'We have few questions that will help us determine your eligibility.',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.shield_outlined, color: lightGreen),
                  Text(
                    'Your information is secure with us',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Material(
                shape: textFieldDecoration,
                child: CustomTextfield(
                    controller: fullnameCtrl,
                    validator: (val) =>
                        val!.isEmpty ? 'Field is required' : null,
                    prefixIcon:
                        const Icon(Icons.person_outline, color: lightGreen),
                    hintText: 'Full name'),
              ),
              const SizedBox(height: 16),
              Material(
                shape: textFieldDecoration,
                child: CustomTextfield(
                    controller: addressCtrl,
                    validator: (val) =>
                        val!.isEmpty ? 'Field is required' : null,
                    prefixIcon:
                        const Icon(Icons.person_outline, color: lightGreen),
                    hintText: 'Home address'),
              ),
              const SizedBox(height: 16),
              Material(
                shape: textFieldDecoration,
                child: CustomTextfield(
                    controller: bankAcctNoCtrl,
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        val!.length != 10 ? 'Invalid account number' : null,
                    prefixIcon:
                        const Icon(Icons.account_balance, color: lightGreen),
                    hintText: 'Bank account number'),
              ),
              const SizedBox(height: 16),
              Material(
                shape: textFieldDecoration,
                child: CustomTextfield(
                    controller: bankNameCtrl,
                    validator: (val) =>
                        val!.isEmpty ? 'Field is required' : null,
                    prefixIcon:
                        const Icon(Icons.account_balance, color: lightGreen),
                    hintText: 'Bank name'),
              ),
              const SizedBox(height: 16),
              Material(
                shape: textFieldDecoration,
                child: CustomTextfield(
                    controller: phoneCtrl,
                    validator: (val) => validatePhoneNumber(val!),
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(Icons.phone, color: lightGreen),
                    hintText: 'Phone number'),
              ),
              const SizedBox(height: 16),
              Material(
                shape: textFieldDecoration,
                child: CustomTextfield(
                    controller: amountCtrl,
                    validator: (val) =>
                        val!.isEmpty ? 'Field is required' : null,
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(Icons.money, color: lightGreen),
                    hintText: 'Amount'),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  validator: (int? val) =>
                      val == null ? 'Field is required' : null,
                  decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.calendar_month, color: lightGreen),
                      enabledBorder: textFieldDecoration,
                      focusedBorder: textFieldDecoration,
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      hintText: 'Repayment month'),
                  items: loanDuration
                      .map((e) => DropdownMenuItem<int>(
                          value: e, child: Text(e.toString())))
                      .toList(),
                  onChanged: (int? val) =>
                      setState(() => selectedDuration = val!)),
              const SizedBox(height: 35),
              CustomButton(
                  onPressed: () => push(context, const LoanSuccessScreen()),
                  text: 'Continue'),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
