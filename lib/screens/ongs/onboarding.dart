import 'package:flutter/material.dart';
import 'package:petpass/config/app_routes.dart';
import 'package:petpass/theme/widgets.dart';

class OnboardingOngScreen extends StatefulWidget {
  const OnboardingOngScreen({super.key});

  @override
  State<OnboardingOngScreen> createState() => _OnboardingOngScreenState();
}

class _OnboardingOngScreenState extends State<OnboardingOngScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            scrollDirection: Axis.horizontal,
            children: [
              informationPage(),
              informationPage(),
              informationPage(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              isLastPage
                  ? TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 93, 155, 247),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                      onPressed: () {
                       Navigator.pushReplacementNamed(context, AppRoutes.panelScreenOng);
                      },
                      child: const Text("ONGS",
                          style: TextStyle(fontSize: 18, color: Colors.white)))
                  : TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 174, 243, 244),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        "Siguiente",
                        style: TextStyle(fontSize: 18),
                      ))
            ],
          ),
        )
      ],
    ));
  }
}

Widget informationPage(
    ) {
  return  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomButton(
        text: 'holi',
        onPressed: () {
         
        },
      ),
      SizedBox(height: 12,),
      CardVert(
        portada:"https://cdn.pixabay.com/photo/2024/03/04/16/38/cat-8612685_1280.jpg"
      ),
      SizedBox(height:12),
      CardHorizontalA(
        onPressed: (){
          
        },
      ),
      SizedBox(height: 12,),
      CardHorizontalB(
        image: 'https://cdn.pixabay.com/photo/2024/03/04/16/38/cat-8612685_1280.jpg',
        title: 'Title Concurso',
        description: 'Body text for whatever you’d like to say. Add main tak..... ',
      )
    
    ],
  );
}
