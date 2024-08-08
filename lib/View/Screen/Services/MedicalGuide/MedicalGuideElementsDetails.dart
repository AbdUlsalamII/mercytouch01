//! It is possible to create a pop-up window to display information.
//*******************************************************************
//*******************************************************************
import 'package:mercy_touch/Controller/Services/MedicalGuide/MedicalGuideElementsDetails_controller.dart';
import 'package:mercy_touch/Core/app_export.dart';

class MedicalGuideElementsDetails extends StatelessWidget {
  const MedicalGuideElementsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MedicalGuideElementsDetailsImp());
    return Scaffold(
      backgroundColor: AppColor.white_color,
      body: Stack(
        children: <Widget>[
          //! --- CardDetails
          MGCardDetailsPage(),
          //! --- ScrollDetails
          MGDetailsScrollDoctor(),
          //! --- Button
          Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              child: PrimaryButton(
                  text: "Make Appointment",
                  onPressed: () {
                    print("salam");
                  })),
        ],
      ),
    );
  }
}

class MGCardDetailsPage extends GetView<MedicalGuideElementsDetailsImp> {
  const MGCardDetailsPage({super.key});

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
                  // child: CachedNetworkImage(
                  //   imageUrl:
                  //       "${AppLink.imagepath}/${controller.medicalGuideModel.}",
                  //   height: 150,
                  //   width: 150,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dr." + "${controller.medicalGuideModel.mGuidCatName}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white_color),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${controller.medicalGuideModel.mGuideElementsSepcialization}",
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

class MGDetailsScrollDoctor extends GetView<MedicalGuideElementsDetailsImp> {
  const MGDetailsScrollDoctor({super.key});

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
                    "Per Consultation :",
                    style: TextStyle(
                      color: AppColor.black_color,
                    ),
                  ),
                  Text(
                    "\$ 120",
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
                    "Duration :",
                    style: TextStyle(
                      color: AppColor.black_color,
                    ),
                  ),
                  Text(
                    "NUmber ",
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
                    "Rating :",
                    style: TextStyle(
                      color: AppColor.black_color,
                    ),
                  ),
                  Text(
                    " " + " /5",
                    style: TextStyle(
                      color: AppColor.greyDark_text_color,
                    ),
                  ),
                ],
              ),
              Divider(),
              Text(
                "DR information",
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  richText("Consultation duration", "icon"),
                  richText(
                      "",
                      "icon"),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  richText(
                    "",
                    "icon",
                  ),
                  richText(
                      "", "icon"),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  richText("",
                      "icon"),
                ],
              ),
              Divider(),
              Text(
                "Summary Of Achievements",
              ),
              SizedBox(height: 16),
              Text(
                "",
              ),
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
