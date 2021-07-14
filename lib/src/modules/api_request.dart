import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ApiRequest with ChangeNotifier {
  final String _baseUrl = "ec2-18-218-142-37.us-east-2.compute.amazonaws.com:4000";
  var _response;
  Logger logger = Logger();

  Future<void> getDataByDate() async {
    Uri _uri = Uri.http(
      _baseUrl,
      "/api/review/listbydate"
    );

    _response = await http.get(_uri, headers: {'startdate':'2021-03-01', 'enddate':'2021-06-01'});
    logger.i(_response.body);
  }
}