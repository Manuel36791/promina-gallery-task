import 'package:pro_mina_task/domain/models/gallery.dart';
class GalleryState {
  GalleryModel? gallery;
  String? errorMessage;
}

class GallerySuccessState extends GalleryState {
  GallerySuccessState(GalleryModel gallery) {
    this.gallery = gallery;
  }
}

class GalleryFailedState extends GalleryState {
  GalleryFailedState(String errorMessage) {
    this.errorMessage = errorMessage;
  }
}

class GalleryLoadingState extends GalleryState {}
