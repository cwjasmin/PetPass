import 'package:flutter/material.dart';
import 'package:petpassflutter/config/app_routes.dart';
import 'package:petpassflutter/screens/participants_screens.dart';
import 'package:petpassflutter/screens/ongs_screens.dart';
import 'package:petpassflutter/screens/splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(); 
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Pass',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.onboardingScreen:
            return MaterialPageRoute(
                builder: (context) => const OnboardingScreen());
          case AppRoutes.authScreen:
            return MaterialPageRoute(builder: (context) => const AuthScreen());
          case AppRoutes.subscription:
            return MaterialPageRoute(
                builder: (context) => const SubscriptionScreen());
          case AppRoutes.ShomeScreen:
            return MaterialPageRoute(builder: (context) => const HomeScreen());
          case AppRoutes.SdetailScreen:
            return MaterialPageRoute(
                builder: (context) => const DetailCompetenciesScreen());
          case AppRoutes.blogScreen:
            return MaterialPageRoute(builder: (context) => BlogScreen());
          case AppRoutes.storeScreen:
            return MaterialPageRoute(builder: (context) => const StoreScreen());
          case AppRoutes.healthScreen:
            return MaterialPageRoute(
                builder: (context) => const HealthScreen());
          case AppRoutes.MyProfileScreen:
            return MaterialPageRoute(
                builder: (context) => const MyProfileScreen());
          case AppRoutes.myCompetitions:
            return MaterialPageRoute(
                builder: (context) => const MyCompetitions());
          //Pantallas ONG
          case AppRoutes.onboardingScreenOng:
            return MaterialPageRoute(
                builder: (context) => const OnboardingOngScreen());
          case AppRoutes.panelScreenOng:
            return MaterialPageRoute(
                builder: (context) => const PanelScreen());
          case AppRoutes.myCompetencesOng:
            return MaterialPageRoute(
                builder: (context) => const MyCompetencesScreen());
          case AppRoutes.createCompetences:
            return MaterialPageRoute(
                builder: (context) => const CreateScreen());
          default:
            return MaterialPageRoute(
                builder: (context) => const SplashScreen());
          
        }
      },
    );
  }
}
