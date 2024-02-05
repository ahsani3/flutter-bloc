import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Column(
      children: <Widget>[
        Text('Counter: ${counter.value}'),
        ElevatedButton(
          onPressed: () => counter.increment(),
          child: Text('Increment'),
        ),
      ],
    );
  }
}

class Counter with ChangeNotifier {
  int _value = 0;

  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}
