import 'package:dio/dio.dart';
import 'package:ff/services/keys.dart';
import 'package:http/http.dart' as http;

Future<void> CategoryPlaylistsService(String categoryId) async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer '+token,
  };

  var params = {
    'country': 'TR',
    'limit': '11',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = 'https://api.spotify.com/v1/browse/categories/$categoryId/playlists?$query';
  var res = await Dio().get(url, options: Options(headers: headers));
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.data);
}