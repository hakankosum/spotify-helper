import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ff/models/categories_model.dart';
import 'package:ff/services/keys.dart';
import 'package:http/http.dart' as http;

Future<CategoriesModel?> GetCategoriesService() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer '+token,
  };

  var params = {
    'country': 'TR',
    'limit': '8',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  try {
    CategoriesModel data;
    var url =
        'https://api.spotify.com/v1/browse/categories?$query';
    var res = await Dio().get(url,options: Options(headers: headers));


    data = CategoriesModel.fromJson(res.data);
    return data;
  } catch (e) {
    print(e.toString());
    
  }
}
