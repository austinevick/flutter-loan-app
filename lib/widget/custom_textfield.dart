import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextStyle? textStyle;
  final int maxLines;
  final TextAlign? textAlign;
  final bool? autoFocus;
  final int? maxLength;
  final bool? filled;
  final Widget? suffixIcon;
  final bool? readOnly;
  final InputBorder? focusedBorder;
  final InputBorder? enableBorder;
  final String? initialValue;

  const CustomTextfield({
    Key? key,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.controller,
    this.textInputAction,
    this.onEditingComplete,
    this.focusNode,
    this.autoFocus = false,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.words,
    this.onChanged,
    this.maxLines = 1,
    this.filled = false,
    this.fillColor,
    this.maxLength,
    this.textStyle,
    this.textAlign,
    this.suffixIcon,
    this.readOnly = false,
    this.initialValue,
    this.onTap,
    this.prefixIcon,
    this.focusedBorder = InputBorder.none,
    this.enableBorder = InputBorder.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onTap: onTap,
        initialValue: initialValue,
        textAlign: textAlign ?? TextAlign.start,
        onChanged: onChanged,
        autofocus: autoFocus!,
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        readOnly: readOnly!,
        controller: controller,
        cursorWidth: 1.0,
        maxLines: maxLines,
        obscureText: obscureText,
        maxLength: maxLength,
        validator: validator,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          fillColor: fillColor,
          filled: filled,
          hintText: hintText,
        ),
        style: textStyle ??
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
