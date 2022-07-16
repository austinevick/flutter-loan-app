import 'package:flutter/material.dart';

const noInternet = 'No internet connection';
const somethingwentwrong = 'Something went wrong';
const style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

const primaryColor = Color(0xff001f79);
const lightGreen = Color(0xff47E690);
const boldTextColor = Color(0xff052715);
final textFieldDecoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: lightGreen, width: 1.8));

Future<void> push(BuildContext context, Widget child) =>
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => child,
    ));
Future<void> pushReplacement(BuildContext context, Widget child) =>
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => child,
    ));
Future<void> pushAndRemoveUntil(BuildContext context, Widget child) =>
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => child), (c) => false);

snackBar(BuildContext context, text) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        content: Row(
          children: [
            Icon(Icons.info_outline, size: 28.0, color: Colors.blue[300]),
            const SizedBox(width: 10),
            Expanded(child: Text(text)),
          ],
        )));
