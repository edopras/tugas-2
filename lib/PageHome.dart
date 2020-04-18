import 'package:flutter/material.dart';
import 'package:tugas_2/ui/grid_listview_api.dart';
import 'package:tugas_2/ui/grid_listview_array.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Tugas ke 2"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("ListView Array"),
              color: Colors.yellow,
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ArrayListView()));

              },
            ),
            RaisedButton(
              color: Colors.redAccent,
              child: Text('ListView From API'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GridViewApi()));
              },
            ),
          ],
        ),
      ),
    );
  }
}