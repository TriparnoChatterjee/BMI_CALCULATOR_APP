import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/Widgets/GenderCardWidget_Reusable.dart';

class GenderSelection extends StatefulWidget {
  final String id = 'GenderSelectionScreen';
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  Widget _landscapeModeScreen(MediaQueryData mediaQuery) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: mediaQuery.size.width * 0.10,
          child: Text(
            'PLEASE SELECT YOUR GENDER',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: mediaQuery.textScaleFactor * 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans-Regular',
              letterSpacing: 1.0,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GenderCardWidget(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/MALE');
              },
              sex: 'MALE',
              genderCardColor: Color(0xFF8DBBFF),
              image: 'MAN',
            ),
            GenderCardWidget(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/FEMALE');
                },
                genderCardColor: Colors.pink[200],
                image: 'WOMAN',
                sex: 'FEMALE'),
            GenderCardWidget(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/OTHERS');
                },
                genderCardColor: Color(0xFFE0FC7C),
                image: 'OTHERS',
                sex: 'OTHERS'),
          ],
        ),
      ],
    );
  }

  Widget _portraitModeScreen(MediaQueryData mediaQuery) {
    return mediaQuery.size.width > 360
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: mediaQuery.size.width * 0.10,
                child: Text(
                  'PLEASE SELECT YOUR GENDER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mediaQuery.textScaleFactor * 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans-Regular',
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GenderCardWidget(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/MALE');
                },
                sex: 'MALE',
                genderCardColor: Color(0xFF8DBBFF),
                image: 'MAN',
              ),
              GenderCardWidget(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/FEMALE');
                  },
                  genderCardColor: Colors.pink[200],
                  image: 'WOMAN',
                  sex: 'FEMALE'),
              GenderCardWidget(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/OTHERS');
                  },
                  genderCardColor: Color(0xFFE0FC7C),
                  image: 'OTHERS',
                  sex: 'OTHERS'),
            ],
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: mediaQuery.size.width * 0.10,
                  child: Text(
                    'PLEASE SELECT YOUR GENDER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: mediaQuery.textScaleFactor * 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans-Regular',
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GenderCardWidget(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/MALE');
                  },
                  sex: 'MALE',
                  genderCardColor: Color(0xFF8DBBFF),
                  image: 'MAN',
                ),
                GenderCardWidget(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/FEMALE');
                    },
                    // rightPosition: 50.0,
                    genderCardColor: Colors.pink[200],
                    image: 'WOMAN',
                    sex: 'FEMALE'),
                GenderCardWidget(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/OTHERS');
                    },
                    genderCardColor: Color(0xFFE0FC7C),
                    image: 'OTHERS',
                    sex: 'OTHERS'),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    print('data');
    final mediaQuery = MediaQuery.of(context);
    print('$mediaQuery.textScaleFactor');

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mediaQuery.orientation == Orientation.portrait
                        ? _portraitModeScreen(mediaQuery)
                        : _landscapeModeScreen(mediaQuery),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
