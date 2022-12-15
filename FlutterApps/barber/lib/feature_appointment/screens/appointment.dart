import 'package:barber/feature_appointment/firebase_methods/collections_methods.dart';
import 'package:barber/feature_appointment/models/barbers.dart';
import 'package:barber/feature_appointment/models/services.dart';
import 'package:barber/feature_appointment/widgets/hours_buttoms_widget.dart';
import 'package:barber/feature_home/widgets/bottom_navigation.dart';
import 'package:barber/feature_home/widgets/drawer_widget.dart';
import 'package:barber/firebase/connection_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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

  String servicioSeleccionado = '';
  String barberoSeleccionado = '';

  //
  final List _services = [
    KindOfServices('Corte', 30, Image.asset('Assets/Images/haircut.png'), 5500),
    KindOfServices('Barba', 30, Image.asset('Assets/Images/logo2.jpeg'), 5500),
    KindOfServices(
        'Corte y Barba', 45, Image.asset('Assets/Images/logo1.png'), 5500),
    KindOfServices('Cejas', 15, Image.asset('Assets/Images/logo2.jpeg'), 5500)
  ];

  final List _barbers = [
    Barbers('Barbero1', 'Especialidad en barbas', true,
        Image.asset('Assets/Images/logo1.png')),
    Barbers('Barbero2', 'Especialidad en cortes', true,
        Image.asset('Assets/Images/logo1.png')),
  ];

  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            //color: Color.fromARGB(234, 57, 5, 2)
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
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Fecha: ${today.day}/${today.month}/${today.year}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontFamily: 'Barlow',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                const Padding(padding: EdgeInsets.all(2)),
                TableCalendar(
                  //Available days
                  enabledDayPredicate: (date) {
                    return (date.weekday != DateTime.sunday);
                  },
                  //
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  focusedDay: today,
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(Duration(days: 60)),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  locale: 'es_ES',
                  onDaySelected: _FocusDaySelected,
                  calendarFormat: CalendarFormat.twoWeeks,
                  weekendDays: const <int>[DateTime.sunday],
                  //Header Style
                  headerStyle: const HeaderStyle(
                    headerPadding: EdgeInsets.all(8),
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
                      color: Colors.white,
                      fontFamily: 'Barlow',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.white),
                    weekendStyle: TextStyle(color: Colors.white),
                  ),
                  calendarStyle: const CalendarStyle(
                    defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: Colors.white70),
                    defaultTextStyle: TextStyle(color: Colors.black),
                    selectedTextStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    selectedDecoration: BoxDecoration(
                        color: Colors.amber, shape: BoxShape.rectangle),
                    todayTextStyle: TextStyle(color: Colors.black),
                    todayDecoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: Colors.white70),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Servicio: $servicioSeleccionado',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontFamily: 'Barlow',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.navigate_next_sharp,
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
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
                            setState(() {
                              servicioSeleccionado = item.nombre;
                            });
                            print(servicioSeleccionado);
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
                  children: [
                    Text(
                      'Barbero: $barberoSeleccionado',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontFamily: 'Barlow',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                const Padding(padding: EdgeInsets.all(5)),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _barbers.length,
                  itemBuilder: (context, index) {
                    final _barber = _barbers.elementAt(index);
                    return SizedBox(
                      height: 67,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        leading: const Icon(
                          Icons.person,
                          color: Colors.white70,
                          size: 50,
                        ),
                        title: Text(
                          '${_barber.nombre}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Barlow',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${_barber.descripcion}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Barlow',
                              fontSize: 20),
                        ),
                        isThreeLine: true,
                        onTap: () {
                          print(_barber.nombre);
                          setState(() {
                            barberoSeleccionado = _barber.nombre;
                          });
                        },
                      ),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.all(8)),
                // TIME SELECTION
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Hora: ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: 'Barlow',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                const Padding(padding: EdgeInsets.all(8)),

                FutureBuilder(
                  future: Firebase.initializeApp(),
                  builder: (context, snapshot) {
                    //ERROR
                    if (snapshot.hasError) {
                      return const ConnectionError();
                    }
                    //CONNECTED BUT WITHOUT DATA
                    if (servicioSeleccionado.isNotEmpty &&
                        _user.displayName!.isNotEmpty &&
                        barberoSeleccionado.isNotEmpty) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data.toString() == '[]') {
                        String fecha =
                            "${today.day}/${today.month}/${today.year}";
                        print(
                            'No tengo data, procedo a meter la info de los horarios');
                        //
                        //ADD HOURS TO FIREBASE COLLECTION 'CITA'
                        /*CollectionMethods().addHours(barberoSeleccionado,
                            _user.displayName!, fecha, servicioSeleccionado);
                        print("INFO AGREGADA");*/
                      }
                    }

                    // CONNECTED WITH DATA
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.data.toString() != '[]') {
                      String fecha =
                          "${today.day}/${today.month}/${today.year}";
                      /*CollectionMethods().addHours(barberoSeleccionado,
                          _user.displayName!, fecha, servicioSeleccionado);*/
                      print('No voy a agregar mas!!!!');
                      return Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 200,
                          child: HorasWidget(
                            barberoSeleccionado: barberoSeleccionado,
                            fecha: fecha,
                            servicioSeleccionado: servicioSeleccionado,
                          ),
                        ),
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationWidget(
          user: _user,
        ),
      ),
    );
  }
}
