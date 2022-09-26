// ignore_for_file: unused_import, unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'package:buddycoach/Models.dart/ToDoModel.dart';
import 'package:mysql1/mysql1.dart';
import 'package:buddycoach/database.dart/_dbHelper.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  // _ProfileSectionState() {

  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = higherEducation[0];
    //_databaseHelper = DatabaseHelper();
  }

  var higherEducation = ["Post Graduation", "Graduation/Under Graduate"];
  String? dropdownValue = "Select Higher education";

  // late ToDoModel toDoModel;
  int? selectedId;
  TextEditingController _firstnameEditingController = TextEditingController();
  TextEditingController _middlenameEditingController = TextEditingController();
  TextEditingController _lastnameEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _mobileEditingController = TextEditingController();
  TextEditingController _dobEditingController = TextEditingController();
  var _databaseHelper;

  String? _email;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// .............................
  int _counter = 0;
  // var db = new Mysql();

  // .................employment..............................
  bool checkbox1 = false;

  var employmentType = [
    "Course/certificate",
    "Full time",
    "Part time",
    "Self employed",
    "Freelance",
    "Internship",
    "Trainee"
  ];
  String type = 'Course/certificate';
  // ...............Languages........................................

  // ........................Address...........................................

  _ProfileState() {
    _selectedState = _stateList[0];
  }

  final _stateList = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];
  String? _selectedState;

// ...........................droplist for city...........................................
  Profile() {
    _selectedCity = _cityList[0];
  }

  final _cityList = [
    'Amaravati',
    'Itanagar',
    'Dispur',
    'Patna',
    'Raipur',
    'Panaji',
    'Gandhinagar',
    'Chandigarh',
    'Shimla',
    'Ranchi',
    'Bengaluru',
    'Thiruvananthapuram',
    'Bhopal',
    'Mumbai',
    'Imphal',
    'Shillong',
    'Aizawl',
    'Kohima',
    'Bhubaneswar',
    'Chandigarh',
    'Jaipur',
    'Gangtok',
    'Chennai',
    'Hyderabad',
    'Agartala',
    'Lucknow',
    'Dehradun (Winter) Gairsain (Summer)',
    'Kolkata'
  ];

  String? _selectedCity;

  // .............................location......................................

  //
  // .......................Pick Location...................................
  var locationMessage = '';
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    print(('$lat,$long'));

    setState(() {
      locationMessage = 'latitude :$lat , longitude : $long';
    });
  }

  String? selectedvalue = 'Elementry';

  @override
  // ignore: dead_code, dead_code
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Section'),
          backgroundColor: Colors.green,
        ),
        // ignore: deprecated_member_use
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                // ......................personal details.......................................

                // ignore: deprecated_member_use
                ExpansionTile(
                  title: Text('Personal Details'),
                  children: [
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'First Name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        controller: _firstnameEditingController,
                        keyboardType: TextInputType.name,
                        //onSaved: (firstname) {
                        // _firstname = firstname!;
                        //},
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Middle Name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        controller: _middlenameEditingController,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 05),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Last Name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        controller: _lastnameEditingController,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Email-Id',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "enter valid email id";
                        //   {
                        //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+.[a-z]")
                        //       .hasMatch(value)) {
                        //     return ('Please enter valid email id ');
                        //   }}
                        //   return null;
                        // },
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z.-]+.[a-zA-z]")
                                  .hasMatch(value)) {
                            if (value.isNotEmpty) {
                              return ('Please enter valid email id ');
                            }
                            return "enter email id";
                          } else {
                            return null;
                          }
                        },
                        // onSaved: (email) {
                        //   _email = email!;
                        // },
                        controller: _emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: _mobileEditingController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),

                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "Enter mobile number";
                        //   }
                        //   if (value.length < 9) {
                        //     print('Please enter valid phone number');
                        //   }
                        //   return null;
                        // },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter phone number";
                          }
                          // else if (countryCode == null) {
                          //   return "select country code";
                          // }
                          else if (value.length != 10) {
                            return "enter valid phone number";
                          } else {
                            return null;
                          }
                        },
                        // onSaved: (phone) {
                        //   _phone = phone!;
                        // },

                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      child: TextFormField(
                        controller: _dobEditingController,
                        decoration: InputDecoration(
                            labelText: 'D.O.B',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            ),
                            suffixIcon: Icon(Icons.calendar_month_outlined)),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1920),
                              lastDate: DateTime.now());
                          if (pickeddate != null) {
                            setState(() {
                              _dobEditingController.text =
                                  DateFormat('dd-MM-yyyy').format(pickeddate);
                            });
                          }
                          ;
                        },
                        keyboardType: TextInputType.none,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Flexible(
                        child: ElevatedButton(
                          // ignore: sort_child_properties_last
                          child: Text('Save',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          // ignore: duplicate_ignore
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // savedata();
                              // selectedId != null

                              var reslt1 = await DatabaseHelper.instance.add(
                                  ToDoModel(
                                      firstname:
                                          _firstnameEditingController.text,
                                      middlename:
                                          _middlenameEditingController.text,
                                      lastname: _lastnameEditingController.text,
                                      email: _emailEditingController.text,
                                      mobile: _mobileEditingController.text,
                                      DOB: _dobEditingController.text));
                              print('successful insertion');
                              print('$reslt1');
                              toString();
                              var reslt2 =
                                  await DatabaseHelper.instance.getToDoModel();
                              print('successful fetching');
                              // print('$reslt2');
                              toString();
                              var reslt = await DatabaseHelper.instance.update(
                                  ToDoModel(
                                      firstname:
                                          _firstnameEditingController.text,
                                      middlename:
                                          _middlenameEditingController.text,
                                      lastname: _lastnameEditingController.text,
                                      email: _emailEditingController.text,
                                      mobile: _mobileEditingController.text,
                                      DOB: _dobEditingController.text));
                              print('successful updation');
                              print('$reslt');
                              toString();
                              var reslt3 =
                                  await DatabaseHelper.instance.getToDoModel();
                              print('successful fetching');
                              print('$reslt3');
                              toString();
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                            } else {
                              print('Unsuccessful');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green, fixedSize: Size(350, 40)),
                        ),
                      ),
                    ),
                  ],
                ),
                // ..................................Academic Details..........................

                ExpansionTile(
                  title: Text('Academic Details'),
                  children: [
                    // Text(
                    //   'Academic Details',
                    //   // ignore: prefer_const_constructors
                    //   style: TextStyle(
                    //       decoration: TextDecoration.underline,
                    //       color: Color.fromARGB(255, 51, 131, 53),
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25),
                    // ),
                    SizedBox(height: 5),
                    Center(
                      child: DropdownButtonFormField(
                          value: dropdownValue,
                          items: higherEducation.map(
                            (item) {
                              return DropdownMenuItem(
                                  child: Text(item), value: item);
                            },
                          ).toList(),
                          onChanged: (item) {
                            setState() {
                              dropdownValue = item as String;
                            }
                          }),
                    ),

                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'School / Institute name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              // ignore: prefer_const_constructors
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Degree',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              // ignore: prefer_const_constructors
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Field of Study',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Start Date',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                    width: 2.0,
                                  ),
                                ),
                                suffixIcon: Icon(Icons.calendar_month_outlined),
                              ),
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'End Date',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                      width: 2.0,
                                    ),
                                  ),
                                  suffixIcon:
                                      Icon(Icons.calendar_month_outlined)),
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    // Container(
                    //   height: 50,
                    //   child: TextFormField(
                    //     decoration: InputDecoration(
                    //         hintText: 'End Date',
                    //         enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(15),
                    //           borderSide: BorderSide(
                    //             color: Colors.green,
                    //             width: 2.0,
                    //           ),
                    //         )),
                    //     keyboardType: TextInputType.datetime,
                    //   ),
                    // ),
                    SizedBox(height: 5),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Grade',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: TextFormField(
                        minLines: 3,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Activities',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: TextFormField(
                        minLines: 3,
                        maxLines: 10,
                        decoration: InputDecoration(
                            hintText: 'Description',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Add Certificate',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Flexible(
                        child: ElevatedButton(
                          child: Text('Save',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green, fixedSize: Size(350, 40)),
                        ),
                      ),
                    ),
                  ],
                ),
                // ............................Employment details...............................
                ExpansionTile(title: Text('Employment Details'), children: [
                  // Text(
                  //   'Employment Details',
                  //   // ignore: prefer_const_constructors
                  //   style: TextStyle(
                  //       decoration: TextDecoration.underline,
                  //       color: Color.fromARGB(255, 51, 131, 53),
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 25),
                  // ),
                  SizedBox(width: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.add_box_outlined, size: 30),
                    ],
                  ),

                  SizedBox(height: 5),
                  Center(
                    child: DropdownButtonFormField(
                        value: type,
                        items: employmentType.map(
                          (item) {
                            return DropdownMenuItem(
                                child: Text(item), value: item);
                          },
                        ).toList(),
                        onChanged: (item) {
                          setState() {
                            // type = item;
                          }
                        }),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Title',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            // ignore: prefer_const_constructors
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          )),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Organisation / Institute  name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          )),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 10,
                      decoration: InputDecoration(
                          hintText: 'Location',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          )),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Start Date',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                          suffixIcon: Icon(Icons.calendar_month_outlined)),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'End Date',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                          suffixIcon: Icon(Icons.calendar_month_outlined)),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Industry / Domain',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Profile headline',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  // Autocomplete<String>(
                  //   optionsBuilder:
                  //       (TextEditingValue textEditingValue) {
                  //     if (textEditingValue.text == '') {
                  //       return const Iterable<String>.empty();
                  //     }
                  //     return listItems.where((String item) {
                  //       return item.contains(
                  //           textEditingValue.text.toLowerCase());
                  //     });
                  //   },
                  //   onSelected: (String item) {
                  //     print('The $item Was selected');
                  //   },
                  // ),

                  // CheckboxListTile(
                  //   value: isChecked,
                  //   controlAffinity: ListTileControlAffinity.leading,
                  //   title: Text('Certificate Available'),
                  //   onChanged: (val) {
                  //     print('check $val');
                  //     setState() {
                  //       isChecked = val!;
                  //     }
                  //   },
                  // ),

                  SizedBox(height: 5),
                  Row(
                    children: [
                      Checkbox(
                          value: checkbox1,
                          onChanged: (val) {
                            setState(() {
                              checkbox1 = val!;
                            });
                          }),
                      Text(
                        'Certificate Available',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  // CheckboxListTile(
                  //     value: isChecked,
                  //     title: Text('Certificates Available'),
                  //     onChanged: (val) {
                  //       print('check $val');
                  //       setState() {}
                  //     }),

                  SizedBox(height: 5),
                  Container(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Add Certificate',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Flexible(
                      child: ElevatedButton(
                        // ignore: sort_child_properties_last
                        child: Text('Save',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green, fixedSize: Size(350, 40)),
                      ),
                    ),
                  ),
                ]),
                // ............................Technical skills...............................
                ExpansionTile(
                  title: Text('Technical skills'),
                  children: [],
                ),
                // ............................Soft skills.....................................
                ExpansionTile(
                  title: Text('Soft skills'),
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(width: 80),
                    Icon(Icons.add_box_outlined, size: 30),
                    SizedBox(height: 5),
                    Container(
                      child: TextFormField(
                          minLines: 3,
                          maxLines: 10,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.multiline),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Flexible(
                        child: ElevatedButton(
                          // ignore: sort_child_properties_last
                          child: Text('Save',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green, fixedSize: Size(350, 40)),
                        ),
                      ),
                    ),
                  ],
                ),
                //.............................Extracurricular activities........................
                ExpansionTile(
                  title: Text('Extracurricular Activities'),
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(width: 30),
                    Icon(Icons.add_box_outlined, size: 30),
                    SizedBox(height: 5),
                    Container(
                      child: TextFormField(
                          minLines: 3,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: 'Interests',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.multiline),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: TextFormField(
                          minLines: 3,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: 'Achievements',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.multiline),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Flexible(
                        child: ElevatedButton(
                          // ignore: sort_child_properties_last
                          child: Text('Save',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green, fixedSize: Size(350, 40)),
                        ),
                      ),
                    ),
                  ],
                ),
                //.........................Languages Known......................................
                ExpansionTile(title: Text('Languages Known'),
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(width: 50),
                      Icon(Icons.add_box_outlined, size: 30),

                      // TextField(
                      //   controller: controller,
                      //   decoration: InputDecoration(
                      //     hintText: 'Languages known',
                      //     suffixIcon: Icon(Icons.search_off_outlined),
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //         borderSide:
                      //             BorderSide(color: Colors.green)),
                      //   ),
                      //   //  onChanged: searchLanguage,
                      // ),
                      // Expanded(
                      //   child: ListView.builder(
                      //       itemCount: display_language.length,
                      //       itemBuilder: (context, index) => ListTile(
                      //             title: Text(
                      //               display_language[index].language,
                      //             ),
                      //           )
                      //       //   final language = languages[index];

                      //       //   return ListTile(
                      //       //     title: Text('English'),
                      //       //   );
                      //       ),
                      // ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Proficiency',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text('Elementary'),
                                  SizedBox(width: 10),
                                  Radio<String>(
                                      value: 'elementry',
                                      groupValue: selectedvalue,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedvalue = val;
                                        });
                                      }),
                                  // RadiobuttonGroup()
                                  // Radio(
                                  //   value: 1,
                                  //   groupValue: _value,
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       _value:
                                  //       value;
                                  //     });
                                  //   },
                                  // ),
                                ],
                              ),
                              SizedBox(width: 30),
                              Column(
                                children: [
                                  Text('Limited working'),
                                  SizedBox(width: 10),
                                  Radio<String>(
                                      value: 'Limited working',
                                      groupValue: selectedvalue,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedvalue = val;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text('Professional working'),
                                  SizedBox(width: 10),
                                  Radio<String>(
                                      value: 'Professional working',
                                      groupValue: selectedvalue,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedvalue = val;
                                        });
                                      }),
                                ],
                              ),
                              SizedBox(width: 30),
                              Column(
                                children: [
                                  Text('Native / Bilingual'),
                                  SizedBox(width: 10),
                                  Radio<String>(
                                    value: 'Native/Bilingual',
                                    groupValue: selectedvalue,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedvalue = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Flexible(
                              child: ElevatedButton(
                                // ignore: sort_child_properties_last
                                child: Text('Save',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    fixedSize: Size(350, 40)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                //...........................Family details..................................
                ExpansionTile(
                  title: Text('Family Details'),
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(width: 50),
                    Icon(Icons.add_box_outlined, size: 30),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Father's Name",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Father's Occupation",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Mother's Name",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Mother's Occupation",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Flexible(
                        child: ElevatedButton(
                          child: Text('Save',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green, fixedSize: Size(350, 40)),
                        ),
                      ),
                    ),
                  ],
                ),
                // ................................Address......................................
                ExpansionTile(
                  title: Text('Address'),
                  children: [
                    SizedBox(width: 80),
                    Icon(Icons.add_box_outlined, size: 30),

                    SizedBox(height: 10),
                    Text(
                      'Communication Address',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'H.No/Flat No.',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Block / Apartment',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Street',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Locality / Village',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    DropdownButton(
                        //value: _selectedState,
                        items: _stateList.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: (e),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedState = val as String;
                          });
                        }),
                    // ...........................................................................
                    DropdownButton(
                        // value: _selectedCity,
                        items: _cityList.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: (e),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedCity = val as String;
                          });
                        }),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Pin Code',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 45.0, color: Colors.red),

                        Text(locationMessage),
                        SizedBox(height: 5),
                        // ignore: deprecated_member_use
                        TextButton(
                          child: Text(
                            'Pick location from google',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            getCurrentLocation();
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 5),
                    Row(
                      children: [
                        Checkbox(
                            value: checkbox1,
                            onChanged: (val) {
                              setState(() {
                                checkbox1 = val!;
                              });
                            }),
                        Text('Permanent address same as communication address'),
                      ],
                    ),

                    SizedBox(height: 10),
                    Text(
                      'Permanent Address',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'H.No/Flat No.',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Block / Apartment',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Street',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Locality / Village',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    DropdownButton(
                        //value: _selectedState,
                        items: _stateList.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: (e),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedState = val as String;
                          });
                        }),
                    // ...........................................................................
                    DropdownButton(
                        // value: _selectedCity,
                        items: _cityList.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: (e),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _selectedCity = val as String;
                          });
                        }),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Pin Code',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            )),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 45.0, color: Colors.red),

                        Text(locationMessage),
                        SizedBox(height: 5),
                        // ignore: deprecated_member_use
                        TextButton(
                          child: Text(
                            'Pick location from google',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            getCurrentLocation();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Flexible(
                        child: ElevatedButton(
                          // ignore: sort_child_properties_last
                          child: Text('Save',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green, fixedSize: Size(350, 40)),
                        ),
                      ),
                    ),
                  ],
                ),
                //.............................Goals..........................................
                ExpansionTile(title: Text('Goals'), children: [
                  SizedBox(height: 5),
                  Container(
                    child: TextFormField(
                        minLines: 3,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Short term',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.multiline),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: TextFormField(
                        minLines: 3,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Long term',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.multiline),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Flexible(
                      child: ElevatedButton(
                        // ignore: sort_child_properties_last
                        child: Text('Save',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green, fixedSize: Size(350, 40)),
                      ),
                    ),
                  ),
                ]),
                // ................................Personality Traits..........................
                ExpansionTile(title: Text('Personality Traits'), children: [
                  SizedBox(height: 5),
                  Container(
                    child: TextFormField(
                        minLines: 3,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Strengths',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.multiline),
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: TextFormField(
                        minLines: 3,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Weakness',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.multiline),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Flexible(
                      child: ElevatedButton(
                        // ignore: sort_child_properties_last
                        child: Text('Save',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green, fixedSize: Size(350, 40)),
                      ),
                    ),
                  ),
                ]),
              ]),
            ),
          ),
        ));
  }
}
