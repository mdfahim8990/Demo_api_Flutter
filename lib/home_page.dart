import 'dart:convert';

import 'package:demo_api/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DataModel _dataModel;
  var url = Uri.parse('https://reqres.in/api/users?page=1');

  Future<void> getData() async {
    http.Response response = await http.get(url);
    setState(() {
      var decode = json.decode(response.body);
      //Data = decode;
      _dataModel = dataModelFromJson(decode);

      print(_dataModel.data!.first.avatar);
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
      body: Container(
        child: Text(_dataModel.data!.first.avatar!),
      ),
    );
  }

  Widget _bodyUI() => ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => Container(),
      );
}
