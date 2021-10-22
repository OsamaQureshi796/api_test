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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (ctx,i){
        return ListTile(
title: Text(widget.apiList![i].title!),
         subtitle: Text(widget.apiList![i].body!),
        );
      },itemCount: widget.apiList!.length,),
    );
  }
}
