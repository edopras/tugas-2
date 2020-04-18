import 'package:flutter/material.dart';
import 'package:tugas_2/ui/detail_listview_array.dart';

class ArrayListView extends StatefulWidget {
  @override
  _ArrayListViewState createState() => _ArrayListViewState();
}
class Person {
  final String nama;
  final String address;

  Person(this.nama, this.address);
}
class _ArrayListViewState extends State<ArrayListView> {
  var listData = [
    {
      "name":"john","address":"Surabaya"
    },
    {
      "name":"Preketek","address":"Bandung"
    },
    {
      "name":"Linda","address":"Semarang"
    },
    {
      "name":"Adi","address":"Tegal"
    },
    {
      "name":"Arum","address":"Balikpapan"
    },
    {
      "name":"Saiful","address":"Jambi"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("Array List View"))
      ),
      body:GridView.builder(
        itemCount:listData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index)
        {
          var nama = listData[index]["name"];
          var alamat = listData[index]["address"];
          return Card(
            child:InkWell(
              onTap: ()
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => DetailListViewArray(person:new Person(listData[index]["name"], listData[index]["address"]))));
              },
              child: Container(
                padding:EdgeInsets.all(24),
                margin: EdgeInsets.all(8),
                alignment: Alignment.center,
                child:Text('$nama => $alamat')
              ),
            )
          );
        },
        )
    );
  }
}