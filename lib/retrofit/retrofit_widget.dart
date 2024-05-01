import 'package:ch13_fastcampus_http/retrofit/post_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RetrofitWidget extends StatefulWidget {
  const RetrofitWidget({super.key});

  @override
  State<RetrofitWidget> createState() => _RetrofitWidgetState();
}

class _RetrofitWidgetState extends State<RetrofitWidget> {
  Dio dio = Dio();
  late PostApi postApi;

  String responseText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postApi = PostApi(dio);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            postApi.getPosts().then((value) {
              print(value);
              setState(() {
                responseText = value.data.toString();
              });
            });
          },
          child: Text("Retrofit GET "),
        ),
        ElevatedButton(
          onPressed: () {
            postApi.postPost({
              'title': "foo",
              'body': "bar",
              "userId": 1,
            }).then((value) {
              print(value.response.statusCode);
              setState(() {
                responseText = value.data.toString();
              });
            });
          },
          child: Text("Retrofit POST"),
        ),
        ElevatedButton(
          onPressed: () {
            postApi.putPost("1", {
              'title': "foo",
              'body': "bar",
              "userId": 1,
            }).then((value) {
              print(value.response.statusCode);
              setState(() {
                responseText = value.data.toString();
              });
            });
          },
          child: Text("Retrofit PUT"),
        ),
        ElevatedButton(
          onPressed: () {
            postApi.deletePost("1").then((value) {
              print(value.response.statusCode);
              setState(() {
                responseText = value.data.toString();
              });
            });
          },
          child: Text("Retrofit DELETE"),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Text(responseText),
        ))
      ],
    );
  }
}
