import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import './flashcard.dart';
import './flashcard_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> _flashcards = [
    Flashcard(question: "what is you name?", answer: "Minsung"),
    Flashcard(question: "what is age?", answer: "34"),
    Flashcard(question: "what is sir name?", answer: "kin"),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    speed: 300,
                    front: FlashcardView(
                      text: _flashcards[_currentIndex].question,
                    ),
                    back: FlashcardView(
                      text: _flashcards[_currentIndex].answer,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev'),
                  ),
                  OutlineButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
