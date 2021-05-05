import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/Chart.dart';
import '../constants/Constants.dart';
import '../Screens/Gender_Selection_Screen.dart';
import '../Widgets/FitnessDialog.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Results extends StatefulWidget {
  final double weight;
  final double height;

  Results({@required this.weight, @required this.height});
  final String id = 'ResultScreen';
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool _showChart = false;
  String fitnessQuote(double val) {
    if (val <= 15) {
      return 'Eat as much  food You want.Will be better if you consider a doctor';
    } else if (val > 15 && val <= 16) {
      return 'Eat as much healthy food You want. Take care of your nutrition buddy!.Will be helpful if you pay a visit to the nutritionist';
    } else if (val > 16 && val <= 18.5) {
      return 'Eat healthy and good food . Although Its better to be skinny than to be fat';
    } else if (val > 18.5 && val <= 25) {
      return 'You are fit.Smile and be happy ';
    } else if (val > 25 && val <= 30) {
      return 'Will be better if you go on a run every day or jog and do some push-ups';
    } else if (val > 30 && val <= 35) {
      return 'Time for some cardio exercises. Switch to home cooked meal thank junk or oily foods';
    } else if (val > 35 && val <= 40) {
      return 'Go and hit the gym buddy ..!! and Curb you junk or unhealthy food and switch to a better diet';
    } else if (val > 40 && val <= 50) {
      return 'Must switch to a healthy diet and start exercises.Better to consider a doctor ';
    } else {
      return 'ERROR : Recheck your BMI INPUTS ';
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmiVal =
        (widget.weight / ((widget.height / 100.0) * (widget.height / 100.0)));

    Widget _portraitResultScreen() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.05,
            child: Center(
              child: Text(
                'YOUR BMI RESULT : ',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: MediaQuery.of(context).textScaleFactor * 17,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.50,
            child: ChartDisplay(
              bmiVal: bmiVal,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                boxShadow: boxShadow,
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                )),
            child: Center(
              child: Text(
                fitnessQuote(bmiVal),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).textScaleFactor * 15,
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[500],
                onPrimary: Colors.white,
                elevation: 10.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'BACK',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[500],
                onPrimary: Colors.white,
                elevation: 10.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'RE-CALCULATE',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  Navigator.pushReplacementNamed(context, GenderSelection().id);
                });
              }),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          )
        ],
      );
    }

    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            bottomNavigationBar: Container(
              color: Colors.blue,
              height: 50,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              elevation: 30.0,
              splashColor: Colors.green,
              child: Icon(FontAwesomeIcons.eye),
              onPressed: () {
                setState(() {
                  // flutter defined function
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return FitnessTable(
                        bmi: bmiVal,
                      );
                    },
                  );
                });
              },
            ),
            body: MediaQuery.of(context).orientation == Orientation.portrait
                ? _portraitResultScreen()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: Center(
                            child: Text(
                              'YOUR BMI RESULT : ',
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 20,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Chart Mode : ',
                              softWrap: true,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 15,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            CupertinoSwitch(
                                value: _showChart,
                                onChanged: (val) {
                                  setState(() {
                                    _showChart = val;
                                  });
                                }),
                          ],
                        ),
                        !_showChart
                            ? Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                child: Center(
                                  child: Text(
                                    '$bmiVal',
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: MediaQuery.of(context)
                                              .textScaleFactor *
                                          65,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              )
                            : Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                  ),
                                  ChartDisplay(bmiVal: bmiVal),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.height * 0.03,
                          decoration: BoxDecoration(
                              color: Colors.grey[600],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 16.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(0, 20),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              boxShadow: boxShadow,
                              color: Colors.white70,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              )),
                          child: Center(
                            child: Text(
                              fitnessQuote(bmiVal),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 15,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue[500],
                              onPrimary: Colors.white,
                              elevation: 10.0,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text(
                              'BACK',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            }),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue[500],
                              onPrimary: Colors.white,
                              elevation: 10.0,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text(
                              'RE-CALCULATE',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.pushReplacementNamed(
                                    context, GenderSelection().id);
                              });
                            }),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
