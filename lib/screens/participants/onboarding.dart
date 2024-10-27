import 'package:flutter/material.dart';
import 'package:petpass/config/app_routes.dart';
import 'package:petpass/theme/colors.dart';
import 'package:petpass/theme/texts.dart';
import 'package:petpass/theme/widgets.dart';

//Probando los widgets reciclables
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() => isLastPage = index == 2);
              },
              scrollDirection: Axis.horizontal,
              children: [
                informationPage(
                  urlImage: 'assets/images/catone.png',
                  widthImage: 300,
                  heightImage: 400,
                  title: 'Bienvenido a PetPass',
                  description:
                      "Gestiona toda la información de tu mascota en un solo lugar, de forma segura y siempre accesible",
                ),
                informationPage(
                  urlImage: 'assets/images/cattwo.png',
                  widthImage: 500,
                  heightImage: 300,
                  title: 'La Historia de tu Mascota, Siempre Segura',
                  description:
                      "PetPass certifica cada dato importante de tu mascota con insignias digitales únicas, asegurando que siempre tendrás acceso a información auténtica como certificados de salud y vacunación.",
                ),
                informationPage(
                  urlImage: 'assets/images/catthree.png',
                  widthImage: 500,
                  heightImage: 400,
                  title: 'Concursos y Comunidad Pet-Friendly',
                  description:
                      "¡Únete a la comunidad, participa en concursos con tu mascota y descubre un marketplace de productos especializados para ellos!",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isLastPage
                    ? CustomButton(
                      
                      width: double.infinity,
                        text: 'Comenzar',
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.authScreen);
                        },
                      )
                 
                    : CustomButton(
                      colorBtn: WidgetColors.textLight,
                      width: double.infinity,
                        text: 'Seguir',
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeInOut);
                        },
                      ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

Widget informationPage({
  required String urlImage,
  required String title,
  required String description,
  required double widthImage,
  required double heightImage,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      //Imagen
      Container(
        height: heightImage,
        width: widthImage,
        child: Image.asset(
          urlImage,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      //Titulo
      Container(
        width: 400,
        child: Center(child: Text(title, style: AppTextStyles.headline5Semi,))),
      const SizedBox(
        height: 16,
      ),
      //Descripcion
      Container(width: 400, child: Text(description,style: AppTextStyles.paragraph,)),
      //Boton
      
    ],
  );
}
