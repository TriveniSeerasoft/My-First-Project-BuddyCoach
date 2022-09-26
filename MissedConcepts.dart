// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_final_fields, unused_field, unrelated_type_equality_checks, dead_code

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//import 'package:flutter_calendar/ui/pages/add_event.dart';
import 'LandingPage.dart';
import 'SearchBar.dart';
// import 'package:flutter_calendar/ui/pages/view_event.dart';
//import 'package:flutter_calendar/table_calendar.dart';

class MissedConcepts extends StatefulWidget {
  const MissedConcepts({Key? key}) : super(key: key);

  @override
  State<MissedConcepts> createState() => _MissedConceptsState();
}

class _MissedConceptsState extends State<MissedConcepts> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _selectedDay = DateTime.now();
  final controller = TextEditingController();
  DateTime _focusedDay = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Icon(Icons.arrow_circle_left_outlined),
            ],
          ),
          onPressed: () {
            // Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LandingPage(),
              ),
            );
          },
        ),
        actions: <Widget>[
          // TextField(
          //   controller: controller,
          //   decoration: InputDecoration(
          //     prefixIcon: Icon(Icons.search),
          //     hintText: 'Search',
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //   ),
          // ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SearchBarOnHomeScreen(),
                ),
              );
            },
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // ignore: sort_child_properties_last
        child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TableCalendar(
                firstDay: DateTime(2020),
                lastDay: DateTime(2050),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                rowHeight: 60,
                daysOfWeekHeight: 60,
                headerStyle: HeaderStyle(
                  titleTextStyle: const TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                  formatButtonTextStyle: TextStyle(color: Colors.green),
                  formatButtonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.teal, width: 2),
                  ),
                ),
                calendarStyle: CalendarStyle(
                  holidayTextStyle: TextStyle(color: Colors.red),
                  selectedDecoration:
                      BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
                ),

                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },

                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onFormatChanged: ((format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                }),

                // }, TextFormField(validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter some text ';
                //   }
                //   return null;
                // }),)

                // onPageChanged: (focusedDay) {
                //   _focusedDay = focusedDay;
                // },
                //   ],
                // ),

                // floatingActionButton: FloatingActionButton(
                //     child: Icon(Icons.done), onPressed: () {}
              ),
              Container(
                width: 1000,
                height: 60,
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // // ignore: prefer_const_literals_to_create_immutables
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Missed Concepts',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 50),
                    Icon(Icons.calendar_month, size: 40, color: Colors.white),
                  ],
                ),
                // StreamBuilder<Object>()
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  color: Color.fromARGB(255, 210, 224, 212),

                  width: 1000,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HTML Editors',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 30),
                          Stack(
                            alignment: Alignment.centerRight,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.catching_pokemon_sharp,
                                  color: Color.fromARGB(255, 61, 145, 64),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // SizedBox(height: 50),
                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: Text('Resource Link',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20.0),
                                fixedSize: Size(180, 60),
                                primary: Color.fromARGB(255, 59, 59, 59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(width: 05),
                          ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: Text('Take Quiz',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20.0),
                                fixedSize: Size(180, 60),
                                primary: Color.fromARGB(255, 59, 59, 59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  color: Color.fromARGB(255, 210, 224, 212),

                  width: 1000,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'HTML Editors',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 30),
                          Icon(
                            Icons.catching_pokemon_sharp,
                            color: Color.fromARGB(255, 61, 145, 64),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: Text('Resource Link',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20.0),
                                fixedSize: Size(180, 60),
                                primary: Color.fromARGB(255, 59, 59, 59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(width: 05),
                          ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: Text('Take Quiz',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20.0),
                                fixedSize: Size(180, 60),
                                primary: Color.fromARGB(255, 59, 59, 59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  color: Color.fromARGB(255, 210, 224, 212),

                  width: 1000,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'HTML Editors',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 30),
                          Icon(
                            Icons.catching_pokemon_sharp,
                            color: Color.fromARGB(255, 61, 145, 64),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: Text('Resource Link',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20.0),
                                fixedSize: Size(180, 60),
                                primary: Color.fromARGB(255, 59, 59, 59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(width: 05),
                          ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: Text('Take Quiz',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20.0),
                                fixedSize: Size(180, 60),
                                primary: Color.fromARGB(255, 59, 59, 59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  color: Color.fromARGB(255, 210, 224, 212),

                  width: 1000,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'HTML Editors',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 30),
                          Icon(
                            Icons.catching_pokemon_sharp,
                            color: Color.fromARGB(255, 61, 145, 64),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: Text('Resource Link',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20.0),
                                fixedSize: Size(180, 60),
                                primary: Color.fromARGB(255, 59, 59, 59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(width: 05),
                          ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: Text('Take Quiz',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20.0),
                                fixedSize: Size(180, 60),
                                primary: Color.fromARGB(255, 59, 59, 59),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.green,
              shape: StadiumBorder(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Learnings',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 40),
          Flexible(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MissedConcepts(),
                  ),
                );
                ;
              },
              color: Colors.green,
              shape: StadiumBorder(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Missed Concepts',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
