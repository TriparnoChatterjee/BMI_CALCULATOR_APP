import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants/Constants.dart';

import '../Screens/BMI_User_Input_Screen.dart';
import '../Screens/ResultScreen.dart';

class DataSumUpDialog extends StatelessWidget {
  const DataSumUpDialog({
    @required this.widget,
    @required this.age,
    @required this.height,
    @required this.weight,
  });

  final UserInput widget;
  final int age;
  final double height;
  final double weight;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        "Your Health Data :",
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: MediaQuery.of(context).textScaleFactor * 13,
        ),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('images/FINALDATAS.png'),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white70,
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: MediaQuery.of(context).size.height * 0.07,
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  foregroundColor: Colors.white70,
                  radius: 23.0,
                  backgroundColor: Colors.white70,
                  child: Image(
                    image: AssetImage('images/GENDERICON.png'),
                  ),
                ),
                SizedBox(
                  width: 8.5,
                ),
                Text(
                  'SEX : ${widget.gender}',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 13.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'OpenSans'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white70,
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: MediaQuery.of(context).size.height * 0.07,
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 23.0,
                  backgroundColor: Colors.white70,
                  child: Image(
                    image: AssetImage('images/ICONA.png'),
                  ),
                ),
                SizedBox(
                  width: 8.5,
                ),
                Text(
                  'AGE : $age',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 13.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'OpenSans'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white70,
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: MediaQuery.of(context).size.height * 0.07,
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 23.0,
                  backgroundColor: Colors.white70,
                  child: Image(
                    image: AssetImage('images/HEIGHTICON.png'),
                  ),
                ),
                SizedBox(
                  width: 8.5,
                ),
                Text(
                  'HEIGHT : $height',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 13,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'OpenSans'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white70,
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: MediaQuery.of(context).size.height * 0.07,
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 23.0,
                  backgroundColor: Colors.white70,
                  child: Image(
                    image: AssetImage('images/WEIGHTICON.png'),
                  ),
                ),
                SizedBox(
                  width: 8.5,
                ),
                Text(
                  'WEIGHT: $weight',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 13,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'OpenSans'),
                )
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => Results(weight: weight, height: height),
              ),
            );
          },
          child: Text("OK"),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("NOT OK"),
        )
      ],
    );
  }
}
