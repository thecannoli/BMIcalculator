import "package:flutter/material.dart";
import "constants.dart";

double numericalResults = 26.0;

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.bmiResults, required this.resultsText, required this.interpretation});

  @required
  final String bmiResults;
  final String resultsText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calcuator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Your Result',
              style: kFatLbaelText,
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              color: kInactiveCardColor,
              margin: const EdgeInsets.all(25.0),
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultsText,
                    textAlign: TextAlign.center,
                    style: kLabelTextGreen,
                  ),
                  Text(
                    bmiResults.toString(),
                    style: kFatLbaelTextBig,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.center,
                color: Colors.pink,
                child: const Text(
                  'RECALCUATE',
                  textAlign: TextAlign.center,
                  style: kLabelTextStyleWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
