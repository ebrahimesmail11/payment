import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment/core/theming/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.title,super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: SvgPicture.asset('assets/images/arrow.svg',height: 24.h,),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: Styles.style25,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}