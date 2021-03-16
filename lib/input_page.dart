import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          colour: selectedGender == Gender.male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: IconContent(
                            label: 'MALE',
                            icon: FontAwesomeIcons.mars,
                          ))),
                  Expanded(
                      child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardChild: IconContent(
                            label: 'FEMALE',
                            icon: FontAwesomeIcons.venus,
                          ))),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: kLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x1fEB1555),
                            thumbColor: Color(0xFFEB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 18),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.00),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120.00,
                              max: 220.00,
                              inactiveColor: Color(0xFF8D8E98),
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              }),
                        ),
                      ],
                    ))),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColor,
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColor,
                  )),
                ],
              ),
            ),
            Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}
