import 'package:mercy_touch/Core/app_export.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedicon;
  final void Function()? onPressedFav;
  final void Function()? onPressedsearch;
  const CustomAppBar(
      {super.key,
      required this.titleappbar,
      this.onPressedicon,
      this.onPressedsearch,
      this.onPressedFav});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: onPressedsearch, icon: Icon(Icons.search)),
                  hintText: titleappbar,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: false,
                  fillColor: AppColor.grey_allow_color),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            padding:
                EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 8),
            child: IconButton(
                onPressed: onPressedicon,
                icon: Icon(
                  Icons.notifications_active_outlined,
                  size: 30,
                  color: AppColor.primary_color,
                )),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            padding:
                EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 8),
            child: IconButton(
                onPressed: onPressedFav,
                icon: Icon(
                  Icons.favorite_border_rounded,
                  size: 30,
                  color: Colors.red,
                )),
          ),
        ],
      ),
    );
  }
}
