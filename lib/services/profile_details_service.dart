import 'dart:convert';

import 'package:ff/models/profile_playlists_model.dart';
import 'package:ff/services/keys.dart';
import 'package:http/http.dart' as http;

import '../models/profile_detail_model.dart';

Future<ProfileDetailModel> ProfileDetailService() async {
  ProfileDetailModel data;
  

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var url = Uri.parse('https://api.spotify.com/v1/users/00f732s8mb75vdxjwp91mc8j6');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
  data = ProfileDetailModel.fromJson(jsonDecode(res.body));
  return data;
}
