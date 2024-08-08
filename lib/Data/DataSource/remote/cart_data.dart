import 'package:mercy_touch/Core/app_export.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(String usersid, String drugsid) async {
    var respons = await crud.postData(AppLink.addtocart, {"usersid": usersid.toString(),"drugsid" :drugsid.toString()});
    return respons.fold((l) => l, (r) => r);
  }

  removeCart(String usersid, String drugsid) async {
    var respons = await crud.postData(AppLink.removefromcart, {"usersid": usersid.toString(),"drugsid" :drugsid.toString()});
    return respons.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String drugsid) async {
    var response = await crud.postData(
        AppLink.getcountdrugs, {"usersid": usersid.toString(),"drugsid" :drugsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartview, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
