import 'package:mercy_touch/Core/app_export.dart';
import 'package:mercy_touch/Data/DataSource/remote/myfavorite_data.dart';
import 'package:mercy_touch/Data/Model/services/Consultaition/MyFavoriteModel.dart';

abstract class MyFavoriteController extends GetxController {
  initialData();
  getData();
  deleteData(String favId);
}

class MyFavoriteControllerImp extends MyFavoriteController {
  MyServices myServices = Get.find();
  MyfavoriteData myFavoriteData = MyfavoriteData(Get.find());

  List<MyFavoriteModel> data = [];
  int? usersid;

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  initialData() {
    usersid = myServices.sharedPreferences.getInt("id");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getData(usersid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("===================DATA========================");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteData(favId) {
      data.removeWhere((element) => element.favoriteId == favId);
    update();
  }
}
