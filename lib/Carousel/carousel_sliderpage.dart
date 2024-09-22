import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({
    super.key,
  });

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  List imageList = [
     {
      "id": 0,
      "image-src": "assets/images/cold.jpg",
    },
    {
      "id": 1,
      "image-src": "assets/images/save.webp",
    },
    {"id": 2, "image-src": "assets/images/1.jpg"},
    {"id": 3, "image-src": "assets/images/cream.jpg"},
    {"id": 4, "image-src": "assets/images/food.jpg"},
    {"id": 5, "image-src": "assets/images/coffee1.jpg"},
    {"id": 6, "image-src": "assets/images/cake.webp"},
    {"id": 7, "image-src": "assets/images/pizza.jpg"},
    {"id": 8, "image-src": "assets/images/burger.jpg"},
  ];
   final CarouselControllerImpl carouselController = CarouselControllerImpl();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width *1,
      // decoration: BoxDecoration(border: Border.all(width: 2)),
      child: CarouselSlider(
          items: imageList
              .map((e) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // border: Border.all(width: 2,color: Colors.b)
                            ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Container(
                          
                          // height: double.infinit,
                          width: double.infinity,
                          child: Image.asset(
                            e['image-src'],
                            fit: BoxFit.fill,height: 210,
                            
                          ),
                        ),
                      ),
                    ],
                  ))
              .toList(),
          carouselController: carouselController,
          options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 1080 / 750,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              })),
    );
  }
}


