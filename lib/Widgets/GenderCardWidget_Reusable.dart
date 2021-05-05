import 'package:flutter/material.dart';

class GenderCardWidget extends StatelessWidget {
  // final double rightPosition;
  final String sex;
  final Color genderCardColor;
  final String image;
  final Function onPressed;
  GenderCardWidget({
    @required this.genderCardColor,
    @required this.image,
    @required this.sex,
    // @required this.rightPosition,
    @required this.onPressed,
  });
  Widget _portraitModeGenderCard(
      MediaQueryData mediaQuery, BoxConstraints constraints) {
    return InkWell(
      splashColor: genderCardColor,
      borderRadius: BorderRadius.circular(10.0),
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            height: mediaQuery.size.height * 0.25,
            width: mediaQuery.size.width * 0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    offset: Offset(7.0, 3.0),
                  ),
                ]),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: mediaQuery.size.width > 360
                      ? mediaQuery.size.height * 0.14
                      : mediaQuery.size.height * 0.10,
                  width: mediaQuery.size.width > 360
                      ? mediaQuery.size.width * 0.25
                      : mediaQuery.size.width * 0.15,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: genderCardColor,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: mediaQuery.size.height * 0.03,
                  child: Text(
                    sex,
                    style: TextStyle(
                      fontSize: mediaQuery.textScaleFactor * 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans-Bold',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: constraints.maxWidth * 0.13,
            top: constraints.minHeight * -12.0,
            child: Image(
              height: mediaQuery.size.height * 0.20,
              image: AssetImage('images/$image.png'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return mediaQuery.orientation == Orientation.portrait
                ? _portraitModeGenderCard(mediaQuery, constraints)
                : GestureDetector(
                    onTap: onPressed,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                          height: mediaQuery.size.height * 0.54,
                          width: mediaQuery.size.width * 0.23,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(7.0, 3.0),
                                ),
                              ]),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(13.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: mediaQuery.size.height * 0.30,
                                width: mediaQuery.size.width * 0.25,
                                margin: EdgeInsets.all(10.0),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: genderCardColor,
                                ),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                height: mediaQuery.size.height * 0.04,
                                child: Text(
                                  sex,
                                  style: TextStyle(
                                    fontSize: mediaQuery.textScaleFactor * 10,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans-Bold',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: mediaQuery.size.height * 0.15,
                          // top: constraints.minHeight * -20,
                          child: Image(
                            height: mediaQuery.size.height * 0.40,
                            image: AssetImage('images/$image.png'),
                          ),
                        ),
                      ],
                    ),
                  );
          },
        );
      },
    );
  }
}
