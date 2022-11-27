import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ff/models/top_tracks_model.dart';
import 'package:ff/services/keys.dart';
import 'package:http/http.dart' as http;

Future<TopTracksModel> GetTopTracksService(String id) async {
  TopTracksModel? data;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer '+token,
  };

  var params = {
    'market': 'TR',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = 'https://api.spotify.com/v1/artists/$id/top-tracks?$query';
  var res = await Dio().get(url, options: Options(headers: headers));
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  data = TopTracksModel.fromJson(res.data);
  return data;
}