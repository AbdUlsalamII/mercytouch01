import 'package:mercy_touch/Core/app_export.dart';

class MyfavoriteData {
  Crud crud;

  MyfavoriteData(this.crud);

  getData(String id) async {
    var respons = await crud.postData(AppLink.myfavorite, {"id" : id.toString()});
    return respons.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var respons = await crud.postData(AppLink.deleteFromFavorite, {"id" : id.toString()});
    return respons.fold((l) => l, (r) => r);
  }
}
