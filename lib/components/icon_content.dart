
import 'package:flutter/material.dart';
import '../constant.dart';

class GenderBox extends StatelessWidget {
  GenderBox({this.icon, this.gender});
  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 80.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            gender,
            style: kLabelTextStyle,
          ),
        ],
      );

  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPress;
  final IconData icon;
  RoundIconButton({this.icon, this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: onPress,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}

