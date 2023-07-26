import 'package:csc_picker/csc_picker.dart';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:first_app/UI/Screens/UserProfile/userProfileScreen.dart';
import 'package:first_app/UI/Screens/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:flutter/services.dart';

class RangeTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  RangeTextInputFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    } else {
      final numericValue = int.tryParse(newValue.text);
      if (numericValue != null && numericValue >= min && numericValue <= max) {
        return newValue;
      } else {
        return oldValue;
      }
    }
  }
}

class RegisterInfo extends StatefulWidget {
  const RegisterInfo({super.key});

  @override
  State<RegisterInfo> createState() => _RegisterInfoState();
}

class _RegisterInfoState extends State<RegisterInfo> {
  TextEditingController dateController = TextEditingController();
  List<String> items = [
    '•Agriculture',
    '•Architecture and design',
    '•Arts',
    '•Engineering',
    '•Business and management',
    '•ICT (information technical communication)',
    '•Medicine',
    '•Medical science and health',
    '•Journalism',
    '•Education'
  ];
  String? selected_item = null;
  List<String> items_Diploma = [
    '▪6th grade level',
    '▪grade 9 level',
    '▪bac level',
    '▪technician level',
    '▪For licence level',
    '▪maitrise level',
    "▪master's or engineering level.",
    '▪doctorate level.',
    '▪habilitation level.',
  ];
  DateTime now = DateTime.now();
  DateTime? selectedDate;
  String? selected_item_Diploma = null;
  final formKey = GlobalKey<FormState>();
  String name = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 32),
          padding: const EdgeInsets.only(left: 30, right: 40),
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "here To Get ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                  const Text(
                    "Welcomed ! ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Enter Your Name Please"),
                    validator: (value) {
                      if (value!.isEmpty ||
                          RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                        return "Enter a Correct UserName";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.025),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Enter Your LastName Please"),
                    validator: (value) {
                      if (value!.isEmpty ||
                          RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                        return "Enter a Correct UserName";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.025),
                  CSCPicker(
                    layout: Layout.vertical,
                    onCountryChanged: (Country) {},
                    onCityChanged: (City) {},
                    onStateChanged: (State) {},
                    countryDropdownLabel: "*Country",
                    stateDropdownLabel: "*State",
                    cityDropdownLabel: "*City",
                    dropdownDialogRadius: 25,
                    searchBarRadius: 30,
                  ),
                  SizedBox(height: size.height * 0.025),
                  const IntlPhoneField(
                    decoration: InputDecoration(
                        labelText: "PhoneNumber",
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                          hintText: "Choose your Domaine please ",
                          enabledBorder: OutlineInputBorder()),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              )))
                          .toList(),
                      value: selected_item,
                      hint: Text("Choose Your Domaine Please"),
                      onChanged: (item) => setState(() {
                            selected_item = item as String;
                          })),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                          hintText: "Choose your Domaine please ",
                          enabledBorder: OutlineInputBorder()),
                      items: items_Diploma
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              )))
                          .toList(),
                      value: selected_item_Diploma,
                      hint: const Text("Enter Your Last Diploma Please"),
                      onChanged: (items_Diploma) => setState(() {
                            selected_item_Diploma = items_Diploma;
                          })),
                  SizedBox(height: size.height * 0.025),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter Your Expertise In This Domain",
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      RangeTextInputFormatter(min: 0, max: 100),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a value";
                      } else {
                        final numericValue = int.tryParse(value);

                        if (numericValue == null) {
                          return "Enter a valid number";
                        } else if (numericValue < 0 || numericValue > 100) {
                          return "Enter a number between 0 and 100";
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.025),
                  TextField(
                    controller:
                        dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText:
                            "Enter Date of the last Graduient Diploma" //label text of field
                        ),
                    readOnly: true, // when true user cannot edit text

                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(
                              1900), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      setState(() {
                        if (pickedDate != null) {
                          int year = pickedDate.year;
                          int month = pickedDate.month;
                          int day = pickedDate.day;
                          String updatedMonth =
                              month.toString().padLeft(2, '0');

                          String updatedDay = day.toString().padLeft(2, '0');
                          dateController.text =
                              '$year/$updatedMonth/$updatedDay';
                        }
                      });

                      //when click we have to show the datepicker
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Add An Other Domaine'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: const InputDecoration(
                                      hintText: "Choose your Domain Please ",
                                      enabledBorder: OutlineInputBorder(),
                                    ),
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: selected_item,
                                    onChanged: (item) => setState(() {
                                      selected_item = item as String;
                                    }),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.025,
                                  ),
                                  DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(),
                                    ),
                                    items: items_Diploma
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    value: selected_item_Diploma,
                                    hint: const Text(
                                        "Enter Your Last Diploma Please"),
                                    onChanged: (items_Diploma) => setState(() {
                                      selected_item_Diploma = items_Diploma;
                                    }),
                                  ),
                                  SizedBox(height: size.height * 0.025),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText:
                                          "Enter Your Expertise In This Domain",
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      RangeTextInputFormatter(min: 0, max: 100),
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter a value";
                                      } else {
                                        final numericValue =
                                            int.tryParse(value);

                                        if (numericValue == null) {
                                          return "Enter a valid number";
                                        } else if (numericValue < 0 ||
                                            numericValue > 100) {
                                          return "Enter a number between 0 and 100";
                                        } else {
                                          return null;
                                        }
                                      }
                                    },
                                  ),
                                  SizedBox(height: size.height * 0.025),
                                  TextField(
                                    controller: dateController,
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.calendar_today),
                                      labelText:
                                          "Enter Date of the last Graduient Diploma",
                                    ),
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2101),
                                      );
                                      setState(() {
                                        if (pickedDate != null) {
                                          int year = pickedDate.year;
                                          int month = pickedDate.month;
                                          int day = pickedDate.day;
                                          String updatedMonth =
                                              month.toString().padLeft(2, '0');
                                          String updatedDay =
                                              day.toString().padLeft(2, '0');
                                          dateController.text =
                                              '$year/$updatedMonth/$updatedDay';
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Handle add button action here
                                  },
                                  child: Text('Add'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'Do you have another Domain?',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        width: size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(200,
                                  60), // Adjust the width and height as needed
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return UserProfileScreen();
                                  },
                                ),
                              );
                            },
                            child: Text('Register'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
