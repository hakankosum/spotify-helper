import 'package:http/http.dart' as http;

Future<void> SearchArtistService(String artistName) async {
  String marketCountry="TR";
  int queryItemLimit=4;
  String queryType="track"; //query selection (must be "artist" or "track")
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQDz1ViPYbh3LNyyQFvcCsw2_AoKtSfYiCKd_aDgyPA8Ze6eqxpXjHJQjxQtZG4EJsMgAJMX5NFCReTN-IBl_vBI3J6ZiShP_HBWjOaW4PnstEYLvhyCbEdb0QC9C13OmnaAcMp6dx-tj_KiUpz7zKPNLd_n-4wDH54rGXxpph6is7a-L6A6K9MyPzbk5aO0r8JDa2oNPzx5WmdKt1YOKFYuqFeppLZC9SR5ydOCYIaExoR3oyzsxMT2bc5Y5dpsVHtjXl1gQyK8BCOkr0gzqxD4TdTZrGuJMNzKW5hQ_lkU',
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