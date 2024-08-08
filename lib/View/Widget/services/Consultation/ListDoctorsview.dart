import 'package:mercy_touch/Controller/favorite_controller.dart';
import 'package:mercy_touch/Core/app_export.dart';
import 'package:mercy_touch/Data/Model/services/Consultaition/DoctorsModel.dart';
import 'package:nb_utils/nb_utils.dart';

class ListDoctorsView extends GetView<DoctorsControllerImp> {
  final DoctorsModel doctorsModel;
  const ListDoctorsView({
    super.key,
    required this.doctorsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          controller.goToPageDoctorDetails(doctorsModel);
        },
        child: Card(
          color: AppColor.bg,
          elevation: 7.0,
          shadowColor: AppColor.primary_color,
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: CachedNetworkImage(
                        imageUrl: AppLink.imagepath +
                            "/" +
                            "${doctorsModel.doctorsImage}",
                        height: 130,
                      ).cornerRadiusWithClipRRect(20),
                    ),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dr: ${doctorsModel.doctorsName}',
                            style: boldTextStyle(
                                size: 18, weight: FontWeight.w500)),
                        8.height,
                        Text('${doctorsModel.doctorsPhone ?? 0}',
                            style:
                                primaryTextStyle(color: Colors.blue, size: 14)),
                        8.height,
                        Text('${doctorsModel.doctorsClinicAddress!}',
                            style: primaryTextStyle(size: 14))
                      ],
                    ).expand(),
                  ],
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      text: 'View Details',
                      textStyle: primaryTextStyle(size: 15),
                      color: Colors.blue,
                      shapeBorder:
                          RoundedRectangleBorder(borderRadius: radius(16)),
                      onTap: () {},
                    ),
                    GetBuilder<FavoriteControllerImp>(
                      builder: (controller) => IconButton(
                        onPressed: () {
                          if (controller.isFavorite[doctorsModel.doctorsId] ==
                              1) {
                            controller.setFavorite(doctorsModel.doctorsId, 0);
                            controller.removeFavorite(
                                doctorsModel.doctorsId.toString());
                          } else {
                            controller.setFavorite(doctorsModel.doctorsId, 1);
                            controller
                                .addFavorite(doctorsModel.doctorsId.toString());
                          }
                        },
                        icon: Icon(
                          controller.isFavorite[doctorsModel.doctorsId] == 1
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
