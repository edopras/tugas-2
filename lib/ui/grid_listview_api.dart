import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_2/model/model_user2.dart';
import 'package:tugas_2/model/user_model.dart';
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
  DataBuku(this.userId, this.idTitle, this.judul, this.isi);
  //DataBuku(this.judul,this.isi);
}

class _GridViewApiState extends State<GridViewApi> {
  String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  String baseUrl2 = 'https://jsonplaceholder.typicode.com/users';
  bool isLoading = false;
  String statusResponse = "Data Kosong";
  List dataPost = [];
  List<ModelUser> userList;

  /*
   * Note : Disarankan Gunakan Model Untuk Fetch, Post, Kirim data dari API
   * gunakan try and catch untuk menghandle connection kita dan supaya lebih tau letak masalah nya dimana
   * Contoh sample di bawah ini saya gunakan api getuser
  */

  void getPost() async {
    var response = await http.get(baseUrl);
    print("Data Status Code : " + response.statusCode.toString());
    print("Data Body : " + response.body);
    setState(() {
      dataPost = jsonDecode(response.body);
    });
  }

  Future getUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.get(baseUrl2);
      setState(() {
        //Handle Data
        if (response.statusCode == 200) {
          isLoading = false;
          userList = modelUserFromJson(response.body);
          return null;
        } else {
          isLoading = false;
          userList = [];
          statusResponse = "Data Kosong";
          return null;
        }
      });
    } catch (e) {
      //Handle Connection
      setState(() {
        isLoading = false;
        userList = [];
        statusResponse = "Connection Failed";
      });
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    getPost();
    getUser();
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
      body: //**userList == null || userList.length == 0 **/
          userList == null || userList.length == 0
              ? isLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : Center(child: Text("$statusResponse"))
              : GridView.builder(
//                  itemCount: dataPost.length,
                  itemCount: userList.length == null ? 0 : userList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
//                    var title = dataPost[index]["title"];
                    ModelUser data = userList[index];
                    return Card(
                      child: InkWell(
                        onTap: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => DetailListArrayApi(
//                                      buku: new DataBuku(
//                                          dataPost[index]["userId"],
//                                          dataPost[index]["id"],
//                                          dataPost[index]["title"],
//                                          dataPost[index]["body"]))));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailListArrayApi(
                                    user: data,
                                  )));
                          //Navigator.push(context,MaterialPageRoute(builder: (context) => DetailListArrayApi(buku:new DataBuku(dataPost[index]["title"],dataPost[index]["body"]))));
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(8),
//                          child: Text("$title"),
                          child: Text("${data.username}"),
                        ),
                      ),
                    );
                  }),
    );
  }
}
