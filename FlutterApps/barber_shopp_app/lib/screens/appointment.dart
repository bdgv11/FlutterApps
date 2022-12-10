import 'package:barber_shopp_app/models/barbers.dart';
import 'package:barber_shopp_app/models/services.dart';
import 'package:barber_shopp_app/widgets/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppointmentScreen extends StatefulWidget {
  final User user;
  const AppointmentScreen({required this.user});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  //
  late User _user;
  DateTime today = DateTime.now();
  void _FocusDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  //
  final List _services = [
    KindOfServices('Corte', 30, Image.asset('Assets/Images/haircut.png'), 5500),
    KindOfServices('Barba', 30, Image.asset('Assets/Images/logo2.jpeg'), 5500),
    KindOfServices(
        'Corte y Barba', 45, Image.asset('Assets/Images/logo1.png'), 5500),
    KindOfServices('Cejas', 15, Image.asset('Assets/Images/logo2.jpeg'), 5500)
  ];

  List _barbers = [
    Barbers('Bryan', true, Image.asset('Assets/Images/logo1.png')),
    Barbers('David', true, Image.asset('Assets/Images/logo1.png')),
  ];

  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          '',
          style: TextStyle(fontFamily: 'Barlow'),
        ),
      ),
      drawer: DrawerUserWidget(user: _user),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              Color.fromARGB(255, 104, 34, 4),
              Color.fromARGB(255, 187, 194, 188),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Fecha:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Barlow',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TableCalendar(
                enabledDayPredicate: (date) {
                  return (date.weekday != DateTime.sunday);
                },
                availableGestures: AvailableGestures.all,
                calendarBuilders: CalendarBuilders(
                  weekNumberBuilder: (context, weekNumber) {
                    return Container(
                      color: Colors.purple,
                    );
                  },
                ),
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.now(),
                lastDay: DateTime(2024, 31, 31),
                startingDayOfWeek: StartingDayOfWeek.monday,
                locale: 'es_ES',
                onDaySelected: _FocusDaySelected,
                calendarFormat: CalendarFormat.week,
                weekendDays: const <int>[DateTime.saturday, DateTime.sunday],

                //Header Style
                headerStyle: const HeaderStyle(
                  decoration: BoxDecoration(color: Colors.transparent),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                      color: Colors.white, fontFamily: 'Barlow', fontSize: 20),
                ),
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.white,
              ),
              const Padding(padding: EdgeInsets.all(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Servicio:',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: 'Barlow',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.navigate_next_sharp,
                    color: Colors.white,
                    size: 40,
                  )
                ],
              ),
              SizedBox(
                height: 175,
                //width: 390,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _services.length,
                  itemBuilder: (context, index) {
                    final item = _services.elementAt(index);

                    return Card(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          print(item.nombre);
                        },
                        child: Column(
                          children: [
                            //const Padding(padding: EdgeInsets.all(8)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("Assets/Images/logo2.jpeg"),
                                  radius: 50,
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.all(8)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Padding(padding: EdgeInsets.only(top: 80)),
                                Text(
                                  '${item.nombre}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Barlow',
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.all(8)),
              const Divider(
                thickness: 1,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Barbero:',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: 'Barlow',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(8)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _barbers.length,
                itemBuilder: (context, index) {
                  final _barber = _barbers.elementAt(index);

                  return SizedBox(
                    height: 150,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          print(_barber.nombre);
                        },
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.all(8)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage("Assets/Images/logo2.jpeg"),
                                  radius: 50,
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        user: _user,
      ),
    );
  }
}
