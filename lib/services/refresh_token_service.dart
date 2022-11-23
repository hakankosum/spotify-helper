import 'package:http/http.dart' as http;

void RefreshTokenService() async {
  String CLIENTID="92bac5a6a90b4824bd0e876d913dcf6f";
  String CLIENTSECRET="1d9d2f01f39c4ba5b98bbc57143f71b7";
  const String CODE="3144c3fuoc42jgdwd6ivtbbgn52e";


  var url = Uri.parse('http://application/x-www-form-urlencoded --data “code='+CODE);
  var res = await http.post(url);
  if (res.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
  print(res.body);
}