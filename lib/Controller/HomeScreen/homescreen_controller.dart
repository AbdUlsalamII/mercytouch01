import 'package:mercy_touch/Core/app_export.dart';
import 'package:mercy_touch/View/Screen/HomeScreen/Settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const Home(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("favorite"),
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Setting"),
        )
      ],
    ),
    const Settings(),
  ];
  List titlebottomappbar = [
    "Home",
    "Favorite",
    "Setting",
    "Profile",
  ];
  List<IconData> iconbottomappbar = [
    Icons.home,
    Icons.favorite,
    Icons.settings,
    Icons.person,
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
  
  @override
  goToCart() {
  Get.toNamed(AppRoute.Cart);
  }
}
