import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/Constants.dart';

import '../Screens/ResultScreen.dart';

class DataSumUp extends StatefulWidget {
  const DataSumUp({
    @required this.age,
    @required this.height,
    @required this.weight,
    @required this.gender,
  });

  final int age;
  final double height;
  final double weight;
  final String gender;

  @override
  _DataSumUpState createState() => _DataSumUpState();
}

class _DataSumUpState extends State<DataSumUp> {
  Widget _portraitDataSumUpScreen() {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(
                  child: Text(
                    'Your health data : ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 20.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      color: Color(0xFF2F3F50),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('images/FINALDATAS.png'),
                    //width: 145.0,
                    width: MediaQuery.of(context).size.width * 0.32,
                    height: MediaQuery.of(context).size.height * 0.30,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
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
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            15.0,
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
                                'AGE : ${widget.age}',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            15.0,
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
                                'HEIGHT : ${widget.height}',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            15,
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
                                'WEIGHT: ${widget.weight}',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'OpenSans'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: MediaQuery.of(context).size.width > 360
                    ? MediaQuery.of(context).size.height * 0.10
                    : MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width > 360
                    ? MediaQuery.of(context).size.width * 0.10
                    : MediaQuery.of(context).size.width * 0.10,
                child: FloatingActionButton(
                  elevation: 25.0,
                  splashColor: Colors.blue,
                  child: Image(
                    color: Colors.white,
                    image: AssetImage('images/NAVIGATIONICON.png'),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Results(
                              weight: widget.weight, height: widget.height),
                        ),
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _portraitDataSumUpScreen();
  }
}
