import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_2/ui/detail_listView_api.dart';

class GridViewApi extends StatefulWidget {
  @override
  _GridViewApiState createState() => _GridViewApiState();
}
class DataBuku {
  final int userId;
  final int idTitle;
  final String judul;
  final String isi;
  DataBuku(this.userId,this.idTitle,this.judul,this.isi);
  //DataBuku(this.judul,this.isi);
}
class _GridViewApiState extends State<GridViewApi> {
  String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  List dataPost = [];

  void getPost() async {
    var response = await http.get(baseUrl);
    print("Data Status Code : " + response.statusCode.toString());
    print("Data Body : " + response.body);
    setState(() {
      dataPost = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    getPost();
  }
  @override
  void dispose() {
    super.dispose();
    setState(() {
      dataPost = [];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View API"),
      ),
      body: dataPost.length == 0
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: dataPost.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                var title = dataPost[index]["title"];
                return Card(
                  child: InkWell(
                    onTap: ()
                    {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => DetailListArrayApi(buku:new DataBuku(dataPost[index]["userId"], dataPost[index]["id"],dataPost[index]["title"],dataPost[index]["body"]))));
                      //Navigator.push(context,MaterialPageRoute(builder: (context) => DetailListArrayApi(buku:new DataBuku(dataPost[index]["title"],dataPost[index]["body"]))));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(8),
                      child: Text("$title"),
                    ),
                  ),
                );
              }),
    );
  }
}
