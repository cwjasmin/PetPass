import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:petpass/config/app_routes.dart';
import 'package:petpass/theme/colors.dart';
import 'package:petpass/theme/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent('Event X',
        description: 'test desc',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 11, 30),
        color: Colors.lightGreen,
        isAllDay: false,
        isDone: true,
        wide: false),
    NeatCleanCalendarEvent('Allday Event B',
        description: 'test desc',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day - 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 17, 0),
        color: Colors.pink,
        isAllDay: true,
        wide: false),
    NeatCleanCalendarEvent(
      'Normal Event D',
      description: 'test desc',
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 14, 30),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 17, 0),
      color: Colors.indigo,
      wide: false,
    ),
    NeatCleanCalendarEvent(
      'Normal Event E',
      description: 'test desc',
      startTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 45),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0),
      color: Colors.indigo,
      wide: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget eventCell(
      BuildContext context, NeatCleanCalendarEvent event, String start) {
    //Text("Evento: ${event.summary} desde $start");
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(AppRoutes.SdetailScreen);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10)
            ),
            height: 133,
            width: 327,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.abc),
                  const SizedBox(width: 15,),
                  Container(
                    width: 240,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title Competition'),
                        Text('15 OCT - 26 NOV'),
                        Text('Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes.... ',maxLines: 2,overflow: TextOverflow.ellipsis, softWrap: true,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(fit: StackFit.expand, children: [
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
            padding: const EdgeInsets.only(left: 54, right: 54, top: 38 ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 60,
                ),
                const Text("Competitions Agenda"),
                const SizedBox(
                  height: 22,
                ),
                CardHorizontalA(
                  onPressed: (){
                    Navigator.of(context).pushNamed(AppRoutes.myCompetitions);
                  },
                ),
                const SizedBox(
                  height: 4,
                ),
                Expanded(
                  child: Calendar(
                    startOnMonday: true,
                    weekDays: [
                      'LUN',
                      'MAR',
                      'MiERC',
                      'JUEV',
                      'VIER',
                      'SAB',
                      'DOM'
                    ],
                    eventsList: _eventList,
                    isExpandable: true,
                    hideArrows: true,
                    //hideTodayIcon: true,
                    bottomBarColor: const Color(0xFFE5FDFF),
                    bottomBarArrowColor: const Color(0xFF000000),
                    topRowIconColor: Colors.green,
                    defaultOutOfMonthDayColor: Colors.amber,
                    eventDoneColor: Colors.green,
                    selectedColor: Colors.pink,
                    selectedTodayColor: WidgetColors.primaryColor,
                    todayColor: WidgetColors.primaryColor,
                    eventColor: null,
                    locale: 'es_ES',
                    todayButtonText: 'Hoy',
                    allDayEventText: 'Todo el dia',
                    multiDayEndText: 'Fin',
                    isExpanded: false,
                    expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                    showEventListViewIcon: false,
                    datePickerType: DatePickerType.hidden,
                    onEventSelected: (value) {
                      Navigator.of(context).pushNamed(AppRoutes.SdetailScreen);
                    },
                    dayOfWeekStyle: const TextStyle(
                        color: Color.fromARGB(255, 135, 159, 2),
                        fontWeight: FontWeight.w800,
                        fontSize: 11),
                    displayMonthTextStyle: const TextStyle(
                        color: Color.fromARGB(255, 227, 49, 49),
                        fontWeight: FontWeight.w800,
                        fontSize: 11),
                    eventListBuilder: (BuildContext context,
                        List<NeatCleanCalendarEvent> eventList) {
                      if (eventList.isEmpty) {
                        return Container(
                          child: const Text("No hay nada"),
                        );
                      }
                      return Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text('Pet Champions'),
                            const SizedBox(height: 12,),
                            ChipCategories(

                            ),
                            const SizedBox(height: 12,),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: eventList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                final NeatCleanCalendarEvent event =
                                    eventList[index];
                                final String start = event.summary.toString();
                                return eventCell(context, event, start);
                              },
                            ),
                          ],
                        ),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              //para ir al drawer momentaneamente
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.green,
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Competencias"),
              onTap: () {
                //Navigator.of(context).pushNamed(AppRoutes.authScreen);
              },
            ),
            ListTile(
              title: const Text("Blog"),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.blogScreen);
              },
            ),
            ListTile(
              title: const Text("Store"),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.storeScreen);
              },
            ),
            ListTile(
              title: const Text("Health"),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.healthScreen);
              },
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.MyProfileScreen);
              },
            )
          ],
        ),
      ),
    );
  }
  
}

class ChipCategories extends StatefulWidget {
  @override
  _ChipCategoriesState createState() => _ChipCategoriesState();
}

class _ChipCategoriesState extends State<ChipCategories> {
  int _selectedChipIndex = 0;
  final List<String> categories = ['All', 'Belleza', 'Videos', 'Talentos', 'Historias'];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 8.0, 
            children: List<Widget>.generate(categories.length, (int index) {
              return ChoiceChip(
                label: Text(categories[index]),
                selected: _selectedChipIndex == index,
                selectedColor: WidgetColors.primaryColor,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedChipIndex = selected ? index : _selectedChipIndex;
                  });
                },
                backgroundColor: Colors.white, 
                labelStyle: TextStyle(
                  color: _selectedChipIndex == index ? WidgetColors.textDark: WidgetColors.textDisable, // Cambia el color del texto
                ),
              );
            }),
          ),
        ),
      
    );
  }
}
