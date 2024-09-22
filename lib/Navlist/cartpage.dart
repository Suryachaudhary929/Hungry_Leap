import 'package:ecommerce/AllProducts/add_to_cartpage.dart';
import 'package:ecommerce/Database/cart_provider.dart';
import 'package:ecommerce/Database/db.dart';
import 'package:ecommerce/Models/dart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constants/contants.dart';
import 'package:badges/badges.dart' as badges;

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> productname = [
    'IceCream',
    'Pizza',
    'Salad',
    'Burger',
    'Fruit',
    'Cake',
    'Coffee',
    'Drink',
    'Meat'
  ];
  List<String> productunit = [
    'Pieces',
    'Pieces',
    'KG',
    'Pieces',
    'KG',
    'Grams',
    'Cup',
    'Ltr',
    'KG'
  ];
  List<int> productPrice = [150, 200, 100, 1000, 100, 500, 120, 200, 300];
  List<String> productimage = [
    'assets/images/icecream1.png',
    'assets/images/pizzatopping.png',
    'assets/images/salad.png',
    'assets/images/burger.png',
    'assets/images/fruit.png',
    'assets/images/cake.png',
    'assets/images/coffee2.png',
    'assets/images/drinks.png',
    'assets/images/carousel1.png',
  ];
  late bool isloading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isloading = true;

    Future.delayed(Duration(seconds: 3));
    () {
      isloading = false;
    };
  }

  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolors,
        centerTitle: true,
        title: Text(
          "Product List",
          style: AppWidget.whitecolor(),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddCartPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: badges.Badge(
                badgeContent:
                    Consumer<CartProvider>(builder: (context, value, child) {
                  return Text(
                    value.getCounter().toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  );
                }),
                animationDuration: Duration(milliseconds: 300),
                child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          isloading == 0
              ? Center(
                  child: CircularProgressIndicator(
                  color: primarycolors,
                ))
              : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: productname.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.asset(
                                        productimage[index].toString(),
                                        height: 100,
                                        width: 110,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productname[index].toString(),
                                            style: AppWidget.blackcolor(),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //  Text(productunit[index].toString() +""+r"Rs"+ productPrice[index].toString(),style: AppWidget.bkcolor(),),
                                          Text(productunit[index].toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black
                                                      .withOpacity(0.7))),

                                          Row(
                                            children: [
                                              Text("Rs",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                  productPrice[index]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              MaterialButton(
                                                height: 50,
                                                onPressed: () {
                                                  dbHelper!
                                                      .insert(Cart(
                                                          id: index,
                                                          productid:
                                                              index.toString(),
                                                          productname:
                                                              productname[index]
                                                                  .toString(),
                                                          initialprice:
                                                              productPrice[
                                                                  index],
                                                          productprice:
                                                              productPrice[
                                                                  index],
                                                          quantity: 1,
                                                          unittag:
                                                              productunit[index]
                                                                  .toString(),
                                                          image: productimage[
                                                                  index]
                                                              .toString()))
                                                      .then((value) {
                                                    print(
                                                        "Product is Successfully added to cart");
                                                    cart.addTotalPrice(
                                                        int.parse(
                                                            productPrice[index]
                                                                .toString()));
                                                    cart.addCounter();
                                                  }).onError(
                                                          (error, stackTrace) {
                                                    print(error.toString());
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                elevation: 0,
                                                color: primarycolors,
                                                hoverColor:
                                                    Colors.blue.shade700,
                                                colorBrightness:
                                                    Brightness.dark,
                                                splashColor:
                                                    Colors.red.shade700,
                                                child: Text(
                                                  "Add to cart",
                                                  style: AppWidget.whitecolor(),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
