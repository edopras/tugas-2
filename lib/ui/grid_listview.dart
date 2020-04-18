import 'package:flutter/material.dart';

class GridListView extends StatefulWidget {
  @override
  _GridListViewState createState() => _GridListViewState();
}

class _GridListViewState extends State<GridListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Center(child: Text("Grid List View"))
        ),
        body:GridView.builder(
          itemCount: 30,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context,index)
          {
            return Card(
              elevation:5,
              child: Container(
                margin: EdgeInsets.all(8),
                height: 80,
                width: 80,
                color: Colors.blue,
              ),
            );
          }
        ),
    );
  }
}