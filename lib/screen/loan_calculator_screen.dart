import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import '../widget/button_loader.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';

class LoanCalculatorScreen extends StatefulWidget {
  final double? amount;
  final double? duration;
  const LoanCalculatorScreen({Key? key, this.amount, this.duration})
      : super(key: key);

  @override
  State<LoanCalculatorScreen> createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  final amountCtrl = TextEditingController(text: '0');
  String formatter(double amount) =>
      NumberFormat('#,###,###,###').format(amount);
  double repaymentPeriod = 5;
  double rate = 6;
  bool isLoading = false;
  double get borrowedAmount => double.parse(amountCtrl.text);
  //Calculating interest rate on loan formaular
  double get interestRate => (borrowedAmount * rate * repaymentPeriod) / 100;
  //Calculating monthly payment formaular = (100000*(6/100)/12)
  double get monthlyPayment => (borrowedAmount * (rate / 100) / 12);
  double get totalAmountToBeRepaid => borrowedAmount + interestRate;

  Future<void> calculateLoan() async {
    try {
      setState(() => isLoading = true);
      await Future.delayed(const Duration(seconds: 3), () {
        //interestRate;
        monthlyPayment;
      });
      setState(() => isLoading = false);
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  void init() {
    setState(() {
      if (widget.amount != null || widget.duration != null) {
        amountCtrl.text = widget.amount!.toString();
        repaymentPeriod = widget.duration!;
      }
      return;
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Loan Calculator'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Borrowed amount',
                          style: style.copyWith(
                              fontSize: 15, color: Colors.black54),
                        ),
                        const SizedBox(height: 8),
                        Material(
                          shape: textFieldDecoration,
                          child: CustomTextfield(
                              controller: amountCtrl,
                              keyboardType: TextInputType.number,
                              validator: (val) =>
                                  val!.isEmpty ? 'Field is required' : null,
                              hintText: 'Loan amount'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('NGN50,000'),
                            Text('NGN1,000,000')
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Divider(thickness: 1.8),
                        const SizedBox(height: 15),
                        Text(
                          'Repayment period',
                          style: style.copyWith(
                              fontSize: 15, color: Colors.black54),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${repaymentPeriod.toStringAsFixed(0)} months',
                          style: style.copyWith(fontSize: 18),
                        ),
                        Slider(
                          value: repaymentPeriod,
                          onChanged: (val) =>
                              setState(() => repaymentPeriod = val),
                          min: 1,
                          max: 12,
                          activeColor: primaryColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('1 month'), Text('12 months')],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Monthly cost for ${repaymentPeriod.toStringAsFixed(0)} months',
                            style: style.copyWith(
                                fontSize: 15, color: Colors.black54),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$monthlyPayment',
                            style: style.copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              CustomButton(
                  onPressed: () => calculateLoan(),
                  child: ButtonLoader(
                    isLoading: isLoading,
                    text: 'Login',
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
