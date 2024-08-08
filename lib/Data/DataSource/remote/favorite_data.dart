import 'package:mercy_touch/Core/app_export.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavorite(String usersid, String doctorsid) async {
    var respons = await crud.postData(AppLink.favoriteAdd, {"usersid": usersid.toString(),"doctorsid" :doctorsid.toString()});
    return respons.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String doctorsid) async {
    var respons = await crud.postData(AppLink.favoriteRemove, {"usersid": usersid.toString(),"doctorsid" :doctorsid.toString()});
    return respons.fold((l) => l, (r) => r);
  }
}
