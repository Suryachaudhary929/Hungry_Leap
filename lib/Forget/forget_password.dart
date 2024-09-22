import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/OTP/otp_page.dart';
import 'package:ecommerce/SignIn/signin_page.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool _isLoading = false;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //     Future.delayed(Duration(seconds: 2));
  //   _isLoading = false;
  //  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              // color: Color.fromARGB(255, 191, 165, 203),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color:primarycolors),
            ),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: primarycolors,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Forget Your Password",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Reset Your New Password",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 60,
                            width: 355,
                            child: Form(
                                child: TextField(
                    decoration: InputDecoration(
                        hintText: "E-mail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none),
                        fillColor: primarycolors.withOpacity(0.2),
                        filled: true,
                        prefixIcon: const Icon(Icons.email_rounded,color:primarycolors,)),
                  ), 
                            )),
                      ]),
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Container(
                    height: 60,
                    width: 355,
                    decoration: BoxDecoration(
                        color: primarycolors,
                        borderRadius: BorderRadius.circular(30)),
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          _isLoading =true;
                        });
                        Future.delayed(Duration(seconds: 3),(){
                           setState(() {
                          _isLoading = false;
                        });
                        });
                        //  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: SignUpPage.verify, smsCode:code);

                        // Sign the user in (or link) with the credential
                        // await auth.signInWithCredential(credential);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: primarycolors,
                            content: Text(
                          "Please Fill Your 4-digit OTP Code",
                          
                          
                        )));
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => OtpPage()));
                      },
                      child:_isLoading ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Processing...",style: AppWidget.whitecolor()),
                          SizedBox(width: 10,),
                          CircularProgressIndicator(color: Colors.white,),
                        ],
                      ):Text(
                        "Send Code",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Go Back To",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 3,),
                    InkWell(
                      onTap: (){
                      
                         Navigator.push(context, MaterialPageRoute(builder: ((context) => SignPage())));
                      },
                      
                      child:Text(
                        "Sign In",
                        style: TextStyle(
                            color: primarycolors,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
