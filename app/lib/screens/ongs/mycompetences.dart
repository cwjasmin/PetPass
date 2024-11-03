import 'package:flutter/material.dart';
import 'package:petpassflutter/theme/widgets.dart';

class MyCompetencesScreen extends StatefulWidget {
  const MyCompetencesScreen({super.key});

  @override
  State<MyCompetencesScreen> createState() => _MyCompetencesScreenState();
}

class _MyCompetencesScreenState extends State<MyCompetencesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            actions: [],
          ),
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
          Padding(
            padding: const EdgeInsets.only(
              top: 38,
              left: 54,
              right: 54,
            ),
            child: Column(
              children: [
                const CardHorizontalB(
                  image:
                      'https://cdn.pixabay.com/photo/2024/03/04/16/38/cat-8612685_1280.jpg',
                  title: 'Title Concurso',
                  description:
                      'Body text for whatever you’d like to say. Add main tak..... ',
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  width: 370,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Participants'),
                      CustomButton(
                        width: 101,
                        height: 26,
                        onPressed: () {},
                        text: 'Status',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 38),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return CardVert(
                            onLongPressed: () {
                              getInformation();
                            },
                            onPressed: () {
                              hasVoting();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
                      ],
                    ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("All winners were selected"),
                CustomButton(
                  width: 121,
                  height: 26,
                  onPressed: () {},
                  text: 'Confirmar',
                ),
              ],
            ),
          )),
    );
  }

  void getInformation() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(51.0),
              child: Column(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2)),
                    child: const CircleAvatar(
                      radius: 41,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2024/03/04/16/38/cat-8612685_1280.jpg'),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                      width: 300,
                      child: const Column(
                        children: [
                          Text('Conni_1214'),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                              "Body text for whatever you’d like to say. Add main tak..... Body text for whatever you’d like to say. Add main tak..... "),
                        ],
                      )),
                  const SizedBox(height: 8),
                  const Text('Data attached for the contest'),
                  //Lista de redes o links
                  const SizedBox(height: 8),
                  Container(
                    width: 340,
                    child: CustomButton(
                      width: double.infinity,
                      iconleft: Icons.abc,
                      isIconVisibleLeft: true,
                      text: 'Youtube video of Jani in the mountains',
                      onPressed: () {},
                    ),
                  ),
                  //Fotos y Videos
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void hasVoting() {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(51.0),
                      child: Column(children: [
                        const Icon(Icons.arrow_back),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            const CircleAvatar(backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2024/03/04/16/38/cat-8612685_1280.jpg'),radius: 41,),
                            const SizedBox(width: 8,),
                            Container(
                              width: 202,
                              child: const Column(
                                children: [
                                  Text("Conni_1214"),
                                  SizedBox(height:12 ,),
                                  Text('Body text for whatever you’d like to say. Add main tak.....')
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text("Choose a category for @Conni_1214 "),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 250,
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) => const SizedBox(
                                    height: 8,
                                  ),
                              scrollDirection: Axis.vertical,
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomButton(
                                  text: 'holi',
                                  onPressed: () {},
                                );
                              }),
                        ),
                            
                            const Text('Winners will be announced once you have selected all the winners of all categories')
                      ]))));
        });
  }
}
