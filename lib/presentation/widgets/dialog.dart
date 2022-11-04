import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class MyDialog extends StatelessWidget {
  final title;

  const MyDialog({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Color(0xFF43695B).withOpacity(0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: LoadingIndicator(
                indicatorType: Indicator.ballSpinFadeLoader,
                colors: [Colors.white],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: Get.width,
              padding: const EdgeInsets.all(20),
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.visible,
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
