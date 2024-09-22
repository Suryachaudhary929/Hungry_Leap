import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/FoodPage/food_page.dart';
import 'package:ecommerce/Forget/forget_password.dart';
import 'package:ecommerce/SignUP/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  bool _isHidden = true;
  bool value = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final firebaseAuth = FirebaseAuth.instance;

  Future<String> Login(String username, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: username, password: password);
      return 'Success';
    } on FirebaseException catch (e) {
      return e.message.toString();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputField(context),
            _forgotPassword(context),
            _signup(context),
          ],
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credential to login"),
      ],
    );
  }

  _inputField(context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: usernamecontroller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter your username';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none),
                fillColor: primarycolors.withOpacity(0.2),
                filled: true,
                prefixIcon: Icon(Icons.person)),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: passwordcontroller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter your valid password';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none),
                fillColor: primarycolors.withOpacity(0.2),
                filled: true,
                prefixIcon: const Icon(Icons.password),
                suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: _isHidden
                      ? Icon(
                          Icons.visibility,
                          color: primarycolors,
                        )
                      : Icon(
                          Icons.visibility_off_rounded,
                          color: primarycolors,
                        ),
                )),
            obscureText: _isHidden,
          ),
          SizedBox(height: 10),
          Row(
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
                "Remember me",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: ()async {
              var res = await Login(usernamecontroller.text, passwordcontroller.text);
              if (res == "success") {
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login Successfully'),
                    backgroundColor: primarycolors,
                  ),
                );
                 if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();
               
              }

              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => FoodPage())));
              }else{
                print(res);
              }
             
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: primarycolors,
            ),
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ForgetPassword()));
      },
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: primarycolors),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account? "),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: primarycolors),
            ))
      ],
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
