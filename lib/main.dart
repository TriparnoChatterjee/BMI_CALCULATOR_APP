import 'package:flutter/material.dart';

import './Screens/BMI_User_Input_Screen.dart';
import './Screens/Gender_Selection_Screen.dart';

void main() {
  runApp(BmiCalculatorApp());
}

class BmiCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: GenderSelection().id,
      routes: {
        GenderSelection().id: (context) => GenderSelection(),
        '/MALE': (context) => UserInput(
              image: 'MALEHEIGHT',
              gender: 'MALE',
            ),
        '/FEMALE': (context) => UserInput(
              image: 'WOMANHEIGHT',
              gender: 'WOMAN',
            ),
        '/OTHERS': (context) => UserInput(
              image: 'OTHERSHEIGHT',
              gender: 'OTHERS',
            ),
      },
    );
  }
}
