import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../configs/Palette.dart';
import '../../configs/app_fonts.dart';

class CoreCrossFade extends StatefulWidget {
  final String? title;
  final Widget child;
  final VoidCallback? onTap;
  final bool isList;
  final bool isShow;
  final IconData icon;
  final String? text;

  final EdgeInsets? padding;

  const CoreCrossFade({
    Key? key,
    this.title,
    required this.child,
    this.onTap,
    this.isList = false,
    this.isShow = true,
    this.padding,
    required this.icon,
    this.text,
  }) : super(key: key);

  @override
  State<CoreCrossFade> createState() => _CoreCrossFadeState();
}

class _CoreCrossFadeState extends State<CoreCrossFade>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late bool _isShow;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _isShow = widget.isShow;
    _controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _animation = Tween(begin: widget.isShow ? -0.5 : 0.0, end: widget.isShow ? 0.0 : -0.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapTitle() {
    setState(() {
      _isShow = !_isShow;
    });
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildBody();
  }

  Column buildBody() {
    return Column(
      children: [
        InkWell(
          onTap: _onTapTitle,
          child: Container(
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
                  widget.icon,
                  size: 25,
                ),
                const SizedBox(width: 15),
                Text(
                  widget.text ?? '',
                  style: AppFont.t.s(16).w500,
                ),
                const Spacer(),
                const Icon(
                  LineAwesomeIcons.angle_right,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: _isShow ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: Container(),
          secondChild: widget.child,
        ),
      ],
    );
  }
}
