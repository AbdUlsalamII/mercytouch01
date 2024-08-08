import 'package:mercy_touch/Controller/Services/Consultation/MyFavorite_controller.dart';
import 'package:mercy_touch/Core/app_export.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white_color,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<MyFavoriteControllerImp>(
              builder: (controller) => ListView(
                    children: [
                      CustomAppBar(
                        titleappbar: "sasa",
                        onPressedFav: () {},
                        onPressedicon: () {},
                        onPressedsearch: () {},
                      ),
                      HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return Text(controller.data[index].doctorsName!);
                            }),
                      ),
                    ],
                  ))),
    );
  }
}
