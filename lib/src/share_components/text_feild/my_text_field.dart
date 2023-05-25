import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/Palette.dart';
import '../../configs/app_fonts.dart';


class MyTextField extends StatelessWidget {
  final bool? required;
  final bool obscureText;
  final bool enable;
  final bool readOnly;
  final String? hintText;
  final int? maxLength;
  final int? maxLine;
  final int? minLine;
  final String? title;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? keyboardType;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final String? errorText;
  final String? labelText;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? prefix;
  final TextStyle? style;
  final EdgeInsets? contentPadding;
  final Color? cursorColor;
  final bool autoFocus;
  final bool hasBorder;
  final bool isDense;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final List<TextInputFormatter> inputFormatters;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;

  const MyTextField(
      {Key? key,
        this.suffixIcon,
        this.hintText,
        this.maxLength,
        this.maxLine,
        this.minLine,
        this.required,
        this.obscureText = false,
        this.controller,
        this.title,
        this.keyboardType,
        this.validator,
        this.enable = true,
        this.readOnly = false,
        this.titleStyle,
        this.hintStyle,
        this.onTap,
        this.onChanged,
        this.focusNode,
        this.onSaved,
        this.onEditingComplete,
        this.errorText,
        this.labelText,
        this.labelStyle,
        this.prefixIcon,
        this.style,
        this.prefix,
        this.contentPadding,
        this.cursorColor = Palette.hint,
        this.autoFocus = false,
        this.hasBorder = false,
        this.isDense = false,
        this.inputFormatters = const [],
        this.suffixIconConstraints,
        this.prefixIconConstraints,
        this.textAlign = TextAlign.start,
        this.textInputAction
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      autofocus: autoFocus,
      inputFormatters: inputFormatters,
      cursorHeight: 22.h,
      cursorWidth: 1.5.w,
      cursorColor: cursorColor,
      minLines: minLine,
      obscureText: obscureText,
      onSaved: (_) => onSaved,
      maxLines: maxLine ?? 1,
      maxLength: maxLength,
      onTap: onTap,
      focusNode: focusNode,
      onChanged: onChanged,
      readOnly: readOnly,
      controller: controller,
      validator: validator,
      enabled: enable,
      keyboardType: keyboardType,
      style: style ?? AppFont.t.hint,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        border: hasBorder ? null : InputBorder.none,
        disabledBorder: hasBorder ? null : InputBorder.none,
        enabledBorder: hasBorder ? null : InputBorder.none,
        focusedBorder: hasBorder ? null : InputBorder.none,
        errorBorder: hasBorder ? null : InputBorder.none,
        focusedErrorBorder: hasBorder ? null : InputBorder.none,
        contentPadding: contentPadding,
        counterText: '',
        errorText: errorText,
        fillColor: Palette.white,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle ?? AppFont.t.hint,
        focusColor: Palette.grayF6,
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        prefix: prefix,
        isDense: isDense,
        suffixIconConstraints: suffixIconConstraints,
        alignLabelWithHint: (maxLine != null && maxLine! > 1)),
    );
  }
}
