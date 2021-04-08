import 'package:flutter/material.dart';
import './widgets/count_label.dart';

class Count extends InheritedWidget {
  final int count;

  Count({@required this.count, @required Widget child}) : super(child: child);

  static Count of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Count>();

  bool updateShouldNotify(Count oldWidget) => oldWidget.count != count;
}

class CallsScreen extends StatefulWidget {
  @override
  _CallsScreenState createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  var count = 0;

  increment() {
    setState(() {
      count = count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Count(
      count: count,
      child: Builder(
        builder: (BuildContext subContext) {
          return SizedBox(
            child: Column(
              children: [
                CountLabel(),
                ElevatedButton(
                  onPressed: increment,
                  child: Text('Add'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
