import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme data allows us to specify the colours that we want to use in our app
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   //changes the scaffold colour
      //   scaffoldBackgroundColor: Color(0xFF101427),
      //   //text theme manages the styling of all the text in the app
      //   textTheme: TextTheme(
      //     bodyText1: TextStyle(),
      //     bodyText2: TextStyle(),
      //   ).apply(
      //     bodyColor: Colors.white,
      //     displayColor: Colors.white,
      //   ),
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Color(0xFF101427), //use your hex code here
      //   ),
      //   colorScheme:
      //       ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
      // ),
      //
      //moving to new screens

      theme: ThemeData.dark().copyWith(
        //changes the scaffold colour
        scaffoldBackgroundColor: Color(0xFF101427),
        //text theme manages the styling of all the text in the app
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF101427), //use your hex code here
        ),
      ),
     home: InputPage(),
      // initialRoute: '/',
      // routes: {
      //   //the InputPage() refers to the main class being ran in the screen you are calling
      //   '/': (context) => InputPage(),
      //   'first/': (context) => ResultsPage(),
      // },
    );
  }
}

