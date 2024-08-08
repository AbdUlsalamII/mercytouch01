import 'package:mercy_touch/Core/app_export.dart';
import 'package:mercy_touch/Data/DataSource/remote/cart_data.dart';
import 'package:mercy_touch/Data/Model/CartModel.dart';

abstract class CartController extends GetxController {
  initialData();
  add(String drugsid);
  delete(String drugsid);
}

class CartControllerImp extends CartController {
  MyServices myServices = Get.find();

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  int? usersid;

  List<CartModel> data = [];

  double priceorders = 0.0;

  int totalcountdrugs = 0;

  //!
  @override
  void onInit() {
    view();
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    usersid = myServices.sharedPreferences.getInt("id");
  }

  @override
  add(drugsid) async {
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

  delete(String drugsid) async {
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



  resetVarCart() {
    totalcountdrugs = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .viewCart(myServices.sharedPreferences.getInt("id").toString());
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countandprice'];
          // print("++++++++++++++++++++++$dataresponsecountprice");
          // Clear the existing data in the data list

          data.clear();
          // Map each entry in dataresponse to CartModel and add it to data list
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)).toList());
          // print("++++++++++++++++++++++$data");

          totalcountdrugs = int.parse(dataresponsecountprice['totalcount']);
          priceorders =
              double.parse(dataresponsecountprice['totalprice'].toString());
          // print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
