import 'dart:convert';

import 'package:apitutorial/models/json_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<JsonModel> postList = [];
  Future<List<JsonModel>> getPostApi() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(JsonModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API 1st Tutorial"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading");
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("userId:\t${postList[index].userId}"),
                                Text("id:\t${postList[index].id}"),
                                Text("title:\t${postList[index].title}"),
Text("body:\t${postList[index].body}"),
                                // Text("id:\t${postList[index].id}"),
                                // Text("name:\t${postList[index].name}"),
                                // Text("username:\t${postList[index].username}"),
                                // Text("email:\t${postList[index].email}"),
                                // Text("address:\t${postList[index].address}"),
                                // Text("phone:\t${postList[index].phone}"),
                                // Text("website:\t${postList[index].website}"),
                                // Text("company:\t${postList[index].company}"),
                              ],
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
