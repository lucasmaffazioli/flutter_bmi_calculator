import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_icon.dart';
import 'enums/gender.dart';
import 'consts.dart';
import 'result.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 80;
  int age = 26;

  void tapFunction(Gender gender) {
    print('activated' + gender.toString());
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            child: ReusableIcon(
                              icon: FontAwesomeIcons.mars,
                              text: 'MALE',
                              color: selectedGender == Gender.male
                                  ? kSelectedCardColor
                                  : kUnselectedCardColor,
                            ),
                            color: kCardColor,
                            tapFunction: () => {tapFunction(Gender.male)},
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            child: ReusableIcon(
                              icon: FontAwesomeIcons.venus,
                              text: 'FEMALE',
                              color: selectedGender == Gender.female
                                  ? kSelectedCardColor
                                  : kUnselectedCardColor,
                            ),
                            color: kCardColor,
                            tapFunction: () => {tapFunction(Gender.female)},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kLabelText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text('$height', style: kLabelNumber),
                              Text('cm'),
                            ],
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 16),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 28),
                            ),
                            child: Slider(
                              max: 220,
                              min: 120,
                              value: height.toDouble(),
                              // inactiveColor: Color(0xFF8D8E98),
                              onChanged: (double newHeight) {
                                setState(() {
                                  height = newHeight.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      color: kCardColor,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            color: kCardColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'WEIGHT',
                                  style: kLabelText,
                                ),
                                Text('$weight', style: kLabelNumber),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        callbackFunction: () {
                                          setState(() {
                                            weight--;
                                          });
                                        }),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        callbackFunction: () {
                                          setState(() {
                                            weight++;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            color: kCardColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'AGE',
                                  style: kLabelText,
                                ),
                                Text('$age', style: kLabelNumber),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        callbackFunction: () {
                                          setState(() {
                                            age--;
                                          });
                                        }),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        callbackFunction: () {
                                          setState(() {
                                            age++;
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(weight, height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Result(calc.getLabel(), calc.bmi, calc.getDescription()),
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kLabelText.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              height: 60,
              width: double.infinity,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
