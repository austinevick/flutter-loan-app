import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_loan_app/constant.dart';
import 'package:flutter_loan_app/model/load.dart';
import 'package:flutter_loan_app/model/user.dart';
import 'package:flutter_loan_app/screen/apply_for_loan_screen.dart';
import 'package:flutter_loan_app/widget/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: 285,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: primaryColor,
            child: Column(
              children: [
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Good Morning,',
                                style: style.copyWith(
                                    color: Colors.grey[300], fontSize: 16)),
                            Text('Victor',
                                style: style.copyWith(color: Colors.white)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 32,
                            ))
                      ]),
                ),
                const SizedBox(height: 20),
                Text(
                  'Unpaid loans',
                  style: style.copyWith(fontSize: 16, color: Colors.white70),
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '50,000',
                      style: style.copyWith(fontSize: 32, color: Colors.white),
                    ),
                    Text(
                      'NGN',
                      style:
                          style.copyWith(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
                const Spacer(),
                CustomButton(
                  height: 52,
                  width: 250,
                  onPressed: () => push(context, const ApplyForLoanScreen()),
                  color: Colors.grey.withOpacity(0.5),
                  text: 'Apply for loan',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Recent loans', style: style)),
        Column(
            children: List.generate(
                loans.length,
                (i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(radius: 15),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      loans[i].title!,
                                      style: style.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      loans[i].date!,
                                      style: style.copyWith(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      loans[i].amount!,
                                      style: style.copyWith(fontSize: 15),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      loans[i].status!,
                                      style: TextStyle(
                                          color: color(i),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ]),
                          const Divider(thickness: 1.5)
                        ],
                      ),
                    )))
      ]),
    ));
  }

  Color color(int i) {
    switch (loans[i].status) {
      case 'Approved':
        return lightGreen;
      case 'Pending':
        return Colors.indigo;
      case 'Processing':
        return Colors.orange;
      case 'Declined':
        return Colors.red;
    }
    return primaryColor;
  }
}
