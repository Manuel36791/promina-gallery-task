import 'dart:developer';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_mina_task/domain/models/user.dart';
import 'package:pro_mina_task/domain/routes/app_pages.dart';
import 'package:pro_mina_task/presentation/gallery/controllers/states/gallery_state.dart';
import 'package:pro_mina_task/presentation/gallery/provider/gallery_remote_provider.dart';
import 'package:pro_mina_task/presentation/widgets/custom_icon_button.dart';

import '../../../../domain/models/gallery.dart';
import '../../managers/assets_manager.dart';
import '../../managers/colors_manager.dart';
import '../../managers/constant_manager.dart';
import '../../managers/fonts_manager.dart';
import '../../managers/storage_manager.dart';
import '../../managers/strings_manager.dart';
import '../../managers/values_manager.dart';

class GalleryController extends GetxController {
  late final UserModel user;
  final storage = StorageManager.mainStorage;

  final provider = GalleryRemoteProvider();

  final galleryState = GalleryState().obs;
  final galleryModel = GalleryModel().obs;

  final ImagePicker picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    user = UserModel.fromJson(storage.read(ConstantsManager.userKey));
    getGallery();
  }

  void getGallery() async {
    galleryState.value = GalleryLoadingState();
    update();

    galleryState.value = await provider.getGallery();
    update();

    if (galleryState.value is GallerySuccessState) {
      galleryModel.value = galleryState.value.gallery!;
      log(galleryModel.value.toJson().toString());
      update();
    }
  }

  void showCustomDialog() {
    Get.dialog(
      Center(
        child: BlurryContainer(
          blur: 5,
          width: WidthManager.w350,
          height: HeightManager.h300,
          color: ColorsManager.white.withOpacity(0.6),
          padding: EdgeInsets.all(PaddingManager.p10),
          borderRadius: const BorderRadius.all(
            Radius.circular(SizeManager.s32),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PaddingManager.p50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomIconButton(
                  style: FontsManager.bigText(
                    ColorsManager.textColor,
                    FontWeight.normal,
                  ),
                  icon: AssetsManager.galleryImage,
                  title: StringsManager.gallery,
                  color: ColorsManager.galleryButtonColor,
                  onTap: () => pickImage(ImageSource.gallery),
                ),
                SizedBox(
                  child: CustomIconButton(
                    style: FontsManager.bigText(
                      ColorsManager.textColor,
                      FontWeight.normal,
                    ),
                    icon: AssetsManager.cameraImage,
                    title: StringsManager.camera,
                    color: ColorsManager.cameraButtonColor,
                    onTap: () => pickImage(ImageSource.camera),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierColor: Colors.transparent,
    );
  }

  void pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    await uploadImage(image!.path);
    Get.back();
  }

  Future<void> uploadImage(String path) async {
    final response = await provider.uploadImage(path);

    if (response) {
      getGallery();
    }
  }

  void logOut() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
