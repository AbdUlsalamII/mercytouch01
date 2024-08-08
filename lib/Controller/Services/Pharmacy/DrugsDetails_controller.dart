import 'package:mercy_touch/Core/app_export.dart';
import 'package:mercy_touch/Data/DataSource/remote/cart_data.dart';
// ignore: unused_import
import 'package:nb_utils/nb_utils.dart';

abstract class DrugsDetailsController extends GetxController {
  initialData();
  goToCart();
  addToCart(drugsid);
  deleteFromCart(String drugsid);
  getCountDrugs(String drugsid);
}

class DrugsDetailsControllerImp extends DrugsDetailsController {
  // CartControllerImp cartController = Get.put(CartControllerImp());

  MyServices myServices = Get.find();

  CartData cartData = CartData(Get.find());

  late PharmacyModel pharmacyModel;

  late StatusRequest statusRequest;
  int? usersid;

  var countDrugs;

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  initialData() async {
    usersid = myServices.sharedPreferences.getInt("id");

    statusRequest = StatusRequest.loading;
    pharmacyModel = Get.arguments['pharmacyModel'];
    countDrugs = await getCountDrugs(pharmacyModel.drugsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  addToCart(drugsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.addCart(usersid.toString(), drugsid.toString());
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة الدواء الى السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  deleteFromCart(String drugsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.removeCart(usersid.toString(), drugsid.toString());
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة الدواء من السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  getCountDrugs(String drugsid) async {
    statusRequest = StatusRequest.loading;
    var response =
        await cartData.getCountCart(usersid.toString(), drugsid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countDrugs = 0;
        countDrugs = int.parse(response['data'].toString());
        print("$countDrugs");
        return countDrugs;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  //! For Frontend
  add() {
    addToCart(pharmacyModel.drugsId.toString());
    countDrugs++;
    update();
  }

  remove() {
    if (countDrugs > 0) {
      deleteFromCart(pharmacyModel.drugsId.toString());
      countDrugs--;
      update();
    } else {
      print("لا يوجد ادوية لحذفها");
    }
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.Cart);
  }
  //!
}
