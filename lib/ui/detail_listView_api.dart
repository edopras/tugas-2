import 'package:flutter/material.dart';
import 'package:tugas_2/ui/grid_listview_api.dart';

class DetailListArrayApi extends StatelessWidget {
  final DataBuku buku;
  const DetailListArrayApi({Key key, this.buku}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("Detail List View Array from API"))
      ),
      body:Column(
        children: <Widget>[
          Card(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('User ID => ${buku.userId}'),
                Text('ID => ${buku.idTitle}'),
                Text('Judul => ${buku.judul}'),
                Text('Isi => ${buku.isi}')
              ],
            ),
          ),
        ],
      )
    );
  }
}