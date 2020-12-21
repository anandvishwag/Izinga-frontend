import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "http://across.life2grow.com/api";
  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(fullUrl, body: data, headers: _serHeaders());
  }

  getData(apiUrl, headers) async {
    var fullUrl = _url + apiUrl;
    return await http.get(fullUrl, headers: headers);
  }

  _serHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
