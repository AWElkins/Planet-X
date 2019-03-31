import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();
  int radioValue;
  double _finalResult = 0.0;
  String _formattedText = "";

  void radioValueChange(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 1.19);
          _formattedText = "Your weight on Neptune is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 2.34);
          _formattedText = "Your weight on Jupiter is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 3:
          _finalResult = calculateWeight(_weightController.text, 0.92);
          _formattedText = "Your weight on Uranus is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 4:
          _finalResult = calculateWeight(_weightController.text, 1.06);
          _formattedText = "Your weight on Saturn is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 5:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset(
                "images/planet.png",
                height: 133.0,
                width: 200.0,
            ),

            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Your weight on Earth",
                      hintText: 'In Pounds',
                      icon: Icon(Icons.person_outline)
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(5.0)),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: radioValueChange,
                        ),

                        Text(
                          "Neptune",
                          style: TextStyle(color: Colors.white30),
                        ),

                        Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: radioValueChange,
                        ),

                        Text(
                          "Jupiter",
                          style: TextStyle(color: Colors.white30),
                        ),

                        Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: radioValueChange,
                        ),

                        Text(
                          "Venus",
                          style: TextStyle(color: Colors.white30),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Radio<int>(
                          activeColor: Colors.brown,
                          value: 3,
                          groupValue: radioValue,
                          onChanged: radioValueChange,
                        ),

                        Text(
                          "Uranus",
                          style: TextStyle(color: Colors.white30),
                        ),

                        Radio<int>(
                          activeColor: Colors.red,
                          value: 4,
                          groupValue: radioValue,
                          onChanged: radioValueChange,
                        ),

                        Text(
                          "Saturn",
                          style: TextStyle(color: Colors.white30),
                        ),

                        Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 5,
                          groupValue: radioValue,
                          onChanged: radioValueChange,
                        ),

                        Text(
                          "Mars",
                          style: TextStyle(color: Colors.white30),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(15.6),
                  ),
                  
                  Text(
                    _weightController.text.isEmpty ? "Please enter a weight" : _formattedText + ' lbs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(weight.length > 0 && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    }
  }
}
