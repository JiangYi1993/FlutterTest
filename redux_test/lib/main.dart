import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_test/count_state.dart';
import 'top_screen.dart';

void main() {
  final store =
      Store<CountState>(reducer, initialState: CountState.initState());
  runApp(new MyApp(store));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Store<CountState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(
        store: store,
        child: new MaterialApp(
          title: "flutter demo",
          theme: new ThemeData.dark(),
          home: new TopScreen(),
        ));
  }
}
