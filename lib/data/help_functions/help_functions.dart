import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pro_mina_task/presentation/managers/colors_manager.dart';
import 'package:pro_mina_task/presentation/managers/fonts_manager.dart';
import 'package:pro_mina_task/presentation/managers/values_manager.dart';
import 'package:pro_mina_task/presentation/widgets/dialog.dart';

void showWaitingIndicator(String title) {
  Get.dialog(
    MyDialog(
      title: title,
    ),
  );
}

void hideWaitingIndicator() {
  Get.back();
}

void showErrorToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: SizeManager.s3.toInt(),
    backgroundColor: ColorsManager.red,
    textColor: ColorsManager.white,
    fontSize: FontSizeManager.s16,
  );
}

void showSuccessToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: SizeManager.s3.toInt(),
    backgroundColor: ColorsManager.green,
    textColor: ColorsManager.white,
    fontSize: FontSizeManager.s16,
  );
}

void showWarningToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: SizeManager.s3.toInt(),
    backgroundColor: ColorsManager.yellow,
    textColor: ColorsManager.black,
    fontSize: FontSizeManager.s16,
  );
}
