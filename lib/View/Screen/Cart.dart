import 'package:mercy_touch/Controller/cart_controller.dart';
import 'package:mercy_touch/Core/app_export.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp cartController = Get.put(CartControllerImp());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartControllerImp>(
          builder: (Controller) => BottomNavgationBarCart(
              price: "${cartController.priceorders}",
              shipping: "Shipping",
              totalprice: "1500"),
        ),
        body: GetBuilder<CartControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                TopAppbarCart(
                  title: 'My Cart',
                ),
                SizedBox(height: 10),
                TopCardCart(
                    message:
                        "You Have ${cartController.totalcountdrugs} Drugs in Your List"),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(
                        cartController.data.length,
                        (index) => CustomItemsCartList(
                          name: "${cartController.data[index].drugsName}",
                          price: "${cartController.data[index].drugsprice}\$",
                          count: "${cartController.data[index].counterdrugs}",
                          image: "${cartController.data[index].drugsImage}",
                          onAdd: () async {
                         await   cartController.add(
                                cartController.data[index].drugsId.toString());
                            cartController.refreshPage();
                          },
                          onRemove: () async{
                           await cartController.delete(
                                cartController.data[index].drugsId.toString());
                            cartController.refreshPage();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

//!======================================================================
class BottomNavgationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.shipping,
      required this.totalprice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("price", style: TextStyle(fontSize: 16))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$price \$", style: TextStyle(fontSize: 16)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$shipping", style: TextStyle(fontSize: 16))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("300 \$", style: TextStyle(fontSize: 16)))
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Total Price",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary_color))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalprice \$",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary_color)))
          ],
        ),
        SizedBox(height: 10),
        PrimaryButton(
          onPressed: () {},
          text: '"Place Order"',
        )
      ],
    ));
  }
}

//!======================================================================
class TopAppbarCart extends StatelessWidget {
  final String title;
  const TopAppbarCart({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
            )),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(fontSize: 25),
              ),
            )),
            Spacer()
          ],
        ));
  }
}

//!======================================================================
class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.image,
    this.onAdd,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imagepath}/${image}",
              height: 80,
            ),
          ),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: TextStyle(fontSize: 15)),
                subtitle: Text(price,
                    style:
                        TextStyle(color: AppColor.primary_color, fontSize: 17)),
              )),
          Expanded(
              child: Column(
            children: [
              Container(
                  height: 35,
                  child: IconButton(onPressed: onAdd, icon: Icon(Icons.add))),
              Container(
                  height: 30,
                  child: Text(
                    count,
                    style: TextStyle(fontFamily: "sans"),
                  )),
              Container(
                  height: 25,
                  child:
                      IconButton(onPressed: onRemove, icon: Icon(Icons.remove)))
            ],
          ))
        ]),
      ),
    );
  }
}

//!======================================================================\
class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      margin: EdgeInsets.symmetric(horizontal: 20),
      // height: 20,
      decoration: BoxDecoration(
        color: AppColor.primary_color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(message,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColor.white_color)),
    );
  }
}
