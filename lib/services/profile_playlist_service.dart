import 'dart:convert';

import 'package:ff/models/profile_playlists_model.dart';
import 'package:ff/services/keys.dart';
import 'package:http/http.dart' as http;

Future<ProfilePlaylistsModel> ProfilePlaylistService() async {
  ProfilePlaylistsModel data;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer '+token,
  };

  var params = {
    'limit': '10',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse(
      'https://api.spotify.com/v1/users/00f732s8mb75vdxjwp91mc8j6/playlists?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200)
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
  data = ProfilePlaylistsModel.fromJson(jsonDecode(res.body));
  return data;
}
