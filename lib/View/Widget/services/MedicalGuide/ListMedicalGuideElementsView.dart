import 'package:mercy_touch/Core/app_export.dart';
import 'package:nb_utils/nb_utils.dart';

class ListMedicalGuideElementsView extends GetView<DoctorsControllerImp> {
  final MedicalGuideModel medicalGuideModel;
  final bool active;
  const ListMedicalGuideElementsView({super.key, required this.medicalGuideModel,required this.active,});

  @override
  Widget build(BuildContext context) {
    return  Container(
          child: InkWell(
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
                        // Container(
                        //   height: 100,
                        //   width: 100,
                        //   child: CachedNetworkImage(
                        //     imageUrl: AppLink.imagepath + "/" + "${medicalGuideModel.ima}",
                        //     height: 130,
                        //   ).cornerRadiusWithClipRRect(20),
                        // ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dr: ${medicalGuideModel.mGuidCatName}',
                                style: boldTextStyle(
                                    size: 18, weight: FontWeight.w500)),
                            8.height,
                            Text('${medicalGuideModel.mGuideElementsPhone ?? 0}',
                                style: primaryTextStyle(
                                    color: Colors.blue, size: 14)),
                            8.height,
                            Text('${medicalGuideModel.mGuideElementsLocation!}',
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
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                               active
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                              color: Colors.red,
                              size: 30,
                            ))
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
