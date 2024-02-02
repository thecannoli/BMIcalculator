import "package:bmicalc/calculator_brain.dart";
import "package:bmicalc/icon_content.dart";
import "package:bmicalc/resuable_card.dart";
import "package:bmicalc/results_page.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "constants.dart";

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? genderSelection;

  int height = 180;
  int weight = 64;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ///// Male & Female selectors
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      genderSelection = Gender.female;
                    });
                  },
                  colour: genderSelection == Gender.female ? kActiveCardColour : kInactiveCardColor,
                  cardChild: const IconContent(
                    cardIcon: Icons.female,
                    cardText: 'FEMALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      genderSelection = Gender.male;
                    });
                  },
                  colour: genderSelection == Gender.male ? kActiveCardColour : kInactiveCardColor,
                  cardChild: const IconContent(
                    cardIcon: Icons.male,
                    cardText: 'MALE',
                  ),
                ),
              ),
            ]),
          ),
          ///// Height Selector
          Expanded(
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kFatLbaelText,
                      ),
                      const Text(
                        ' cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      overlayColor: const Color(0x29EB1555),
                      thumbColor: const Color(0xFFeB1555),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 170.0,
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
            ),
          ),
          ///// Weight and Age Selectors
          Expanded(
            child: Row(
              children: [
                ///// WEIGHT SELECTOR //////////
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT'),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString(),
                              style: kFatLbaelText,
                            ),
                            const Text(' kg'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                selectedIcon: FontAwesomeIcons.minus,
                                method: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(width: 5.0),
                            RoundIconButton(
                                selectedIcon: FontAwesomeIcons.plus,
                                method: () {
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
                //////  AGE SELECTORS //////
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE'),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              age.toString(),
                              style: kFatLbaelText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                selectedIcon: FontAwesomeIcons.minus,
                                method: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(width: 5.0),
                            RoundIconButton(
                                selectedIcon: FontAwesomeIcons.plus,
                                method: () {
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
          //U/// CALCULATOR BUTTON
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResults: calc.calculateBMI(),
                    resultsText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              alignment: Alignment.center,
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: const Text('CALCULATE', style: kLabelTextStyleWhite),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, @required this.selectedIcon, @required this.method});

  final IconData? selectedIcon;
  final void Function()? method;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        constraints: const BoxConstraints.tightFor(
          width: 35.0,
          height: 35.0,
        ),
        elevation: 6.0,
        disabledElevation: 6.0,
        onPressed: method,
        fillColor: kActiveCardColour,
        shape: const CircleBorder(),
        child: Icon(
          selectedIcon,
          color: Colors.white,
          size: 15.0,
        ));
  }
}
