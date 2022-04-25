import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage  extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
var Data;
var url =Uri.parse (' https://reqres.in/api/users?page=1');
  Future<void> getData()async{
     http.Response response = await http.get(url);
    setState(() {
      var decode = json.decode(response.body);
      Data = decode;
      print(Data);
    });
  }
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_bodyUI(),
    );
  }

  Widget _bodyUI()=>ListView.builder(
    itemCount: 30,
    itemBuilder: (context, index)=>Container(),
  );
}
