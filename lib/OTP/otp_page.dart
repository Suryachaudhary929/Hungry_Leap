import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/Reset/reset_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
   var code ='';
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
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color:primarycolors),
            ),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
              Icons.arrow_back,size: 20,
              color:primarycolors,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Your OTP Code",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "We just sent to your phone a 4-digit code via SMS to confirm your number.",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 68,
                          width: 64,
                          child: Form(
                            child: TextFormField(
                            onSaved: (pin1){},
                              onChanged: (value) {
                                code=value;

                                if(value.length==1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                                decoration: InputDecoration(
                                  hintText: "0",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                              inputFormatters: [LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly]
                            ),
                          )),
                      Container(
                          height: 68,
                          width: 64,
                          child: Form(
                            child: TextFormField(
                               onSaved: (pin2){},
                               onChanged: (value) {
                                 code=value;
                                if(value.length==1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                                decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                              inputFormatters: [LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly]
                            ),
                          )),
                      Container(
                          height: 68,
                          width: 64,
                          child: Form(
                            child: TextFormField(
                               onSaved: (pin3){},
                               onChanged: (value) {
                                 code=value;
                                if(value.length==1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                                decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                              inputFormatters: [LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly]
                            ),
                          )),
                      Container(
                          height: 68,
                          width: 64,
                          child: Form(
                            child: TextFormField(
                               onSaved: (pin4){},
                               onChanged: (value) {
                                 code=value;
                                if(value.length==1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                                decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            inputFormatters: [LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                            ],
                            ),
                            
                          )),
                    ],
                  ),
                ),
               
                SizedBox(height: 100,),
                Center(
                  child: Container(
                    height: 60,
                    width: 370,
                    decoration: BoxDecoration(
                      color: primarycolors,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child:  MaterialButton(
                          onPressed: () {
                            //  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: SignUpPage.verify, smsCode:code);

    // Sign the user in (or link) with the credential
    // await auth.signInWithCredential(credential);

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: primarycolors,
                              content: Text("Successfully Verifying 4 digit otp code",selectionColor: Colors.redAccent,)));
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>ResetPage()));
          
                          },
                          child: Text(
                            "Verify",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                  ),
                ),
                SizedBox(height: 20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You didn't receive a code?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text("Resend",style: TextStyle(color: primarycolors,fontSize: 16,fontWeight: FontWeight.bold),)
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
