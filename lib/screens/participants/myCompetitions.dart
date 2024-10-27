import 'package:flutter/material.dart';
import 'package:petpass/config/app_routes.dart';

class MyCompetitions extends StatefulWidget {
  const MyCompetitions({super.key});

  @override
  State<MyCompetitions> createState() => _MyCompetitionsState();
}

class _MyCompetitionsState extends State<MyCompetitions>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          actions: const [
            
          ],
        ),
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
                      child: Column(children: [
          const Text("Competitions Agenda"),
          const SizedBox(height: 22),
          Container(
            width: 327,
            child: TabBar(
              dividerColor: Colors.transparent,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: const Color(0xFFEBFF00), 
                borderRadius: BorderRadius.circular(
                    30), 
                border: Border.all(
                    color: Colors.black,
                    width: 1), 
              ),
              labelColor: Colors.black,
              unselectedLabelColor: const Color.fromARGB(255, 53, 53, 53),
              tabs: const [
                Tab(
                  child: Text("En proceso"),
                ),
                Tab(
                  child: Text("Finalizados"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.SdetailScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          height: 133,
                          width: 327,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.abc),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 240,
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Title Competition'),
                                      Text('15 OCT - 26 NOV'),
                                      Text(
                                        'Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes.... ',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Finalizados
                SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.SdetailScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          height: 133,
                          width: 327,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.abc),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 240,
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Title Competition'),
                                      Text('15 OCT - 26 NOV'),
                                      Text(
                                        'Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes.... ',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
                      ]))
                ])),
    );
  }
}
