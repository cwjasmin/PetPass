import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:petpassflutter/screens/participants/registerPet.dart';
import 'package:petpassflutter/theme/colors.dart';
import 'package:petpassflutter/theme/widgets.dart';
import 'package:reown_appkit/reown_appkit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  final projectid = dotenv.env['PROJECT_ID'];
  late ReownAppKitModal _appKitModal;
  bool _isAppKitInitialized = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    _initializeAppKitModal();
  }

  Future<void> _initializeAppKitModal() async {
    ReownAppKitModalNetworks.removeNetworks('eip155', [
      '1',
      '10',
      '56',
      '100',
      '137',
      '324',
      '1101',
      '5000',
      '8217',
      '8453',
      '42220',
      '43114',
      '59144',
      '7777777',
      '1313161554'
    ]);

    //Aqui reemplazar para arbitrum sepolia
    //Recomendacion: solo para pruebas, en produccion quitarlo

    final customNetwork = ReownAppKitModalNetworkInfo(
      name: 'Arbitrum Sepolia',
      chainId: '421614',
      currency: 'ETH',
      rpcUrl: 'https://sepolia-rollup.arbitrum.io/rpc',
      explorerUrl: 'https://sepolia.arbiscan.io',
      isTestNetwork: true,
    );
    ReownAppKitModalNetworks.addNetworks('eip155', [customNetwork]);
    _appKitModal = ReownAppKitModal(
      context: context,
      projectId: projectid,
      metadata: const PairingMetadata(
        name: 'petpassflutter',
        description: 'petpassflutter description',
        url: 'https://example.com/',
        icons: ['https://example.com/logo.png'],
        redirect: Redirect(
          native: 'petpassflutterapp://',
          universal: 'https://reown.com/exampleapp',
          
        ),
      ),
      includedWalletIds: {
        'c57ca95b47569778a828d19178114f4db188b89b763c899ba0be274e97267d96', // Metamask
        '1ae92b26df02f0abca6304df07debccd18262fdf5fe82daa81593582dac9a369', // Rainbow
        'a5b3b5055ba7333811fcb80222a421bb6ac541b3eccf99edb6d0e5040bb008e7',
        '87eecbca66faef32f044fc7c66090fc668efb02e2d17dda7bf095d51dff76659',
        'a797aa35c0fadbfc1a53e7f675162ed5226968b44a19ee3d24385c64d1d3c393',
      },
      featuresConfig: FeaturesConfig(
        email: false,
        socials: [
          AppKitSocialOption.Farcaster,
          AppKitSocialOption.X,
          AppKitSocialOption.Apple,
          AppKitSocialOption.Discord,
        ],
        //showMainWallets: false,
      ),
    );
    
    await _appKitModal.init();

    setState(() {
      _tabController.addListener(() {
        setState(() {});
      });
      _appKitModal;
      _isAppKitInitialized = true;
    });
  }

  @override
  void dispose() {
    _appKitModal.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
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
                Container(
                  width: 273,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black, width: 2))),
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_tabController.index == 0)
                              Image.asset(
                                'assets/images/pawicon.png',
                                height: 14,
                                width: 14,
                              ),
                            const Text("Ingresar"),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_tabController.index != 0)
                              Image.asset(
                                'assets/images/pawicon.png',
                                height: 14,
                                width: 14,
                              ),
                            const Text("Registrarse"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      //Login
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            const SignInForm(),
                            const SizedBox(height: 27),
                            const Text('OR'),
                            const SizedBox(
                              height: 33,
                            ),
                            CustomButton(
                              height: 42,
                              borderRadius: 16,
                              text: 'Sign In with X',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 16),
                            CustomButton(
                              height: 42,
                              borderRadius: 16,
                              text: 'Sign In with Microsoft',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 16),
                            CustomButton(
                              height: 42,
                              borderRadius: 16,
                              text: 'Sign In with Apple',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 16),
                            AppKitModalConnectButton(
                              appKit: _appKitModal,
                              context: context,
                              custom: CustomButton(
                                height: 42,
                                borderRadius: 16,
                                text: 'Sign In with Wallet',
                                onPressed: () {
                                  if (_appKitModal.isConnected) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterPetScreen()));
                                  } else {
                                    _appKitModal.openModalView(
                                        ReownAppKitModalAllWalletsPage());
                                  }
                                },
                              ),
                            ),
                            const Terms(),
                            AppKitModalNetworkSelectButton(
                              appKit: _appKitModal,
                              context: context,
                            ),
                            /*AppKitModalAccountButton(
                              appKit: _appKitModal,
                            ),
                            
                            Visibility(
                              visible: _appKitModal.isConnected,
                              child: AppKitModalAccountButton(
                                appKit: _appKitModal,
                                context: context,
                              ),
                            ),
                            AppKitModalAddressButton(
                              appKitModal: _appKitModal,
                              onTap: _appKitModal.openModalView,
                            )
                            */
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            const SignUnForm(),
                            const SizedBox(height: 27),
                            const Text('OR'),
                            const SizedBox(
                              height: 33,
                            ),
                            CustomButton(
                              height: 42,
                              borderRadius: 16,
                              text: 'Sign Up with X',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 16),
                            CustomButton(
                              height: 42,
                              borderRadius: 16,
                              text: 'Sign Up with Microsoft',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 16),
                            CustomButton(
                              height: 42,
                              borderRadius: 16,
                              text: 'Sig Up with Apple',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 16),
                            CustomButton(
                              height: 42,
                              borderRadius: 16,
                              text: 'Sign Un with Wallet',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 16),
                            const Terms(),
                          ],
                        ),
                      )
                    ],
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

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(100)),
);

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextField(
            icon: Icons.email_outlined,
            hintText: 'Enter your email adress',
          ),
          const SizedBox(height: 14),
          const CustomTextField(
            isobscureText: true,
            icon: Icons.lock,
            hintText: 'Enter your password',
          ),
          const SizedBox(height: 25),
          CustomButton(
            borderRadius: 16,
            height: 42,
            colorBtn: WidgetColors.textLight,
            text: 'Login',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class SignUnForm extends StatelessWidget {
  const SignUnForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextField(
            icon: Icons.email_outlined,
            hintText: 'Enter your email adress',
          ),
          const SizedBox(height: 14),
          const CustomTextField(
            isobscureText: true,
            icon: Icons.lock,
            hintText: 'Enter your password',
          ),
          const SizedBox(height: 25),
          CustomButton(
            borderRadius: 16,
            height: 42,
            colorBtn: WidgetColors.textLight,
            text: 'Register',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPetScreen()));
            },
          )
        ],
      ),
    );
  }
}

class Terms extends StatelessWidget {
  const Terms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "By connecting, you agree to the",
          style: TextStyle(color: Color(0xFF757575)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Handle navigation to Sign Up
              },
              child: const Text(
                "Terms ",
                style: TextStyle(
                  color: Color(0xFFFF7643),
                ),
              ),
            ),
            const Text(
              "of service & ",
              style: TextStyle(color: Color(0xFF757575)),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Privacity Policy",
                style: TextStyle(
                  color: Color(0xFFFF7643),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
