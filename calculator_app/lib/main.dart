import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final T_controller = TextEditingController();

  List<bool> _selection = [true, false, false];

  String? tip;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (tip != null)
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  tip as String,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            Text("Total amount"),
            SizedBox(
              width: 70,
              child: TextField(
                controller: T_controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '\$100'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ToggleButtons(
                children: [Text('10%'), Text('15%'), Text('20%')],
                isSelected: _selection,
                onPressed: updateSelection,
              ),
            ),
            FlatButton(
              onPressed: () {
                return calcuateTip();
              },
              child: Text('Calculate'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ]),
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; ++i) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void calcuateTip() {
    final totalAmount = double.parse(T_controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];
    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

    setState(() {
      tip = '\$$tipTotal';
    });
  }
}
