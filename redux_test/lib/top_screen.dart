import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_test/count_state.dart';
import 'package:redux_test/under_screen.dart';

class TopScreen extends StatefulWidget {
  @override
  _TopSreenState createState() => _TopSreenState();
}

class _TopSreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Title(color: Colors.blue, child: new Text("哈哈哈")),
      ),
      body: new Center(
          child: StoreConnector<CountState, int>(
              builder: (context, count) {
                return new Text(count.toString());
              },
              converter: (store) => store.state.count)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return UnderScreen();
          }));
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}
