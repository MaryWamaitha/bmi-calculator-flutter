import 'package:flutter/material.dart';
import '../constant.dart';


class CalculateButton extends StatelessWidget {
  final String function;
  final Function onPress;

  CalculateButton({@required this.function, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomBoxColour,
        child: Center(
            child: Text(
              function,
              style: kMainButtonStyle,
            )),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}