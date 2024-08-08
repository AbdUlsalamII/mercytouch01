import 'package:mercy_touch/Core/app_export.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verficationCode);
  reSend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  // VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
  //     VerifyCodeForgetPasswordData(Get.find());

  VerifiyCodeSignUpData verfiyCodeSignUpData =
      VerifiyCodeSignUpData(Get.find());

  String? email;

  StatusRequest? statusRequest = StatusRequest.none;

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verfiyCodeSignUpData.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.SuccessSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code Note correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  reSend() {
    verfiyCodeSignUpData.resendData(email!);
  }
}
