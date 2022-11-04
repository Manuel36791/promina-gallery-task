import 'dart:developer';
import 'package:dio/dio.dart' as d;
import 'package:pro_mina_task/data/dio/dio_helper.dart';
import 'package:pro_mina_task/data/help_functions/help_functions.dart';
import 'package:pro_mina_task/presentation/gallery/controllers/states/gallery_state.dart';
import 'package:pro_mina_task/presentation/managers/strings_manager.dart';
import 'package:pro_mina_task/presentation/managers/url_manager.dart';

import '../../../../domain/models/gallery.dart';

class GalleryRemoteProvider {
  DioHelper helper = DioHelper();

  Future<GalleryState> getGallery() async {
    try {
      final response = await helper.getData(UrlManager.myGalleryEndPoint);
      if (response['status'] == 'success') {
        return GallerySuccessState(GalleryModel.fromJson(response));
      } else {
        showErrorToast(StringsManager.tryAgain);
        return GalleryFailedState(StringsManager.tryAgain);
      }
    } catch (e) {
      log(e.toString());
      return GalleryFailedState(StringsManager.tryAgain);
    }
  }

  Future<bool> uploadImage(String path) async {
    try {
      showWaitingIndicator(StringsManager.pleaseWait);

      final response = await helper.postData(
        UrlManager.uploadImageEndPoint,
        {
          'img': await d.MultipartFile.fromFile(
            path,
            filename: '${DateTime.now()}.png',
          )
        },
      );

      if (response['status'] == 'success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    } finally {
      hideWaitingIndicator();
    }
  }
}
