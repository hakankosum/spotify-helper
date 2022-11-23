import 'package:ff/services/keys.dart';
import 'package:http/http.dart' as http;

Future<void> SearchArtistService(String artistName) async {
  String marketCountry="TR";
  int queryItemLimit=4;
  String queryType="artist"; //query selection (must be "artist" or "track")
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer '+token,
  };

  var params = {
    'q': artistName,
    'type': queryType,
    'market': marketCountry,
    'limit': queryItemLimit,
    'offset': '5',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url =  Uri.parse('https://api.spotify.com/v1/search?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
}