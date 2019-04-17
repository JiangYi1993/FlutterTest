import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_test/count_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

class UnderScreen extends StatefulWidget {
  @override
  State createState() {
    return _underScreenState();
  }
}

class _underScreenState extends State<UnderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("underScreen"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("you have pushed the button this many time"),
              new StoreConnector<CountState, int>(
                  converter: (store) => store.state.count,
                  builder: (context, count) {
                    return Text(count.toString());
                  }),
            ],
          ),
        ),
        floatingActionButton: new StoreConnector<CountState, VoidCallback>(
            builder: (context, callback) {
          return new FloatingActionButton(
            onPressed: callback,
            child: Icon(Icons.add),
          );
        }, converter: (store) {
          return () => store.dispatch(Action.increment);
        }));
  }
}
