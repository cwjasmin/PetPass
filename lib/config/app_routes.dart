class AppRoutes {
  AppRoutes._();
  //Rutas oficiales
  static const String splashScreen = '/';
  static const String onboardingScreen = '/onboarding';
  static const String authScreen = '/auth';
  static const String subscription = '/subs';

  //falta
  static const String petRegister = 'regpet';

  //Pantallas sin subscripcion
  static const String homeScreen = '/gallery-screen';
  static const String blogScreen = '/blog-screen';
  static const String MyProfileScreen = '/profile-screen';

  //Pantallas subscriptores
  static const String ShomeScreen = '/competencias-screen';
  static const String SdetailScreen = '/competencial-detail-screen';
  static const String myCompetitions = '/my-competitions';
  static const String storeScreen = 'store-screen';
  static const String healthScreen = 'health-screen';

  //Pantallas ONG
  static const String onboardingScreenOng = '/onboarding-ong';
  static const String panelScreenOng = '/panel-ong';
  static const String myCompetencesOng = '/my-competences-ong';
  static const String createCompetences = '/create-competences-ong';
}
