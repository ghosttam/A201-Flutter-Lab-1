import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// ignore: non_constant_identifier_names
double boer_maleresult = 0.0, james_maleresult = 0.0, hume_maleresult = 0.0;
// ignore: non_constant_identifier_names
double boer_femaleresult = 0.0,
    james_femaleresult = 0.0,
    // ignore: non_constant_identifier_names
    hume_femaleresult = 0.0;
String boer, boer_test, boer_percent, boer_fat;
String james, james_test, james_percent, james_fat;
String hume, hume_test, hume_percent, hume_fat;
String child, child_test, child_percent, child_fat;
double boercal, jamescal, humecal, childcal;

class _MyAppState extends State<MyApp> {
  int groupvalue = 0;
  int agevalue = 0;
  double height = 0, weight = 0;

  TextEditingController _weight = new TextEditingController();
  TextEditingController _height = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lean Body Mass Calculator',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: Text('Lean Body Mass (Metric Unit)'),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 10),
            Image.asset(
              'assets/images/calculator.png',
              scale: 2.5,
            ),
            SizedBox(height: 5),
            Row(children: [
              Container(child: Text('Gender', style: TextStyle(fontSize: 18))),
              Container(
                child: Radio(
                  value: 1,
                  groupValue: groupvalue,
                  onChanged: (int value) {
                    onChanged(value);
                  },
                ),
              ),
              Container(child: Text('Male', style: TextStyle(fontSize: 18))),
              Container(
                child: Radio(
                  value: 2,
                  groupValue: groupvalue,
                  onChanged: (int value) {
                    onChanged(value);
                  },
                ),
              ),
              Container(child: Text('Female', style: TextStyle(fontSize: 18))),
            ]),
            Row(children: [
              Container(
                child:
                    Text('Age 14 or younger?', style: TextStyle(fontSize: 18)),
              ),
              Container(
                child: Radio(
                  value: 1,
                  groupValue: agevalue,
                  onChanged: (int value) {
                    onChanged1(value);
                  },
                ),
              ),
              Container(child: Text('Yes', style: TextStyle(fontSize: 18))),
              Container(
                child: Radio(
                  value: 2,
                  groupValue: agevalue,
                  onChanged: (int value) {
                    onChanged1(value);
                  },
                ),
              ),
              Container(child: Text('No', style: TextStyle(fontSize: 18))),
            ]),
            Row(
              children: [
                Container(
                  child: Text('Height:  ', style: TextStyle(fontSize: 18)),
                ),
                Container(
                  width: 60,
                  child: TextField(
                    decoration: InputDecoration(hintText: 'cm'),
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: _height,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text('Weight: ', style: TextStyle(fontSize: 18)),
                ),
                Container(
                    width: 60,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'kg'),
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _weight,
                    ))
              ],
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: RaisedButton.icon(
                    onPressed: _calculate,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    icon: Icon(Icons.play_arrow_rounded),
                    label: Text('Calculate', style: TextStyle(fontSize: 18)),
                    color: Colors.cyan[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    )),
              ),
              SizedBox(width: 10),
              Container(
                child: RaisedButton(
                    onPressed: _clear,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text('Clear', style: TextStyle(fontSize: 18)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    )),
              ),
            ])
          ],
        ),
      ),
    );
  }

  void onChanged(int value) {
    setState(() {
      groupvalue = value;
    });
  }

  void onChanged1(int value) {
    setState(() {
      agevalue = value;
    });
  }

  void _calculate() {
    height = double.parse(_height.text);
    weight = double.parse(_weight.text);

    calculation(groupvalue, agevalue, height, weight);
    if (agevalue == 1) {
      setState(() {
        Navigator.pushNamed(context, '/result2');
      });
    } else if (agevalue == 2) {
      setState(() {
        Navigator.pushNamed(context, '/result');
      });
    }
  }

  void _clear() {
    setState(() {
      _height.clear();
      _weight.clear();
      groupvalue = 0;
      agevalue = 0;
    });
  }
}

void calculation(int gender, int age, double height, double weight) {
  if (gender == 1) {
    if (age == 1) {
      child = childrencalculation(height, weight);
      child_test = childrenformula(height, weight);
      child_percent = childrenformulap(height, weight);
      child_fat = childrenformulaf(height, weight);
    } else if (age == 2) {
      boer = male_boercalculation(height, weight);
      boer_test = male_boerformula(height, weight);
      boer_percent = male_boerformulap(height, weight);
      boer_fat = male_boerformulaf(height, weight);

      james = male_jamescalculation(height, weight);
      james_test = male_jamesformula(height, weight);
      james_percent = male_jamesformulap(height, weight);
      james_fat = male_jamesformulaf(height, weight);

      hume = male_humecalculation(height, weight);
      hume_test = male_humeformula(height, weight);
      hume_percent = male_humeformulap(height, weight);
      hume_fat = male_humeformulaf(height, weight);
    }
  } else if (gender == 2) {
    if (age == 1) {
      child = childrencalculation(height, weight);
      child_test = childrenformula(height, weight);
      child_percent = childrenformulap(height, weight);
      child_fat = childrenformulaf(height, weight);
    } else if (age == 2) {
      boer = female_boercalculation(height, weight);
      boer_test = female_boerformula(height, weight);
      boer_percent = female_boerformulap(height, weight);
      boer_fat = female_boerformulaf(height, weight);

      james = female_jamescalculation(height, weight);
      james_test = female_jamesformula(height, weight);
      james_percent = female_jamesformulap(height, weight);
      james_fat = female_jamesformulaf(height, weight);

      hume = female_humecalculation(height, weight);
      hume_test = female_humeformula(height, weight);
      hume_percent = female_humeformulap(height, weight);
      hume_fat = female_humeformulaf(height, weight);
    }
  }
}

String male_boercalculation(double height, double weight) {
  double boer_maleresult = (0.407 * weight) + (0.267 * height) - 19.2;
  boercal = boer_maleresult;
}

String male_boerformula(double height, double weight) {
  String boer_test;
  boer_test = boercal.toStringAsFixed(1);
  return boer_test;
}

String male_boerformulap(double height, double weight) {
  String boer_percent;
  double percentage = boercal / weight * 100;
  boer_percent = percentage.toStringAsFixed(0);
  return boer_percent;
}

String male_boerformulaf(double height, double weight) {
  String boer_fat;
  double fat = 100 - (boercal / weight * 100);
  boer_fat = fat.toStringAsFixed(0);
  return boer_fat;
}

String male_jamescalculation(double height, double weight) {
  double james_maleresult =
      (1.1 * weight) - ((128 * weight / height) * (weight / height));
  jamescal = james_maleresult;
}

String male_jamesformula(double height, double weight) {
  String james_test;
  james_test = jamescal.toStringAsFixed(1);
  return james_test;
}

String male_jamesformulap(double height, double weight) {
  String james_percent;
  double percentage = jamescal / weight * 100;
  james_percent = percentage.toStringAsFixed(0);
  return james_percent;
}

String male_jamesformulaf(double height, double weight) {
  String james_fat;
  double fat = 100 - (jamescal / weight * 100);
  james_fat = fat.toStringAsFixed(0);
  return james_fat;
}

String male_humecalculation(double height, double weight) {
  double hume_maleresult = (0.32810 * weight) + (0.33929 * height) - 29.5336;
  humecal = hume_maleresult;
}

String male_humeformula(double height, double weight) {
  String hume_test;
  hume_test = humecal.toStringAsFixed(1);
  return hume_test;
}

String male_humeformulap(double height, double weight) {
  String hume_percent;
  double percentage = humecal / weight * 100;
  hume_percent = percentage.toStringAsFixed(0);
  return hume_percent;
}

String male_humeformulaf(double height, double weight) {
  String hume_fat;
  double fat = 100 - (humecal / weight * 100);
  hume_fat = fat.toStringAsFixed(0);
  return hume_fat;
}

String female_boercalculation(double height, double weight) {
  double boer_maleresult = (0.252 * weight) + (0.473 * height) - 48.3;
  boercal = boer_maleresult;
}

String female_boerformula(double height, double weight) {
  String boer_test;
  boer_test = boercal.toStringAsFixed(1);
  return boer_test;
}

String female_boerformulap(double height, double weight) {
  String boer_percent;
  double percentage = boercal / weight * 100;
  boer_percent = percentage.toStringAsFixed(0);
  return boer_percent;
}

String female_boerformulaf(double height, double weight) {
  String boer_fat;
  double fat = 100 - (boercal / weight * 100);
  boer_fat = fat.toStringAsFixed(0);
  return boer_fat;
}

String female_jamescalculation(double height, double weight) {
  double james_maleresult =
      (1.07 * weight) - ((148 * weight / height) * (weight / height));
  jamescal = james_maleresult;
}

String female_jamesformula(double height, double weight) {
  String james_test;
  james_test = jamescal.toStringAsFixed(1);
  return james_test;
}

String female_jamesformulap(double height, double weight) {
  String james_percent;
  double percentage = jamescal / weight * 100;
  james_percent = percentage.toStringAsFixed(0);
  return james_percent;
}

String female_jamesformulaf(double height, double weight) {
  String james_fat;
  double fat = 100 - (jamescal / weight * 100);
  james_fat = fat.toStringAsFixed(0);
  return james_fat;
}

String female_humecalculation(double height, double weight) {
  double hume_maleresult = (0.29569 * weight) + (0.41813 * height) - 43.2933;
  humecal = hume_maleresult;
}

String female_humeformula(double height, double weight) {
  String hume_test;
  hume_test = humecal.toStringAsFixed(1);
  return hume_test;
}

String female_humeformulap(double height, double weight) {
  String hume_percent;
  double percentage = humecal / weight * 100;
  hume_percent = percentage.toStringAsFixed(0);
  return hume_percent;
}

String female_humeformulaf(double height, double weight) {
  String hume_fat;
  double fat = 100 - (humecal / weight * 100);
  hume_fat = fat.toStringAsFixed(0);
  return hume_fat;
}

String childrencalculation(double height, double weight) {
  double child_halfresult =
      (0.0215 * (pow(weight, 0.6469))) * (pow(height, 0.7236));
  double child_fullresult = 3.8 * child_halfresult;
  childcal = child_fullresult;
}

String childrenformula(double height, double weight) {
  String child_test;
  child_test = childcal.toStringAsFixed(1);
  return child_test;
}

String childrenformulap(double height, double weight) {
  String child_percent;
  double percentage = childcal / weight * 100;
  child_percent = percentage.toStringAsFixed(0);
  return child_percent;
}

String childrenformulaf(double height, double weight) {
  String child_fat;
  double fat = 100 - (childcal / weight * 100);
  child_fat = fat.toStringAsFixed(0);
  return child_fat;
}
