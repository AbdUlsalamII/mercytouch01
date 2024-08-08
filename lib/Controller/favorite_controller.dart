import 'package:mercy_touch/Core/app_export.dart';
import 'package:mercy_touch/Data/DataSource/remote/favorite_data.dart';

abstract class FavoriteController extends GetxController {
  initialData();
  setFavorite(id, val);
  addFavorite(String doctorsid);
  removeFavorite(String doctorsid);
}

class FavoriteControllerImp extends FavoriteController {
  MyServices myServices = Get.find();

  FavoriteData favoriteData = FavoriteData(Get.find());

  Map isFavorite = {};
  int? usersid;

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    usersid = myServices.sharedPreferences.getInt("id");
  }

  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  @override
  addFavorite(doctorsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        usersid.toString(), doctorsid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(title: "اشعار", messageText: Text("add Done"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  removeFavorite(doctorsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        usersid.toString(), doctorsid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.rawSnackbar(title: "اشعار", messageText: Text("add Done"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
