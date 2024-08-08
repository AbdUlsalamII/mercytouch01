import 'package:mercy_touch/Core/app_export.dart';

abstract class DoctorsDetailsController extends GetxController {
  initialData();
}

class DoctorsDetailsControllerImp extends DoctorsDetailsController {
  MyServices myServices = Get.find();
  late DoctorsModel doctorsModel;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() {
    doctorsModel = Get.arguments['doctorsModel'];
  }
}
