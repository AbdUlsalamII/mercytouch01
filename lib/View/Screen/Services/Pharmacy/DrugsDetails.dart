import 'package:mercy_touch/Controller/Services/Pharmacy/DrugsDetails_controller.dart';
import 'package:mercy_touch/Core/app_export.dart';

class DrugsDetails extends StatelessWidget {
  const DrugsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DrugsDetailsControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white_color,
      body: GetBuilder<DrugsDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Stack(
            children: <Widget>[
              //! --- CardDetails
              PHCardDetailsPage(),
              //! --- ScrollDetails
              DetailsScrollDrugs(),
              //! --- Button
              Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(20.0),
                  width: MediaQuery.of(context).size.width,
                  child: PrimaryButton(
                      text: "Go To  Card",
                      onPressed: () {
                        controller.goToCart();
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

Widget richText(var text, var icon) {
  return Expanded(
    child: RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Padding(padding: EdgeInsets.only(right: 8), child: Text(icon)
                // SvgPicture.asset(
                //   icon,
                //   // ignore: deprecated_member_use
                //   color: AppColor.black_color,
                //   width: 16,
                //   height: 16,
                // ),
                ),
          ),
          TextSpan(text: text, style: TextStyle(color: AppColor.black_color)),
        ],
      ),
    ),
  );
}

class PHCardDetailsPage extends GetView<DrugsDetailsControllerImp> {
  const PHCardDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 1.5,
      width: MediaQuery.of(context).size.width * 1,
      child: Card(
        color: AppColor.primary_color,
        // color: Color.fromARGB(255, 100, 181, 246),
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  // color: AppColor.black_color,
                  height: 150,
                  width: 150,
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imagepath}/${controller.pharmacyModel.drugsImage}",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${controller.pharmacyModel.drugsName}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white_color),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${controller.pharmacyModel.drugsCatName}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.white_color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsScrollDrugs extends GetView<DrugsDetailsControllerImp> {
  const DetailsScrollDrugs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.width * 0.2),
      child: Container(
        height: MediaQuery.of(context).size.height - 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Color.fromARGB(255, 235, 242, 247),
        ),
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 3),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Price :",
                    style: TextStyle(
                      color: AppColor.black_color,
                    ),
                  ),
                  Text(
                    "\$ " + "${controller.pharmacyModel.drugsCost}",
                    style: TextStyle(
                      color: AppColor.greyDark_text_color,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Capacity :",
                    style: TextStyle(
                      color: AppColor.black_color,
                    ),
                  ),
                  Text(
                    "${controller.pharmacyModel.drugsCapacity}",
                    style: TextStyle(
                      color: AppColor.greyDark_text_color,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "State :",
                    style: TextStyle(
                      color: AppColor.black_color,
                    ),
                  ),
                  Text(
                    "${controller.pharmacyModel.drugsActive}" + " /5",
                    style: TextStyle(
                      color: AppColor.greyDark_text_color,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.add();
                    },
                    icon: Icon(
                      Icons.add_circle_outline_outlined,
                      color: AppColor.primary_color,
                    ),
                  ),
                  Text("${controller.countDrugs}"),
                  IconButton(
                      onPressed: () {
                        controller.remove();
                      },
                      icon: Icon(
                        Icons.remove_circle_outline_outlined,
                        color: AppColor.primary_color,
                      )),
                ],
              ),
              Divider(),
              Text(
                "Summary Of Achievements",
              ),
              SizedBox(height: 16),
              Text(
                "${controller.pharmacyModel.drugsDesc}",
                style: TextStyle(color: AppColor.black_color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
