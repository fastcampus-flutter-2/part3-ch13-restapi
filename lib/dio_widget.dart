import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'main.dart';

class DioWidget extends StatefulWidget {
  const DioWidget({super.key});

  @override
  State<DioWidget> createState() => _DioWidgetState();
}

class _DioWidgetState extends State<DioWidget> {
  String respText = "";

  Dio dio = Dio(
    BaseOptions(
      headers: {
        "content-type": "application/json",
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            dio.get(api).then((value) {
              print(value.data);
              setState(() {
                respText = value.data;
              });
            });
          },
          child: Text("Dio GET"),
        ),
        TextButton(
          onPressed: () {
            dio.post(
              api,
              data: {
                "title": "foo",
                "body": 'bar',
                "userId": 1,
              },
            ).then((response) {
              print(response.statusCode);
              setState(() {
                respText = response.data.toString();
              });
            });
          },
          child: Text("Dio POST"),
        ),
        TextButton(
          onPressed: () {
            dio.putUri(
              Uri.parse("$api/1"),
              data: {
                "title": "foo",
                "body": 'bar',
                "userId": 1,
              },
            ).then((value) {
              setState(() {
                respText = value.data.toString();
              });
            });
          },
          child: Text("Dio PUT"),
        ),
        TextButton(
          onPressed: () {
            try {
              dio.delete("$api/sd123/1");
            } on DioException catch (error) {
              print(error.toString());
            }
          },
          child: Text("Dio DELETE"),
        ),
        Divider(),
        Expanded(
            child: SingleChildScrollView(
          child: Text(respText),
        ))
      ],
    );
  }
}
