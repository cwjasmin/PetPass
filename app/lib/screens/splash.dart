
import 'package:flutter/material.dart';
import 'package:petpassflutter/config/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  @override
  void initState() {
    super.initState();

    // Después de 3 segundos, decidir si mostrar onboarding o home
    //Si el usuario ya vio el onboarding 1 ves como dueño, marcar 1 en la bd para no volverlo a mostrar
    //Si el usuario/representante de la ong vio el onboarding, marcar 1 en la bd para no volverlo a mostrar
    Future.delayed(Duration(seconds: 3), () {
      //onboarding dueño
       Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
      //onboarding ong
      //Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreenOng);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /*reemplazar imagen por logo de la app
          Image.asset('assets/backgroundimg.png', fit: BoxFit.cover),
          Center(child: ClipRRect(
            borderRadius: BorderRadius.circular(28.0),
            child: Image.asset('assets/logo.png', width: 
            200, height: 200,),
          ),)
          */
          Positioned.fill(
            child: Image.asset('assets/images/background.png', fit: BoxFit.cover,),
          ),
          Center(
            child: Image.asset('assets/images/logo.png')
          )
        ],
        
      ),
    );
  }
}