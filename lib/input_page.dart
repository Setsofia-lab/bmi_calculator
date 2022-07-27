import 'package:flutter/material.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'buttombutton.dart';
import 'roundbuttonicon.dart';
import 'calculator_brain.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: reusable_container(
                onPress: () {
                  setState(() {
                    selectedGender = GenderType.male;
                  });
                },
                color: selectedGender == GenderType.male
                    ? kactiveCardColor
                    : kinactiveCardColor,
                cardChild: IconContent(
                  icon: Icons.male_rounded,
                  label: 'MALE',
                ),
              )),
              Expanded(
                  child: reusable_container(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      color: selectedGender == GenderType.female
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardChild: IconContent(
                        icon: Icons.female_rounded,
                        label: 'FEMALE',
                      )))
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: reusable_container(
                color: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toString(),
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('180', style: kNumberTextSyle),
                        Text('cm', style: klabelTextStyle)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: reusable_container(
                color: kactiveCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: klabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextSyle,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.minimize,
                              onPressed: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                              // ),
                            )
                          ]),
                    ]),
              )),
              Expanded(
                  child: reusable_container(
                color: kactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: klabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextSyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: Icons.minimize,
                            onPressed: () {
                              setState(() {
                                age = age - 1;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                age = age + 1;
                              });
                            }),
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
        ButtomButton(
          buttonTitle: 'CALCULATE',
          onTap: () {
            CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult() ,
                  interpretation: calc.getInterpretation(),
                ),
              ),
            );
          },
        )
      ]),
    );
  }
}
