import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final restaurants = const [
    {'restaurant': 'eatttttttttttttttttttttt', 'color': Colors.black},
    {'restaurant': 'McDonalds\'s', 'color': Colors.blue},
    {'restaurant': 'Thai', 'color': Colors.red},
    {'restaurant': 'Korean', 'color': Colors.yellow},
    {'restaurant': 'Chinese', 'color': Colors.indigo},
    {'restaurant': 'Japanese', 'color': Colors.teal}
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('What do you want to eat?'),
              if (currentIndex != null)
                Text(
                  restaurants.elementAt(currentIndex)['restaurant'] as String,
                  style: TextStyle(
                    fontSize: 30,
                    color:
                        restaurants.elementAt(currentIndex)['color'] as Color,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              Padding(
                  padding: EdgeInsets.only(
                top: 20,
              )),
              FlatButton(
                onPressed: () {
                  updateIndex();
                },
                child: Text('Pick Restaurant'),
                color: Colors.blue,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);

    setState(() {
      currentIndex = index;
    });
  }
}
