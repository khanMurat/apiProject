import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Network {
  Network._init();

  static final Network _instance = Network._init();
  static Network get instance => _instance;

  // Future<dynamic> getData() async {
  //   http.Response response = await http.get(
  //     Uri.https('www.episodate.com', '/api/most-popular?page=1'),
  //   );
  //   final data =
  //       convert.jsonDecode(convert.utf8.decode(response.bodyBytes))['tv_shows'];
  //   print(data);
  // }

  Future<dynamic> getData() async {
    http.Response response = await http.get(
      Uri.parse('https://www.episodate.com/api/most-popular?page=1'),
    );
    final data = convert.jsonDecode(response.body)['tv_shows'];
    print(data);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
