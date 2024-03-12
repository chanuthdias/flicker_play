import 'dart:convert';

import 'package:http/http.dart' as http;

String baseUrl = "https://api.themoviedb.org/3";

class ApiServices {
  var client = http.Client();
  Future<Map<String, dynamic>> get({required String apiEndPoint}) async {
    var url = Uri.parse(baseUrl + apiEndPoint);
    var _headers = {
      'accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNjA5YzkxNmJkM2UxOGVmYzEwOWRjOTU1OWRiNGE3MiIsInN1YiI6IjY1YWQ1OTZmMTU4Yzg1MDEwYTlmOGU5YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.A1fkVLDMYr8G9gFiJ1amhYivRD78P_NJ3DTC0r8zsnI'
    };
    var response = await client.get(url, headers: _headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Some Error Occured");
    }
    return {};
  }
}
