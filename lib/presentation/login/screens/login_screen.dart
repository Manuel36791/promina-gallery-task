import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_mina_task/presentation/managers/assets_manager.dart';
import 'package:pro_mina_task/presentation/managers/colors_manager.dart';
import 'package:pro_mina_task/presentation/managers/fonts_manager.dart';
import 'package:pro_mina_task/presentation/managers/strings_manager.dart';
import 'package:pro_mina_task/presentation/managers/values_manager.dart';
import 'package:pro_mina_task/presentation/widgets/custom_form_field.dart';
import 'package:pro_mina_task/presentation/widgets/cutom_button.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Form(
        key: controller.formKey,
        child: Scaffold(
          body: Container(
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AssetsManager.loginBackground,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsManager.myGallery,
                  textAlign: TextAlign.center,
                  style: FontsManager.hugeText(
                    ColorsManager.textColor,
                    FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: HeightManager.h40,
                ),
                BlurryContainer(
                  blur: 5,
                  width: WidthManager.w350,
                  height: HeightManager.h400,
                  color: ColorsManager.white.withOpacity(0.4),
                  padding: EdgeInsets.all(PaddingManager.p10),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(SizeManager.s32),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        StringsManager.login,
                        style: FontsManager.hugeText(
                          ColorsManager.textColor,
                          FontWeight.bold,
                        ),
                      ),
                      CustomFormField(
                        hint: StringsManager.email,
                        controller: controller.email,
                        validator: (value) {
                          if (value.isEmpty) {
                            return StringsManager.pleaseInsertYourEmail;
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomFormField(
                        hint: StringsManager.password,
                        controller: controller.password,
                        isSecure: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return StringsManager.pleaseInsertYourPassword;
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomButton(
                        onTap: controller.login,
                        title: StringsManager.submit,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
