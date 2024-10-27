import 'package:flutter/material.dart';
import 'package:petpass/config/app_routes.dart';
import 'package:petpass/theme/widgets.dart';

class PanelScreen extends StatefulWidget {
  const PanelScreen({super.key});

  @override
  State<PanelScreen> createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
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
            padding: const EdgeInsets.only(
              top: 38,
              left: 41,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 60,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text("Pet Champions"),
                      Padding(
                        padding: const EdgeInsets.only(right: 41),
                        child: Container(
                          width: 400,
                          child: const Text(
                              "Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story."),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 41),
                        child: CustomButton(
                          width: double.infinity,
                          text: 'Create',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.createCompetences);
                          },
                        ),
                      ),
                      const Text('My Competences'),
                      Padding(
                        padding: const EdgeInsets.only(right: 41),
                        child: Container(
                          width: 400,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("In Progress"), Text("All")],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Container(
                          height: 173,
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 12,
                                  ),
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (BuildContext context, int index) {
                                return CardVert(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.myCompetencesOng);
                                  },
                                );
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 41),
                        child: Container(
                          width: 400,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Finished"), Text("All")],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Container(
                          height: 173,
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 12,
                                  ),
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (BuildContext context, int index) {
                                return const CardVert();
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
