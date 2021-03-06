import 'dart:async';
import 'dart:convert';

import 'package:api_example/models/post_model.dart';
import 'package:api_example/network_handler/network_handler.dart';
import 'package:api_example/show_data_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class AppData extends GetxController{

  List<PostModel>? postModel;

    getMyPosts(String? url)async{
      try{
        http.Response? response = await NetworkHandler.getMethodCall(url: url,headers: {});

            if(response!.statusCode == 200){
              ///------- Successfully got data


               postModel = postModelFromJson(response.body);


              Get.snackbar('Wow', "Successfully got data",colorText: Colors.white,backgroundColor: Colors.red);

              Timer(Duration(seconds: 3),(){
                Get.to(()=> ShowApiDataScreen(apiList: postModel,));
              });

            }else{
              ///------- Issue
              Get.snackbar('Failed', response.body,colorText: Colors.white,backgroundColor: Colors.red);
              print(response.body);
            }

      }catch(e){
        Get.snackbar('Failed', "$e",colorText: Colors.white,backgroundColor: Colors.red);
        print(e);
      }
    }

    sendPost(String? url,Map<String,dynamic> body, Map<String,String> headers)async{

      try{
        http.Response? response = await NetworkHandler.postMethodCall(url: url,headers: headers,body: body);

        print(response!.statusCode);
        print("My Data responce ${response.body}");

        if(response.statusCode == 201){
          ///------- Successfully got data


          Get.snackbar('Wow', "Successfully send data",colorText: Colors.white,backgroundColor: Colors.red);



        }else{
          ///------- Issue
          Get.snackbar('Failed', response.body,colorText: Colors.white,backgroundColor: Colors.red);
          print(response.body);
        }

      }catch(e){
        Get.snackbar('Failed', "$e",colorText: Colors.white,backgroundColor: Colors.red);
        print(e);
      }


    }


  sendPut(String? url,Map<String,dynamic> body, Map<String,String> headers)async{

    try{
      http.Response? response = await NetworkHandler.putMethodCall(url: url,headers: headers,body: body);

      print(response!.statusCode);
      print("My Data responce ${response.body}");

      if(response.statusCode == 201){
        ///------- Successfully got data


        Get.snackbar('Wow', "Successfully send data",colorText: Colors.white,backgroundColor: Colors.red);



      }else{
        ///------- Issue
        Get.snackbar('Failed', response.body,colorText: Colors.white,backgroundColor: Colors.red);
        print(response.body);
      }

    }catch(e){
      Get.snackbar('Failed', "$e",colorText: Colors.white,backgroundColor: Colors.red);
      print(e);
    }


  }

  senddelete(String? url)async{

    try{
      http.Response? response = await NetworkHandler.deleteMethodCall(url: url);

      print(response!.statusCode);
      print("My Data responce ${response.body}");

      // if(response.statusCode == 201){
      //   ///------- Successfully got data
      //
      //
      //   Get.snackbar('Wow', "Successfully send data",colorText: Colors.white,backgroundColor: Colors.red);
      //
      //
      //
      // }else{
      //   ///------- Issue
      //   Get.snackbar('Failed', response.body,colorText: Colors.white,backgroundColor: Colors.red);
      //   print(response.body);
      // }

    }catch(e){
      Get.snackbar('Failed', "$e",colorText: Colors.white,backgroundColor: Colors.red);
      print(e);
    }


  }

}