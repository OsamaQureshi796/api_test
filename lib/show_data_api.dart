import 'package:api_example/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/data_controller.dart';

class ShowApiDataScreen extends StatefulWidget {
   ShowApiDataScreen({Key? key,this.apiList}) : super(key: key);
   List<PostModel>? apiList;
  @override
  _ShowApiDataScreenState createState() => _ShowApiDataScreenState();
}

class _ShowApiDataScreenState extends State<ShowApiDataScreen> {


  AppData? appData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appData = Get.find();
  }



  void updateRecord(String? title) {

    Map<String,dynamic> newRecord = {
      'title': title!,
      'body': "This is my new Body",
      'userId': 10,
      'id':15
    };

    Map<String,String> header = {
      'Content-type': 'application/json; charset=UTF-8'
    };


    appData!.sendPut("https://jsonplaceholder.typicode.com/posts/15", newRecord, header);

  }
void deleteRecord() {



    appData!.senddelete("https://jsonplaceholder.typicode.com/posts/15");

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("API Data"),
      ),
      body: ListView.builder(itemBuilder: (ctx,i){
        return ListTile(
title: Text(widget.apiList![i].title!),
         leading: IconButton(
           icon: Icon(Icons.delete), onPressed: () {
deleteRecord();
         },

         ),
         subtitle: Text(widget.apiList![i].body!),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){
            updateRecord('New Title');
            },
          ),
        );
      },itemCount: widget.apiList!.length,),
    );
  }
}
