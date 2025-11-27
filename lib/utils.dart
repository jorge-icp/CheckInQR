import 'package:http/http.dart' as http;

Future<String> fetchHook(String _valor,[String _URI='https://ivan.contrerasmx.com/url/']) async {
  final response = await http.get(
    Uri.parse(_URI+_valor),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}