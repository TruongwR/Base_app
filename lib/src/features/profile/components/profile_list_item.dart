import 'package:Whispers/src/configs/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({required this.icon, this.text, this.hasNavigation, super.key});
  final IconData icon;
  final String? text;
  final bool? hasNavigation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.w,
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ).copyWith(
        bottom: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 25,
          ),
          const SizedBox(width: 15),
          Text(
            text ?? '',
            style: AppFont.t.s(16).w500,
          ),
          const Spacer(),
          if (hasNavigation ?? false)
            const Icon(
              LineAwesomeIcons.angle_right,
              size: 25,
            ),
        ],
      ),
    );
  }
}
