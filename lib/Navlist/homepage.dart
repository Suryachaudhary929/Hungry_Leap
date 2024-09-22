import 'package:ecommerce/AllProducts/productcategory.dart';
import 'package:ecommerce/Carousel/carousel_sliderpage.dart';
import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/DisplayScreen/display_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int currentslide = 0;
  List Categories = [
    {
      "image": "assets/images/icecream.png",
      "name": "IceCream",
    },
    {
      "image": "assets/images/pizza.png",
      "name": "Pizza",
    },
    {
      "image": "assets/images/salad.png",
      "name": "Salad",
    },
    {
      "image": "assets/images/burger.png",
      "name": "Burger",
    },
    {
      "image": "assets/images/fruits.png",
      "name": "Fruit",
    },
    {
      "image": "assets/images/cake.png",
      "name": "Cake",
    },
    {
      "image": "assets/images/coffee.png",
      "name": "Coffee",
    },
    {
      "image": "assets/images/drinks.png",
      "name": "Drink",
    },
    {
      "image": "assets/images/meat.png",
      "name": "Meat",
    },
  ];
  int page =0;
   
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 240, 219),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: primarycolors,
                    backgroundImage: AssetImage("assets/images/foodman.png"),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        size: 20,
                        color: primarycolors,
                      ),
                      Text(
                        "Nepal",
                        style: AppWidget.color(),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                        color: primarycolors,
                      )
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primarycolors),
                    ),
                    child: Icon(
                      Icons.shopping_cart_checkout,
                      size: 30,
                      color: primarycolors,
                    ),
                  ),
                 
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Ready To Order Your",
                style: TextStyle(
                    color: primarycolors,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: primarycolors.withOpacity(0.1),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: primarycolors,
                    ),
                    hintText: "Search Receipe"),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductCategory()));
                },
                child: Container(
                  padding: EdgeInsets.zero,
                  height: 122,
                  child: ListView.builder(
                      itemCount: Categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        
                        return CategoriesFile(
                          image: Categories[index]['image'],
                          name: Categories[index]['name'],
                         
                           
                        );
                      }),
                ),
              ),
              CarouselScreen(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ALL Products",
                    style: AppWidget.blackcolor(),
                  ),
                  Text(
                    "See All ",
                    style: TextStyle(fontSize: 20, color: primarycolors),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              DisplayScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoriesFile extends StatelessWidget {
  String image;
  String name;
   

  CategoriesFile({
    Key? key,
    required this.image,
    required this.name,
      
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(right: 10.0),
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          Text(name, style: TextStyle(color: primarycolors)),
          Icon(
            Icons.arrow_forward,
            color: primarycolors,
            size: 20,
          )
        ],
      ),
     
    );
  }
}