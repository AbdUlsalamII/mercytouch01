import 'package:mercy_touch/Core/app_export.dart';

abstract class MedicalGuideElementsDetails extends GetxController {
    initialData();

}

class MedicalGuideElementsDetailsImp extends MedicalGuideElementsDetails {
    MyServices myServices = Get.find();
  late MedicalGuideModel medicalGuideModel;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() {
    medicalGuideModel = Get.arguments['medicalGuideModel'];
  }
}