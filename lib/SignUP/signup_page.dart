import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/SignIn/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isHidden = true;
  bool value = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Processing Data'),
          backgroundColor: primarycolors,
        ),
      );
    }
  }

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();


  final firebaseAuth = FirebaseAuth.instance;
  Future<String> Register(String username, String email,String password,String confirmpassword) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: username, password: password);
      return 'Success';
    } on FirebaseException catch (e) {
      return e.message.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 60.0),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Form(
                
                key: formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller:usernamecontroller ,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username required';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: primarycolors.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.person)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email required';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: primarycolors.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.email)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password required';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: primarycolors.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: _isHidden
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          )),
                      obscureText: _isHidden,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: confirmpasswordcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password required';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: primarycolors.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: _isHidden
                                ? Icon(
                                    Icons.visibility_off,
                                    color: primarycolors,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: primarycolors,
                                  ),
                          )),
                      obscureText: _isHidden,
                    ),
                  ],
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(
                    activeColor: primarycolors,
                    value: this.value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  Text(
                    "I agree to the",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "terms & conditions",
                    style: TextStyle(fontSize: 16, color: primarycolors),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 3,
                  ),
                  child: ElevatedButton(
                    onPressed: ()async {
                      var res = await Register(usernamecontroller.text, emailcontroller.text, passwordcontroller.text, confirmpasswordcontroller.text);
                      if(res=='Success'){
                       
                         setState(() {
                        validate();
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignPage()));
                           print("Registered Successfully");
                      }else{
                        print(res);
                      }
                     
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: primarycolors,
                    ),
                  )),
              Center(child: Text("Or")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(color: primarycolors)),
                    child: Image.asset(
                      "assets/images/facebook.png",
                      fit: BoxFit.cover,
                      scale: 1,
                    ),
                  ),
                  Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: primarycolors)),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/google.png"),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignPage()));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: primarycolors),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
