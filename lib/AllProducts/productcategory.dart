import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/Details/icedetails.dart';
import 'package:ecommerce/Models/models.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: icecreams.length,
        physics: NeverScrollableScrollPhysics(),
         padding: EdgeInsets.all(5),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisExtent: 260,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
            ),
        itemBuilder: (context, index) {
          
           FoodDetail icecream = icecreams[index];
       
          
          return GestureDetector(
            onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IceDetails(icecream: icecream,)));
              
            },
            child: Container(
              height: 265,
              
              decoration: BoxDecoration(
                color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            offset: Offset(0, 1),
                            blurRadius: 4,
                            spreadRadius: 3,
                          ),
                ]
              ),
              child: Stack(
                children: [
                 Column(
                  children: [
                     Center(
                       child: ClipRRect(
                                     borderRadius: BorderRadius.circular(125),
                                     child: Image.asset(
                        icecream.image,
                        height: 120,
                        width: 120,
                        fit: BoxFit.fill,
                                     ),
                                   ),
                     ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(icecream.name,maxLines: 1,style: AppWidget.blackcolor(),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
                  ),
                  SizedBox(height:15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      
                      children: [
                        Text(icecream.cookingtime,style: AppWidget.bkcolor(),),
                        Spacer(),
                        
                        Icon(Icons.star,size: 18,color: Colors.amber.shade700,),
                        SizedBox(width:4,),
                        Text(icecream.rate.toString(),style:AppWidget.bkcolor()),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                 Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("NPR",style: AppWidget.gcolor(),),
                    ),
                     Text(icecream.price.toString(),style:AppWidget.gcolor())
                  ],
                 )
                  ],
                 ),
                 Padding(padding: EdgeInsets.only(left: 133,top:5 ),
                 child: Icon(Icons.favorite_border_outlined,color: Colors.black,),
                 ),
                 Align(
                  alignment: Alignment.bottomRight,
                  child: Material(
                  color: primarycolors,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: InkWell(
                    onTap: (){},
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Icon(Icons.add,color: Colors.white,),
                   ),
                    
                  ),
                  
                  ),
                 )
                ],
              ),
            ),
          );
        },
      ),

    );

        }
}
