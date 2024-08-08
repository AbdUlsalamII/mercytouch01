import 'package:mercy_touch/Controller/favorite_controller.dart';
import 'package:mercy_touch/Core/app_export.dart';
import 'package:mercy_touch/View/Widget/services/Consultation/ListDoctorsview.dart';

class Doctors extends GetView<DoctorsControllerImp> {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorsControllerImp());
    FavoriteControllerImp controllerFavorite = Get.put(FavoriteControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white_color,
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              titleappbar: 'salam',
            ),
            ListCategoriesDoctors(),
            GetBuilder<DoctorsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.Doctor.length,
                  itemBuilder: (BuildContext context, index) {
                    controllerFavorite.isFavorite[controller.Doctor[index]
                        ["doctors_id"]] = controller.Doctor[index]["favorite"];
                    return ListDoctorsView(
                      doctorsModel:
                          DoctorsModel.fromJson(controller.Doctor[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
