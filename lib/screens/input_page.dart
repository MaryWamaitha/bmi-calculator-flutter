import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_container.dart';
import '../constant.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int weight = 40;
  int age = 12;
  // Color maleCardColor = InactiveBoxColor;
  // Color femaleCardColor = InactiveBoxColor;
  //
  // //1 is male and 2 is female
  // void updateColour (Gender gender){
  //   //male card is pressed
  //   if (gender == Gender.male){
  //     if(maleCardColor == InactiveBoxColor){
  //       maleCardColor = BoxColor;
  //       femaleCardColor = InactiveBoxColor;
  //     } else {
  //       maleCardColor = InactiveBoxColor;
  //     }
  //   }
  //   if (gender == Gender.female){
  //     if(femaleCardColor == InactiveBoxColor){
  //       femaleCardColor = BoxColor;
  //       maleCardColor = InactiveBoxColor;
  //     } else {

  //       femaleCardColor = InactiveBoxColor;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: gender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    onPress: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    cardChild: Expanded(
                      child: GenderBox(
                        icon: FontAwesomeIcons.mars,
                        gender: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    //tenary operators used to manage the Toggle
                    colour: gender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    onPress: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    cardChild: Expanded(
                      child: GenderBox(
                        icon: FontAwesomeIcons.venus,
                        gender: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //the text baseline allows us to have the height and cm on the same lovel
                      //but you have to specify the text baseline or else the app wil crash
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kMajorTextStyle,
                        ),
                        Text('cm', style: kLabelTextStyle)
                      ],
                    ),
                    //the slider expects the minimum arguments of a double and an OnChanged
                    SliderTheme(
                      //the copy with allows us to copy a theme but only
                      //change what we need to change without altering
                      //all of the theme details

                      //When using material components, you can always tap into the theme to customize it further
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          activeTrackColor: Colors.white70,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          overlayColor: Color(0X29EB1555),
                          thumbColor: Color(0XFFEB1555),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.00,
                        max: 220.00,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kMajorTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                            ),
                            SizedBox(width: 12.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kMajorTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age = age - 1;
                                });
                              },
                            ),
                            SizedBox(width: 12.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age = age + 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            function: 'CALCULATE',
            onPress: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight:weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResults: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      //the theme here allows us to change the specific elements of this widget to be different from what is in the initial theme specified
      //this is done by wrapping it around a theme widget which gives
      //us even more control
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //       colorScheme:
      //           ColorScheme.fromSwatch().copyWith(secondary: Colors.purple)),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}



//this is a custom container that we created whose properties we can specify
//and can help reduce repetition of flutter widgets needed but still be more customized

