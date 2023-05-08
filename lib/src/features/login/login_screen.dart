import 'package:base_app/src/configs/app_fonts.dart';
import 'package:base_app/src/configs/box.dart';
import 'package:base_app/src/configs/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'widget_login.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.white,
        body: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: Text(
                "Chatty",
                style: AppFont.t.s(100).black,
              ),
            ),
          ),
          _contentContainer(acction: () {}, icon: const Icon(Icons.g_mobiledata_rounded), titel: 'Đăng nhập với Google'),
          _contentContainer(acction: () {}, icon: const Icon(Icons.facebook_outlined), titel: 'Đăng nhập với Facebook'),
          _contentContainer(acction: () {}, icon: const Icon(Icons.apple), titel: 'Đăng nhập với Apple'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text('-------------------- or --------------------')],
          ),
          _contentContainer(acction: () {}, titel: 'Đăng nhập bằng số điện thoại'),
          Box.h(100.h),
          Center(
            child: Text(
              'Bạn chưa có tài khoản ?',
              style: AppFont.t.s(16).w600,
            ),
          ),
          Center(
            child: Text(
              'Đăng ký',
              style: AppFont.t.s(16).w600.blue00A9E7,
            ),
          ),
        ]),
      ),
    );
  }
}
