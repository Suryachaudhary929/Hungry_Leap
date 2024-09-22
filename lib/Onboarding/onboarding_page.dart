import 'package:ecommerce/Constants/contants.dart';
import 'package:ecommerce/SignIn%20And%20SignUp/signinand-signup.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
} 

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<OnBoard> data = [
   
    OnBoard(
        image: "assets/images/delivery.png",
        title: "Fast & Get Best Food",
        description:
            " Provide excellent customer service and build customer loyalty by delivering food in a timely."),
             OnBoard(
        image: "assets/images/location.png",
        title: "Find Restaurant Near You",
        description:
            "Discover and book the best restaurants near your location. View menus, reviews, photos and choose from available dining times."),
    OnBoard(
        image: "assets/images/pay.png",
        title: "Easy Payment System",
        description:
            "Commonly accepted payment methods include cash, credit cards, debit cards, gift cards, and mobile payments."),
            OnBoard(image: "assets/images/receive.png", title: "Confirm", description: "Safely receive the delivery products.")
  ];
  int currentIndex = 0;
  
bool isActive= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                itemCount: data.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnBoardContent(
                    image: data[index].image,
                    title: data[index].title,
                    description: data[index].description)),
          ),
          
          Padding(
            padding: const EdgeInsets.only(bottom: 70,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width:isActive ?20:10,
                  decoration: BoxDecoration(
                    color: currentIndex == 0 ?primarycolors: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: currentIndex == 1 ? primarycolors: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: currentIndex == 2 ?primarycolors : Colors.black12,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: currentIndex == 3 ?primarycolors: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (Context) => MainPage()));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color:primarycolors),
                    )),
                    SizedBox(height: 10,),
                MaterialButton(
                  onPressed: () {
                    currentIndex == 3
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (Context) => MainPage()))
                        : _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                  },
                  color: primarycolors,
                  minWidth: 120,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    currentIndex == 3 ? 'Get Started' : "Next",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;
  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardContent extends StatefulWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image, title, description;

  @override
  State<OnBoardContent> createState() => _OnBoardContentState();
}

class _OnBoardContentState extends State<OnBoardContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          
          children: [
            Image.asset(
              widget.image,
              height: 250,
              width: 800,
              
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.description,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
