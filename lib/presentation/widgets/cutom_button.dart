import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../managers/colors_manager.dart';
import '../managers/fonts_manager.dart';
import '../managers/values_manager.dart';

class CustomButton extends StatelessWidget {
  final onTap, title;
  const CustomButton({
    Key? key,
    this.onTap,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorsManager.buttonColor,
          borderRadius: BorderRadius.circular(
            SizeManager.s10,
          ),
        ),
        child: Text(
          title,
          style: FontsManager.mediumText(
            ColorsManager.white,
            FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
