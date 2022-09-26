// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';

import 'ExitApp.dart';
// import 'MenuBar.dart';
import 'MissedConcepts.dart';
import 'ProfileSection.dart';
import 'SearchBar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      drawer: Drawer(
        // ignore: sort_child_properties_last
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/Group 7 (2).png'),
                SizedBox(height: 20),
                Row(
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(width: 5, color: Colors.white),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(spreadRadius: 1, blurRadius: 5),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              //icon: ActivateIntent,
                              image: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Profile Picture',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Change / Upload',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileSection(),
                  ),
                );
              },
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingPage(),
                  ),
                );
              },
              title: Text(
                'Learnings',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MissedConcepts(),
                  ),
                );
              },
              title: Text(
                'Missed Concepts',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Assigned Trainee profiles',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Ask a doubt',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Share App',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                // AlertDialog(title: Text('Are you sure want to exit'),

                // if (Platform.isAndroid) {
                //   SystemNavigator.pop();
                // } else {
                //   exit(0);
                // }
// ......................
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExitApp(),
                  ),
                );
              },
              title: Text(
                'Exit',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

        // leading: IconButton(
        //   icon: Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (BuildContext context) => MenuBar(),
        //       ),
        //     );
        //   },
        // ),

        // actions: <Widget>[
        //   TextField(
        //     decoration: InputDecoration(
        //       hintText: 'Search',
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(5),
        //       ),
        //     ),
        //   ),
        //   IconButton(
        //     icon: Icon(
        //       Icons.search,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (BuildContext context) => SearchBarOnHomeScreen(),
        //         ),
        //       );
        //     },
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.notifications_active_sharp,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5, color: Colors.white),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          BoxShadow(spreadRadius: 1, blurRadius: 5),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          //icon: ActivateIntent,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('Good Evening',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(
                  'Yashwanth Simha',
                  style: TextStyle(
                      color: Color.fromARGB(255, 146, 80, 56),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  color: Color.fromARGB(255, 215, 213, 213),
                  height: 90,
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text('Yesterdays Achievers',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 69, 156, 72),
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 30),
                          Text('View all'),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(spreadRadius: 1, blurRadius: 1),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    //icon: ActivateIntent,
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk3DgP-r2jcJjdzms_C_WYKnBPK0SdMUE8xA&usqp=CAU'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(spreadRadius: 1, blurRadius: 1),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    //icon: ActivateIntent,
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3KObBX1_3aNYJ8-pwtJsUrne0cawPlh-soA&usqp=CAU'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(spreadRadius: 1, blurRadius: 1),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    //icon: ActivateIntent,
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRuRdeXSJ1OhBp7RqQq2SJqjB9Axq9iavyHw&usqp=CAU'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(spreadRadius: 1, blurRadius: 1),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    //icon: ActivateIntent,
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvGbfnYcCWLB505FNa8JQIJ77h_hN5W_SXKA&usqp=CAU'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(spreadRadius: 1, blurRadius: 1),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    //icon: ActivateIntent,
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcsjMZRq5tDcW-zaTDcZL01NOCrDYLglPqfQ&usqp=CAU'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(spreadRadius: 1, blurRadius: 1),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    //icon: ActivateIntent,
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYUyjMowxdddDUMXbCx_GSjxEc7d_k58g_4Q&usqp=CAU'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Learnings',
              style: TextStyle(
                color: Color.fromARGB(255, 44, 141, 47),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: NetworkImage(
                //           'data:image/png;base64,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'),
                //     ),
                //   ),
                // ),
                Container(
                  color: Color.fromARGB(255, 239, 235, 235),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 20, 1, 106),
                            height: 50,
                            width: 50,
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Image.asset('images/Html.png'),
                              ],
                            ),
                          ),
                          SizedBox(width: 40),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'With HTML you can create your own Website.',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'HTML is easy to learn.You will enjoy it !',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),

                              // ignore: deprecated_member_use
                              RaisedButton(
                                shape: StadiumBorder(),
                                color: Colors.green,
                                onPressed: () {},
                                child: Text(
                                  'Revise HTML Concepts  >>',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // LinearProgressIndicator(
            //   value: 0.4,
            //   backgroundColor: Colors.green,
            //   valueColor: AlwaysStoppedAnimation(Colors.black),
            // ),

            SizedBox(height: 10),

            Container(
              color: Color.fromARGB(255, 239, 235, 235),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 20, 1, 106),
                        height: 40,
                        width: 40,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Image.asset('images/CSS.png'),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'CSS is the language we use to style an HTML document',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'This tutorial will teach you CSS from basic to advanced.',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            shape: StadiumBorder(),
                            color: Colors.green,
                            onPressed: () {},
                            child: Text(
                              'Continue CSS Concepts >>',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Container(
              color: Color.fromARGB(255, 239, 235, 235),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 20, 1, 106),
                        height: 40,
                        width: 40,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Image.asset('images/JS.png'),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'JS is the worlds most popular programming language.',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'JavaScript is the programming language of the web',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            shape: StadiumBorder(),
                            color: Colors.green,
                            onPressed: () {},
                            child: Text(
                              'Start JS Concepts  >>',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // SizedBox(height: 10),
            // Container(
            //   color: Color.fromARGB(255, 207, 138, 133),
            //   child: Wrap(
            //     direction: Axis.horizontal,
            //     children: [
            //       Row(
            //         children: [
            //           Container(
            //             color: Color.fromARGB(255, 20, 1, 106),
            //             height: 50,
            //             width: 50,
            //             child: Wrap(
            //               direction: Axis.horizontal,
            //               children: [
            //                 Image.asset('images/Html.png'),
            //               ],
            //             ),
            //           ),
            //           SizedBox(width: 40),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,

            //             // ignore: prefer_const_literals_to_create_immutables
            //             children: [
            //               Text(
            //                 'With HTML you can create your own Website.',
            //                 style: TextStyle(
            //                     fontSize: 12, fontWeight: FontWeight.bold),
            //               ),
            //               Text(
            //                 'HTML is easy to learn.You will enjoy it !',
            //                 style: TextStyle(
            //                     fontSize: 12, fontWeight: FontWeight.bold),
            //               ),
            //               // ignore: deprecated_member_use
            //               RaisedButton(
            //                 shape: StadiumBorder(),
            //                 color: Colors.green,
            //                 onPressed: () {},
            //                 child: Text(
            //                   'Revise HTML Concepts  >>',
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(height: 10),
            Container(
              color: Color.fromARGB(255, 207, 138, 133),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 20, 1, 106),
                        height: 50,
                        width: 50,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Image.asset('images/Html.png'),
                          ],
                        ),
                      ),
                      SizedBox(width: 40),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'With HTML you can create your own Website.',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'HTML is easy to learn.You will enjoy it !',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            shape: StadiumBorder(),
                            color: Colors.green,
                            onPressed: () {},
                            child: Text(
                              'Revise HTML Concepts  >>',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Container(
              color: Color.fromARGB(255, 207, 138, 133),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 20, 1, 106),
                        height: 50,
                        width: 50,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Image.asset('images/Html.png'),
                          ],
                        ),
                      ),
                      SizedBox(width: 40),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'With HTML you can create your own Website.',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'HTML is easy to learn.You will enjoy it !',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            shape: StadiumBorder(),
                            color: Colors.green,
                            onPressed: () {},
                            child: Text(
                              'Revise HTML Concepts  >>',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
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
