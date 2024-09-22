import 'package:flutter/material.dart';

import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/FoodPage/food_page.dart';
import 'package:ecommerce/Models/models.dart';

class IceDetails extends StatefulWidget {
  const IceDetails({
    Key? key,
    required this.icecream,
 
  }) : super(key: key);
  final FoodDetail icecream;
 
 
  // final FoodDetail icecream;
  // final FoodDetail pizz;

  @override
  State<IceDetails> createState() => _IceDetailsState();
}

class _IceDetailsState extends State<IceDetails> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolors,
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          DetailPageHeader(),
          DetailImage(),
          Container(
          
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          widget.icecream.name,
                          
                          maxLines: 1,
                          style: AppWidget.Bcolor(),
                        ),
                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              child: Text(
                                "NPR",
                                style: AppWidget.gcolor(),
                              ),
                            ),
                            Text(widget.icecream.price.toString(),
                                style: AppWidget.gcolor())
                          ],
                        )
                      ],
                    )),
                    Material(
                      color: primarycolors,
                      borderRadius: BorderRadius.circular(30),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity > 0) {
                                    quantity -= 0;
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "$quantity",
                            style: AppWidget.whitecolor(),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity += 0;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 27,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.amber.shade700,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(widget.icecream.rate.toString(),
                        style: AppWidget.BBcolor()),
                    Spacer(),
                    Icon(
                      Icons.fiber_manual_record,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.icecream.kcal,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.access_time_filled,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(widget.icecream.cookingtime,
                        maxLines: 1, style: AppWidget.bkcolor()),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.icecream.description,textAlign: TextAlign.justify,
                     style: TextStyle(fontSize: 16,color: Colors.black54)),
                     SizedBox(height: 25,),
                     Material(
                      color: primarycolors,
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                         borderRadius: BorderRadius.circular(15),

                        onTap: (){},
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 21),
                          child: Text("Add to cart",textAlign: TextAlign.center,style:AppWidget.whitecolor(),),
                        ),
                      ),
                     ),
                      SizedBox(height: 80,),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox DetailImage() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
              )),
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.10),
                      blurRadius: 15,
                      offset: Offset(0, 8))
                ],
                borderRadius: BorderRadius.circular(250),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(250),
                child: Image.asset(
                  widget.icecream.image,
                  height: 250,
                  width: 250,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding DetailPageHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.21),
            child: BackButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodPage()));
              },
              color: Colors.white,
            ),
          ),
          Spacer(),
          Text(
            "IceCream",
            style: AppWidget.whitecolor(),
          ),
          Spacer(),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.21),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
