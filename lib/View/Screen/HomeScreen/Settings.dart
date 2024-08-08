import 'package:mercy_touch/Controller/HomeScreen/Settings_controller.dart';
import 'package:mercy_touch/Core/app_export.dart';
import 'package:mercy_touch/bricks/Widgets%20Example/header_with_trailing_action.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    // ignore: unused_local_variable
    double widthC = MediaQuery.of(context).size.width * 100;

    return Scaffold(
      backgroundColor: AppColor.white_color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                //! Cover image
                Ink(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${AppLink.imagepath}/doclab2.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                Ink(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                  ),
                ),
                //! Circular Image
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 120),
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        color: Colors.grey.shade500,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.white,
                              width: 6.0,
                            ),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: CachedNetworkImage(
                                  imageUrl: "${AppLink.imagepath}/doclab1.jpg",
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            //! Text for example : Name
            // Container(
            //   width: widthC,
            //   margin: const EdgeInsets.all(10),
            //   alignment: AlignmentDirectional.center,
            //   child: Column(
            //     children: <Widget>[
            //       Text('Lorem Ipsum',
            //           style: TextStyle(
            //               fontSize: 20,
            //               color: Colors.teal,
            //               fontWeight: FontWeight.bold)),
            //       SizedBox(height: 10),
            //       Text('Flutter',
            //           style: TextStyle(
            //               color: Colors.grey.shade50,
            //               fontStyle: FontStyle.italic))
            //     ],
            //   ),
            // ),
            //! List
            Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  color: AppColor.white_color,
                  elevation: 7,
                  shadowColor: AppColor.splash_color,
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SettingListTile(
                              icon: Icon(Icons.email_outlined),
                              text: "E-Mail",
                              iconOnPressed: () {},
                              subtitle: "exampl@mail.com",
                            ),
                            Divider(),
                            SettingListTile(
                              icon: Icon(Icons.location_on_outlined),
                              text: "Address",
                              iconOnPressed: () {},
                            ),
                            Divider(),
                            SettingListTile(
                              icon: Icon(Icons.help_outline_rounded),
                              text: "About us",
                              iconOnPressed: () {},
                            ),
                            Divider(),
                            SettingListTile(
                              icon: Icon(Icons.phone_callback_rounded),
                              text: "Contact us",
                              iconOnPressed: () {},
                            ),
                            Divider(),
                            ListTile(
                              title: Text("Notifications"),
                              trailing: Switch(
                                splashRadius: 10,
                                value: true,
                                onChanged: (val) {},
                                activeColor: AppColor.primary_color,
                                // inactiveTrackColor: AppColor.grey_text_color,
                              ),
                            ),
                            Divider(),
                            SettingListTile(
                              icon: Icon(Icons.logout_rounded),
                              text: "Logout",
                              iconOnPressed: () {controller.logOut();},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
