import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task2/modals/api_modal.dart';
import 'package:http/http.dart'as http;
import 'package:url_launcher/url_launcher.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: FutureBuilder<ApiModal>(
          future: fetchPost(),
          builder: (context, snapshot) {

            if ( snapshot.connectionState==ConnectionState.done && snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.entries!.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff97FFFF),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data!.entries![index].aPI}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("${snapshot.data!.entries![index].auth}"),
                        SizedBox(height: 10),
                        Text("${snapshot.data!.entries![index].hTTPS}"),
                        SizedBox(height: 10),
                        Text("${snapshot.data!.entries![index].description}"),
                        SizedBox(height: 10),
                        Text("${snapshot.data!.entries![index].cors}"),
                        SizedBox(height: 10),


                        GestureDetector(

                          onTap: ()
                          {
                            fun("${snapshot.data!.entries![index].link}");

                          },
                          child: Text(
                              "${snapshot.data!.entries![index].link}"
                          ),

                        ),

                        SizedBox(height: 10),
                        Text("${snapshot.data!.entries![index].category}"),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
  Future<ApiModal> fetchPost() async {
    final response =
    await http.get(Uri.parse('https://api.publicapis.org/entries'));
      print(response.body.toString());
    if (response.statusCode == 200) {

      final parsed = json.decode(response.body);
      final ApiModal apiModal=ApiModal.fromJson(parsed);
      return apiModal;

    } else {
      print("errorrr");
      throw Exception('Failed to load album');
    }
  }

  Future<void> fun(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "Error: Could not launch $url";
      }
    } catch (e) {
      print(e.toString());
      throw "Error: Could not launch $url";
    }
  }


}

