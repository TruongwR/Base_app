import 'package:base_app/src/configs/Palette.dart';
import 'package:flutter/material.dart';

import '../../configs/app_fonts.dart';

class MyTextField extends StatelessWidget {
  final bool obscureText;
  final String? hinText;
  final bool enable;
  final bool readOnly;
  final int? maxLength;
  final int? maxLine;
  final int? minLine;
  final FocusNode? focusNode;
  final String? errorText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? textInputType;
  final TextStyle? hintStyle;
  const MyTextField({
    super.key,
    this.enable = true,
    this.readOnly = false,
    this.controller,
    this.errorText,
    this.focusNode,
    this.hinText,
    this.hintStyle,
    this.maxLength,
    this.maxLine,
    this.minLine,
    this.obscureText = false,
    this.onSaved,
    this.suffixIcon,
    this.textInputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        contentPadding: maxLine != 1 ? const EdgeInsets.all(12) : null,
        errorText: errorText,
        fillColor: Palette.white,
        filled: enable,
        hintText: hinText,
        hintStyle: hintStyle ?? AppFont.t.hint,
        focusColor: Palette.blue,
        suffix: suffixIcon,
      ),
    );
  }
}
