import 'package:mercy_touch/Core/app_export.dart';

class DoctorsData {
  Crud crud;

  DoctorsData(this.crud);

  getData(String id , String usersid) async {
    var respons =
        await crud.postData(AppLink.doctorspage, {"id": id.toString(),"usersid" :usersid.toString()});
    return respons.fold((l) => l, (r) => r);
  }
}
