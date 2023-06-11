import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';
import '../component/quote_tile.dart';

class AppHomePage extends StatefulWidget {
  AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  var apiURL = 'https://type.fit/api/quotes';

  Future<List<dynamic>> getPost() async {
    final response = await http.get(
      Uri.parse(apiURL),
    );
    return postFromJson(response.body);
  }

  List<dynamic> postFromJson(String str) {
    final jsonData = json.decode(str);
    jsonData.shuffle();
    return jsonData;
  }

  final RandomColor _randomColor = RandomColor();
  //final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
          future: getPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return ErrorWidget(snapshot.error!);
              }
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var model = snapshot.data?[index];
                  return QouteTile(
                    quote: model['text'].toString(),
                    author: model['author'].toString(),
                    bgColor: _randomColor.randomColor(
                      colorHue: ColorHue.multiple(
                          colorHues: [ColorHue.red, ColorHue.blue]),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },
      ),
    );
  }
}
