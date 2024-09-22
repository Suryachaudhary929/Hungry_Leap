import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/SignIn/signin_page.dart';
import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  bool _isHidden = true;
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
              border: Border.all(color: primarycolors),
            ),
            child: InkWell(
              onTap: () {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Reset Your Password",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Confirm Your New Password",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                SizedBox(
                  height: 100,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 60,
                      width: 355,
                      child: Form(
                        child: TextField(
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                              hintText: "New Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              fillColor: primarycolors.withOpacity(0.1),
                              filled: true,
                              suffixIcon: InkWell(
                                onTap: _Toggle,
                                child: _isHidden
                                    ? Icon(
                                        Icons.visibility_off_rounded,
                                        color: primarycolors,
                                      )
                                    : Icon(
                                        Icons.visibility_rounded,
                                        color: Colors.black,
                                      ),
                              ),
                              prefixIcon: const Icon(
                                Icons.password,
                                color: primarycolors,
                              )),
                        ),
                      )),
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      height: 60,
                      width: 355,
                      child: Form(
                        child: TextField(
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                              hintText: "Re-Type Your New Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              fillColor: primarycolors.withOpacity(0.1),
                              filled: true,
                              suffixIcon: InkWell(
                                onTap: _Toggle,
                                child: _isHidden
                                    ? Icon(
                                        Icons.visibility_off_rounded,
                                        color: primarycolors,
                                      )
                                    : Icon(
                                        Icons.visibility_rounded,
                                        color: Colors.black,
                                      ),
                              ),
                              prefixIcon: const Icon(
                                Icons.password,
                                color: primarycolors,
                              )),
                        ),
                      )),
                ]),
                SizedBox(
                  height: 100,
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
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Reset Your Password!'),
                            content: Text(
                                'You Successfully makes a payment,enjoy our services'),
                            actions: [
                              Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: primarycolors,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.white)),
                                child: MaterialButton(
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>SignPage()));
                                  },
                                  child: Text('Yes'),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: primarycolors,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.white)),
                                child: MaterialButton(
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No'),
                                ),
                              ),
                            ],
                          ),
                        );
                        //  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: SignUpPage.verify, smsCode:code);

                        // Sign the user in (or link) with the credential
                        // await auth.signInWithCredential(credential);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: primarycolors,
                            content: Text(
                              "Password Updated!",
                              selectionColor: Colors.redAccent,
                            )));
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => ()));
                      },
                      child: Text(
                        "Reset Password",
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _Toggle() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
