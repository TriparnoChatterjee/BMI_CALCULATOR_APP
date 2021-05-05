import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FitnessTable extends StatefulWidget {
  final double bmi;
  const FitnessTable({
    @required this.bmi,
  });

  @override
  _FitnessTableState createState() => _FitnessTableState();
}

class _FitnessTableState extends State<FitnessTable> {
  int selectedIndex = -1;
  bool isSelected = true;
  void changeSelection() {
    var bmiIndex = widget.bmi;
    if (bmiIndex <= 15) {
      selectedIndex = 0;
    } else if (bmiIndex > 15 && bmiIndex <= 16) {
      selectedIndex = 1;
    } else if (bmiIndex > 16 && bmiIndex <= 18.5) {
      selectedIndex = 2;
    } else if (bmiIndex > 18.5 && bmiIndex <= 25) {
      selectedIndex = 3;
    } else if (bmiIndex > 25 && bmiIndex <= 30) {
      selectedIndex = 4;
    } else if (bmiIndex > 30 && bmiIndex <= 35) {
      selectedIndex = 5;
    } else if (bmiIndex > 35 && bmiIndex <= 40) {
      selectedIndex = 6;
    } else if (bmiIndex > 40 && bmiIndex <= 50) {
      selectedIndex = 7;
    }
  }

  @override
  void initState() {
    changeSelection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "FITNESS DESCRIPTION",
        style: TextStyle(
          fontFamily: 'OpenSans',
        ),
      ),
      content: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    backgroundBlendMode: BlendMode.multiply,
                  ),
                  columns: <DataColumn>[
                    DataColumn(label: Text('')),
                    DataColumn(
                      label: Text(
                        'BMI RANGE',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'FITNESS DESCRIPTION',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    // 0 - (very Severly underweight)
                    DataRow(
                      color: MaterialStateProperty.resolveWith((Set states) {
                        if (states.contains(MaterialState.selected))
                          return Colors.red.shade900;
                        else {
                          return Colors.red.shade400;
                        }
                      }),
                      selected: 0 == selectedIndex,
                      cells: <DataCell>[
                        DataCell(buildSelectedIcon()),
                        DataCell(Text(
                          '0 < BMI < = 15',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        DataCell(Text(
                          'Very severely underweight',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                      ],
                    ),
                    // 1 - ( Severly underweight)
                    DataRow(
                      color: MaterialStateProperty.resolveWith((Set states) {
                        if (states.contains(MaterialState.selected))
                          return Colors.red.shade900;
                        else {
                          return Colors.red.shade300;
                        }
                      }),
                      selected: 1 == selectedIndex,
                      cells: <DataCell>[
                        DataCell(buildSelectedIcon()),
                        DataCell(Text(
                          '15 < BMI < = 16',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        DataCell(Text(
                          'Severely underweight',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                      ],
                    ),
                    //2 - (Underweight)
                    DataRow(
                      color: MaterialStateProperty.resolveWith((Set states) {
                        if (states.contains(MaterialState.selected))
                          return Colors.yellow.shade900;
                        else {
                          return Colors.yellow[100];
                        }
// Use the default value.
                      }),
                      selected: 2 == selectedIndex,
                      cells: <DataCell>[
                        DataCell(
                          buildSelectedIcon(),
                        ),
                        DataCell(Text(
                          '16 < BMI < = 18.5',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        DataCell(Text(
                          'Underweight',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                      ],
                    ),
                    // 3- Normal
                    DataRow(
                      color: MaterialStateProperty.resolveWith((Set states) {
                        if (states.contains(MaterialState.selected))
                          return Colors.green.shade900;
                        else {
                          return Colors.green[200];
                        }
// Use the default value.
                      }),
                      selected: 3 == selectedIndex,
                      cells: <DataCell>[
                        DataCell(
                          buildSelectedIcon(),
                        ),
                        DataCell(Text(
                          '18.5 < BMI < = 25',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        DataCell(Text(
                          'Normal ',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                      ],
                    ),
                    //4 - Overweight
                    DataRow(
                      color: MaterialStateProperty.resolveWith((Set states) {
                        if (states.contains(MaterialState.selected))
                          return Colors.yellow.shade900;
                        else {
                          return Colors.yellow[100];
                        }
// Use the default value.
                      }),
                      selected: 4 == selectedIndex,
                      cells: <DataCell>[
                        DataCell(
                          buildSelectedIcon(),
                        ),
                        DataCell(Text(
                          '25 < BMI < = 30',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        DataCell(Text(
                          'Overweight',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                      ],
                    ),
                    //5 - ObeseClass - 1
                    DataRow(
                      color: MaterialStateProperty.resolveWith((Set states) {
                        if (states.contains(MaterialState.selected))
                          return Colors.orange.shade900;
                        else {
                          return Colors.orange[200];
                        }
// Use the default value.
                      }),
                      selected: 5 == selectedIndex,
                      cells: <DataCell>[
                        DataCell(
                          buildSelectedIcon(),
                        ),
                        DataCell(Text(
                          '30 < BMI < = 35',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        DataCell(
                          Text(
                            'Obese Class I (Moderately obese)',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //6 - ObeseClass2
                    DataRow(
                      color: MaterialStateProperty.resolveWith((Set states) {
                        if (states.contains(MaterialState.selected))
                          return Colors.red.shade900;
                        else {
                          return Colors.red[300];
                        }
// Use the default value.
                      }),
                      selected: 6 == selectedIndex,
                      cells: <DataCell>[
                        DataCell(
                          buildSelectedIcon(),
                        ),
                        DataCell(Text(
                          '35 < BMI < = 40',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        DataCell(
                          Text(
                            'Obese Class II (Severely obese)',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //7-ObeseClass3
                    DataRow(
                      color: MaterialStateProperty.resolveWith((Set states) {
                        if (states.contains(MaterialState.selected))
                          return Colors.red.shade900;
                        else {
                          return Colors.red.shade400;
                        }
// Use the default value.
                      }),
                      selected: 7 == selectedIndex,
                      cells: <DataCell>[
                        DataCell(
                          buildSelectedIcon(),
                        ),
                        DataCell(
                          Text(
                            '40 < BMI < = 50',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            'Obese Class III (Very severely obese)',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        new TextButton(
          child: new Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Icon buildSelectedIcon() {
    return Icon(
      FontAwesomeIcons.dotCircle,
      color: Colors.white,
    );
  }
}
