import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/reusable_container.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage ({@required this.interpretation, @required this.bmiResults,
    @required this.resultText});
  final String bmiResults;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Results'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Results',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColour,
             cardChild: Column (
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Text(resultText.toUpperCase(), style: kResultTextStyle,),
                 Text(bmiResults, style: kBmiTextStyle,),
                 Text(interpretation, style: kBodyTextStyle,
                 textAlign: TextAlign.center),

               ],
             ), ),
            ),
            CalculateButton(
              function: 'RE-CALCULATE',
              onPress: () {
                //destroys the new screen from stack and moves back to previous page
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
