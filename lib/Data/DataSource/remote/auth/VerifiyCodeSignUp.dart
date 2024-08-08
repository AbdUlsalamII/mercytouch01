import 'package:mercy_touch/Core/app_export.dart';

class VerifiyCodeSignUpData {
  Crud crud;

  VerifiyCodeSignUpData(this.crud);

  postData(String email, String verfiycode) async {
    var respons = await crud.postData(AppLink.verfiycodesignup, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return respons.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var respons = await crud.postData(AppLink.resendVerfiycode, {
      "email": email,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
