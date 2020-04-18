import 'package:flutter/material.dart';
import 'package:tugas_2/ui/grid_listview_array.dart';

class DetailListViewArray extends StatelessWidget {
  final Person person;
  const DetailListViewArray({Key key, this.person}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('${person.nama}');
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("Detail List View Array"))
      ),
      body:Column(
        children: <Widget>[
          Card(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('nama saya Adalah ${person.nama}'),
                Text('Saya Tinggal di ${person.address}')
              ],
            ),
          ),
        ],
      )
    );
  }
}