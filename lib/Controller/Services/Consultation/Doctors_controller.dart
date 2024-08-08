import 'package:mercy_touch/Core/app_export.dart';
import 'package:mercy_touch/Data/DataSource/remote/services/consultation/doctors_data.dart';

abstract class DoctorsController extends GetxController {
  initialData();
  changeCat(int val, String catval);
  getDoctors(String categoryid);
  goToPageDoctorDetails(DoctorsModel doctorsModel);
}

class DoctorsControllerImp extends DoctorsController {
  MyServices myServices = Get.find();
  DoctorsData doctorsData = DoctorsData(Get.find());

  //  var userId = myServices.sharedPreferences.getString("id");

  List Doctor = [];

  List doctorsCat = [];
  int? selectedCat;
  String? catid;

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    doctorsCat = Get.arguments['doctorsCat'];
    selectedCat = Get.arguments['selectedCat'];
    // catid = selectedCat.toString();
    catid = Get.arguments['catid'];
    getDoctors(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getDoctors(catid!);
    update();
  }

  @override
  getDoctors(categoryid) async {
    var userId = myServices.sharedPreferences.getInt("id").toString();
    Doctor.clear();
    statusRequest = StatusRequest.loading;
    var response = await doctorsData.getData(catid!, userId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Doctor.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageDoctorDetails(doctorsModel) {
    Get.toNamed(AppRoute.DoctorsDetails, arguments: {
      "doctorsModel": doctorsModel,
    });
  }
}
