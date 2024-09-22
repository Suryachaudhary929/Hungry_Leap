// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart' as badges;
import 'package:ecommerce/Database/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/Database/cart_provider.dart';
import 'package:ecommerce/Models/dart_model.dart';

class AddCartPage extends StatefulWidget {
  const AddCartPage({super.key});

  @override
  State<AddCartPage> createState() => _AddCartPageState();
}

class _AddCartPageState extends State<AddCartPage> {
  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolors,
        centerTitle: true,
        title: Text(
          "My Products",
          style: AppWidget.whitecolor(),
        ),
        actions: [
          Padding(
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
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image.asset(
                                          snapshot.data![index].image
                                              .toString(),
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot
                                                      .data![index].productname
                                                      .toString(),
                                                  style: AppWidget.blackcolor(),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      dbHelper!.delete(snapshot
                                                          .data![index].id);
                                                      cart.removeCounter();
                                                      cart.removeTotalPrice(
                                                          int.parse(snapshot
                                                              .data![index]
                                                              .productprice
                                                              .toString()));
                                                    },
                                                    child: Icon(
                                                      Icons.delete,
                                                      color:
                                                          Colors.red.shade700,
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            //  Text(productunit[index].toString() +""+r"Rs"+ productPrice[index].toString(),style: AppWidget.bkcolor(),),
                                            Text(
                                                snapshot.data![index].unittag
                                                    .toString(),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                    snapshot.data![index]
                                                        .productprice
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: primarycolors,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                              .quantity
                                                              .toString(),
                                                          style: AppWidget
                                                              .whitecolor(),
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              int quantity =
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .quantity;
                                                              int price = snapshot
                                                                  .data![index]
                                                                  .initialprice;
                                                              quantity--;
                                                              int newprice =
                                                                  price *
                                                                      quantity;
                                                                      if(quantity > 0){
                                                                         dbHelper!.updateQuantity(Cart(
                                                                  id: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id,
                                                                  productid: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  productname: snapshot
                                                                      .data![
                                                                          index]
                                                                      .productname,
                                                                  initialprice: snapshot
                                                                      .data![
                                                                          index]
                                                                      .initialprice,
                                                                  productprice:
                                                                      newprice,
                                                                  quantity:
                                                                      quantity,
                                                                  unittag: snapshot
                                                                      .data![
                                                                          index]
                                                                      .unittag
                                                                      .toString(),
                                                                  image: snapshot
                                                                      .data![
                                                                          index]
                                                                      .image
                                                                      .toString())).then((value){
                                                                        newprice =0;
                                                                        quantity = 0;
                                                                        cart.removeTotalPrice(int.parse(snapshot
                                                                      .data![
                                                                          index]
                                                                      .initialprice.toString()));

                                                                      } ).onError((error, stackTrace){
                                                                        print(error.toString());
                                                                      });

                                                                      }
                                                             
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                            ))
                                                      ],
                                                    ),
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
                  );
                }
                return const CircularProgressIndicator();
              }),
          Consumer<CartProvider>(builder: (context, value, child) {
            return Visibility(
              visible: value.getTotalPrice().toStringAsFixed(2) == '0.00'
                  ? false
                  : true,
              child: Column(
                children: [
                  ResuablePage(
                      tittle: 'Sub Total',
                      value: r'Rs' + value.getTotalPrice().toStringAsFixed(2))
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class ResuablePage extends StatelessWidget {
  final String tittle, value;
  const ResuablePage({
    Key? key,
    required this.tittle,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          tittle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
