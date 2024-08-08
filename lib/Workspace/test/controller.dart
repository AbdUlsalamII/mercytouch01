// import 'package:mercy_touch/Core/app_export.dart';
// import 'package:mercy_touch/Data/DataSource/remote/favorite_data.dart';

// class FavoriteControllertest extends GetxController {
//   MyServices myServices = Get.find();

//   FavoriteData favoriteData = FavoriteData(Get.find());

//   List data = [];
//   int? id;

//   late StatusRequest statusRequest;

//   Map isFavorite = {};
//   setFavorite(id, val) {
//     isFavorite[id] = val;
//     update();
//   }

//  @override
//   void onInit() {
//     initialData();
   
//     super.onInit();
//   }

//     @override
//   // ignore: override_on_non_overriding_member
//   initialData() {
//     id = myServices.sharedPreferences.getInt("id");
//   }


//   addFavorite( doctorsid) async {
//     statusRequest = StatusRequest.loading;
//     print("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
//         print(doctorsid);
//         print(id);
//     var response = await favoriteData.addFavorite(id!, doctorsid);
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response["status"] == "success") {
//         Get.rawSnackbar(title: "اشعار", messageText: Text("add Done"));
//         // data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
        
//       }
//     }
//   }

//   removeFavorite(int doctorsid) async {
//     statusRequest = StatusRequest.loading;
//     print("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
//         print(doctorsid);
//         print(id);
//     var response = await favoriteData.addFavorite(id!, doctorsid);

//     print("Response: $response");
//     statusRequest = handlingData(response);

//     if (statusRequest == StatusRequest.success) {
//       if (response["status"] == "success") {
//         Get.rawSnackbar(title: "اشعار", messageText: Text("Remove Done"));
//       } else {
//         statusRequest = StatusRequest.failure;
//         Get.rawSnackbar(
//             title: "خطأ", messageText: Text("Failed to remove favorite."));
//       }
//     }
//   }
// }
