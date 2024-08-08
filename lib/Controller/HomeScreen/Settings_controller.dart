import 'package:mercy_touch/Core/app_export.dart';

abstract class SettingsController extends GetxController {
  logOut();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();

  @override
  logOut() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
