import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/SignIn/signin_page.dart';
import 'package:ecommerce/SignUP/signup_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/food.png",
                  height: 300,
                  width: 400,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Join Us Or Sign in",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(" We need it to connect components with you",
                    style: TextStyle(
                        color: const Color.fromARGB(147, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color:isselected ? Colors.blue:primarycolors,
                         boxShadow: [
                            BoxShadow(
                               color: Colors.white,
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                  ]),
                      child: MaterialButton(
                        elevation: 5,
                        textColor: Colors.white,
                        hoverColor:primarycolors,
                        onPressed: () {
                          setState(() {
                            isselected = !isselected;
                          });
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                        },
                        child: Text(
                          "Sign UP",
                          style: TextStyle(fontSize: 16,color:Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color:isselected ? primarycolors:Colors.blue,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ]),
                      child: MaterialButton(
                        textColor: Colors.black,
                        hoverColor:primarycolors,
                        onPressed: () {
                          setState(() {
                            isselected =!isselected;
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignPage()));
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(fontSize: 16,color: Colors.white),
                        ),
                      ),
                    ),
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
