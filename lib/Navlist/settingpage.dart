// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:ecommerce/FoodPage/food_page.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/Constants/contants.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  File? imgFile;
  String? imgpath;
  // Image? imageFromPreferences;

  Future pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);

    if (pickedImage != null) {
      setState(() {
        imgFile = File(pickedImage.path);
      });
    }
  }

  // loadImage() {
  //   Utility.getImage().then((img) {
  //     if (null == img) {
  //       return;
  //     }
  //     setState(() {
  //       imageFromPreferences = Utility.imageFromBase64String(img);
  //     });
  //   });
  // }

  void initState() {
    super.initState();
  }
//  final image = "man.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 240, 219),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 365,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primarycolors,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        spreadRadius: 4,
                        blurRadius: 3,
                        offset: Offset(0, 1))
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 240, 219),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FoodPage()));
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: primarycolors,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                            "My Profile",
                            style: AppWidget.whitecolor(),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        pickImage(ImageSource.gallery);
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            imgFile != null ? FileImage(imgFile!) : null,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rabin Hood",
                      style: AppWidget.whitecolor(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("rabin@gmail.com", style: AppWidget.greycolor()),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text(
                      "My Account",
                      style: AppWidget.blackcolor(),
                    ),
                    leading: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ExpansionTile(
                    title: Text(
                      "My Order",
                      style: AppWidget.blackcolor(),
                    ),
                    leading: Icon(
                      Icons.pages,
                      size: 30,
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      "My Vouchers",
                      style: AppWidget.blackcolor(),
                    ),
                    leading: Icon(
                      Icons.money,
                      size: 30,
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      "Payments Methods",
                      style: AppWidget.blackcolor(),
                    ),
                    leading: Icon(
                      Icons.payment,
                      size: 30,
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      "Address",
                      style: AppWidget.blackcolor(),
                    ),
                    leading: Icon(
                      Icons.location_on,
                      size: 30,
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      "Invite Friends",
                      style: AppWidget.blackcolor(),
                    ),
                    leading: Icon(
                      Icons.person_add,
                      size: 30,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.red.shade700,
                      
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout,size: 30,color: Colors.red.shade700,),
                        SizedBox(width: 5,),
                        Text("Logout",style: TextStyle(color: Colors.red.shade700,fontSize: 20,fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                ],
              ),
              
            )
          ],
        ),
      ),
    );
  }
}
