import 'package:mercy_touch/Core/app_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.white_color,
        floatingActionButton: CustomFloatingActionButton(
          onPressedFloatingActionButton: () {
            controller.goToCart();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBarHome(),
        body: controller.listPage.elementAt(controller.currentpage),
      ),
    );
  }
}
