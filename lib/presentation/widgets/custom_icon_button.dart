import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../managers/colors_manager.dart';
import '../managers/fonts_manager.dart';
import '../managers/values_manager.dart';

class CustomIconButton extends StatelessWidget {
  final icon, title, onTap;
  final TextStyle style;
  final Color color;
  const CustomIconButton({
    Key? key,
    this.icon,
    this.onTap,
    this.title,
    required this.style,
    this.color = ColorsManager.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: PaddingManager.p10,
          vertical: PaddingManager.p5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeManager.s16),
          color: color,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
            ),
            const SizedBox(width: SizeManager.s32),
            Text(
              title,
              textAlign: TextAlign.center,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
