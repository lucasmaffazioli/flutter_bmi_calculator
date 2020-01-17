import '../components/reusable_card.dart';

import '../constants.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String label;
  final String bmi;
  final String description;

  Result(this.label, this.bmi, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Your Result',
                      style: kTituloResultado,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: kCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              label,
                              style: kLabelStatus,
                            ),
                            Text(
                              bmi,
                              style: kLabelNumber.copyWith(
                                fontSize: 70,
                              ),
                            ),
                            Text(
                              description,
                              style: kTituloResultado.copyWith(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
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
      ),
    );
  }
}
