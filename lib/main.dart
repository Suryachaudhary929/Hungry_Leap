import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce/Database/cart_provider.dart';
import 'package:ecommerce/Onboarding/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCqzaPRtSgNOkybRqbrX9_W-8oMwhSU1Pc",
            appId: "1:1075283854762:web:5ab9f3fc45c483310e57d3",
            messagingSenderId: "1075283854762",
            projectId: "hungry-leap"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            title: "Hungry Leap",
            theme: ThemeData.light(),
            home: AnimatedSplashScreen(
              animationDuration: Duration(seconds: 5),
              splash: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/dinner.png",
                      fit: BoxFit.cover, height: 270, width: 295),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hungry",
                        style: TextStyle(
                            color: Colors.purple.shade700,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Leap",
                        style: TextStyle(
                            color: Colors.greenAccent.shade700,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
              splashIconSize: 350,
              nextScreen: OnboardingScreen(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: const Color.fromARGB(255, 255, 240, 219),
            ));
      }),
    );
  }
}
