// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/Navlist/cartpage.dart';
import 'package:ecommerce/Navlist/favouritepage.dart';
import 'package:ecommerce/Navlist/homepage.dart';
import 'package:ecommerce/Navlist/messagepage.dart';
import 'package:ecommerce/Navlist/settingpage.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          HomePage(),
          FavouritePage(),
          MessagePage(),
          CartPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueGrey,
        buttonBackgroundColor: Colors.white,
        color: const Color.fromARGB(255, 255, 240, 219),
        height: 65,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 35,
            color: Colors.red,
          ),
          Icon(
            Icons.favorite,
            size: 35,
            color: Colors.deepPurpleAccent,
          ),
          Icon(
            Icons.message,
            size: 35,
            color: Colors.green,
          ),
          Icon(
            Icons.shopping_cart,
            size: 35,
            color: Colors.blue,
          ),
          Icon(
            Icons.settings,
            size: 35,
            color: Colors.blue,
          )
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        },
      ),
    );
  }
}
