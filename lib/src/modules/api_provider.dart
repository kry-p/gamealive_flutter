import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

class ApiProvider with ChangeNotifier {
  final String _baseUrl = "ec2-18-218-142-37.us-east-2.compute.amazonaws.com:4000";
  Logger logger = Logger();

  Future<void> getDataByDate(String startDate, String endDate, int page) async {
    Uri _uri = Uri.http(
      _baseUrl,
      "/api/review/listbydate",
        {'startdate':startDate, 'enddate':endDate, 'pages': page.toString()}
    );

    var _response = await http.get(_uri);
    return json.decode(_response.body);
  }

  Future<void> getDataByKeyword(String keyword) async {
    Uri _uri = Uri.http(
        _baseUrl,
        "/api/review/listbykeyword",
        {'keyword': keyword}
    );

    var _response = await http.get(_uri);
    return json.decode(_response.body);
  }
}