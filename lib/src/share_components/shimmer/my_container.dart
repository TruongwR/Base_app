import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/palette.dart';


class MyContainer extends StatelessWidget {
  final Widget leftWidget;
  final Widget? rightWidget;
  final Widget? bottomWidget;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final CrossAxisAlignment? verticalAlign;
  final Color? color;
  final Function()? onTap;

  const MyContainer(
      {Key? key,
      required this.leftWidget,
      this.rightWidget,
      this.padding,
      this.verticalAlign,
      this.margin,
      this.color,
      this.bottomWidget,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          border:  const Border(
              bottom: BorderSide(
            color: Palette.grayD9,
            width: 1,
          )),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: verticalAlign ?? CrossAxisAlignment.start,
              children: [
                Expanded(child: leftWidget),
                rightWidget ?? const SizedBox()
              ],
            ),
            bottomWidget ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
