import 'dart:convert';

import 'package:ff/models/new_realese_model.dart';
import 'package:ff/services/keys.dart';
import 'package:http/http.dart' as http;

Future<GetNewRealeseModel?> GetNewRealeseService() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': "Bearer " + token,
  };

  var params = {
    'country': 'TR',
    'limit': '8',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  try {
    GetNewRealeseModel data;
    var url =
        Uri.parse('https://api.spotify.com/v1/browse/new-releases?$query');
    var res = await http.get(url, headers: headers);

    data = GetNewRealeseModel.fromJson(jsonDecode(res.body));
    return data;
  } catch (e) {
    print("new realese hata");
    throw e;
  }
}
