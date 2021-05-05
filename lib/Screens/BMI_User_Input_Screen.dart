import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Widgets/DataSumUpBottomSheet_Portrait.dart';
import '../Widgets/RoundIconButton_Reusable.dart';
import '../constants/Constants.dart';

import '../Widgets/DataSumUpDialog_Landscape.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserInput extends StatefulWidget {
  final String image;
  final String gender;
  final String id = 'UserInputScreen_male';

  UserInput({this.image, this.gender});
  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  int age;
  double weight = 65;
  double height = 200;
  Widget _portraitUserInputScreen() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 5,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(55.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0,
                      spreadRadius: 3.0,
                      offset: Offset(7.0, 3.0),
                    ),
                  ]),
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.30,
              child: RotatedBox(
                quarterTurns: -1,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.red[700],
                    inactiveTrackColor: Colors.red[100],
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    thumbColor: Colors.redAccent,
                    overlayColor: Colors.red.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    tickMarkShape: RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.black,
                    inactiveTickMarkColor: Colors.black,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.redAccent,
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    divisions: 180,
                    label: height.toString(),
                    value: height.toDouble(),
                    min: 91.44,
                    max: 272.0,
                    onChanged: (double value) {
                      setState(() {
                        height = double.parse((value).toStringAsFixed(3));
                      });
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.10,
              top: MediaQuery.of(context).size.height * 0.45,
              child: Image(
                height: MediaQuery.of(context).size.height * .40,
                width: MediaQuery.of(context).size.height * .20,
                image: AssetImage(
                  'images/${widget.image}.png',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                      offset: Offset(7.0, 3.0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Text(
                        'WEIGHT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Text(
                        '${weight.toString()}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 45,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withBlue(43)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight += 0.5;
                              });
                            }),
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight -= 0.5;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .28,
                width: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                      offset: Offset(7.0, 3.0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Text(
                        'AGE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: CupertinoPicker(
                        magnification: 1.024,
                        useMagnifier: true,
                        diameterRatio: 1.5,
                        onSelectedItemChanged: (int val) {
                          setState(() {
                            age = val;
                          });
                        },
                        itemExtent: 42.0,
                        children: ages(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _landscapeUserInputScreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.height * .20,
          child: Image(
            height: double.infinity,
            width: MediaQuery.of(context).size.height * .20,
            image: AssetImage(
              'images/${widget.image}.png',
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width > 480
                  ? MediaQuery.of(context).size.width * 0.85
                  : MediaQuery.of(context).size.width * 0.70,
              child: Center(
                child: Text(
                  'YOUR HEIGHT : $height',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1.0,
                      fontFamily: 'OpenSans',
                      fontSize: MediaQuery.of(context).textScaleFactor * 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              decoration: BoxDecoration(color: Colors.white70, boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4.0,
                  spreadRadius: 3.0,
                  offset: Offset(7.0, 3.0),
                ),
              ]),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(55.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0,
                      spreadRadius: 3.0,
                      offset: Offset(7.0, 3.0),
                    ),
                  ]),
              height: MediaQuery.of(context).size.width * 0.05,
              width: MediaQuery.of(context).size.width * 0.85,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red[700],
                  inactiveTrackColor: Colors.red[100],
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 3.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  thumbColor: Colors.redAccent,
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: Colors.black,
                  inactiveTickMarkColor: Colors.black,
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.redAccent,
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Slider(
                  divisions: 180,
                  label: height.toString(),
                  value: height.toDouble(),
                  min: 91.44,
                  max: 272.0,
                  onChanged: (double value) {
                    setState(() {
                      height = double.parse((value).toStringAsFixed(3));
                    });
                  },
                ),
              ),
            ),
            // SizedBox(
            //   height: 2.0,
            // ),
            Container(
              height: MediaQuery.of(context).size.height * 0.50 -
                  MediaQuery.of(context).viewInsets.bottom -
                  5,
              width: MediaQuery.of(context).size.width * 0.70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: MediaQuery.of(context).size.width * 0.30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                          offset: Offset(7.0, 3.0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: Center(
                            child: Text(
                              'WEIGHT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'OpenSans-Bold',
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: Center(
                            child: Text(
                              '${weight.toString()}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withBlue(43)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight += 0.5;
                                    });
                                  }),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight -= 0.5;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 30.0,
                  // ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: MediaQuery.of(context).size.width * 0.30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                          offset: Offset(7.0, 3.0),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: Center(
                            child: Text(
                              'AGE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'OpenSans-Bold',
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CupertinoPicker(
                            magnification: 1.024,
                            useMagnifier: true,
                            diameterRatio: 1.5,
                            onSelectedItemChanged: (int val) {
                              setState(() {
                                age = val;
                              });
                            },
                            itemExtent: 42.0,
                            children: ages(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xFF4C4F5E),
                onPressed: () {},
                child: RoundIconButton(
                  icon: FontAwesomeIcons.arrowRight,
                  onPressed: () {
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return DataSumUp(
                                age: age,
                                height: height,
                                weight: weight,
                                gender: widget.gender,
                              );
                            })
                        : showDialog(
                            context: context,
                            builder: (BuildContext context) => DataSumUpDialog(
                                widget: widget,
                                age: age,
                                height: height,
                                weight: weight));
                  },
                ),
              ),
              appBar: AppBar(
                centerTitle: true,
                title: Text('BMI CALCULATOR'),
              ),
              body: SafeArea(
                  child:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? _portraitUserInputScreen()
                          : _landscapeUserInputScreen()),
            );
          },
        );
      },
    );
  }
}
