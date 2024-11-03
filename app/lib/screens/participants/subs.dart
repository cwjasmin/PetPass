import 'package:flutter/material.dart';
import 'package:petpassflutter/config/app_routes.dart';
import 'package:petpassflutter/theme/widgets.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/background2.png',
              fit: BoxFit.cover,
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 38),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 60,
                ),
                const SizedBox(height: 33,),
                CustomButton(
                  height: 43,
                  text: 'Upgrado to Premium',
                  onPressed: (){
                     Navigator.of(context).pushNamed(AppRoutes.ShomeScreen);
                  },
                ),
                const SizedBox(height:60 ,),
                const Text(
                  'Hello Daisy!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'What plans do you have today with your pet?',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
               Container(
                height: 310,
                width: 324,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 100,
                      child: Image.asset(
                                        'assets/images/catmenulineas.png',
                                        height: 159,
                                      ),
                    ),
                const Positioned(
                  top: 7,
                  left: 0,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: 5,
                      ),
                      Text("What's on\nthe agenda?")
                    ],
                  ),
                ),
                const Positioned(
                  top: 4,
                  right: 0,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: 5,
                      ),
                      Text("What's on\nthe agenda?")
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 45,
                  left: 0,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: 5,
                      ),
                      Text("What's on\nthe agenda?")
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: 100,
                  
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: 5,
                      ),
                      Text("What's on\nthe agenda?")
                    ],
                  ),
                ),
                const Positioned(
                  right: 4,
                  bottom: 45,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: 5,
                      ),
                      Text("What's on\nthe agenda?")
                    ],
                  ),
                )
                  ],
                ),
               )
              ],
            ),
          ),
          ],
      ),
    ));
  }
}