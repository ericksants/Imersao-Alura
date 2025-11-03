import 'dart:convert';
import 'package:http/http.dart';

void main() {
  print('Hello, World!');
  // requestData();
  requestDataAsync();
}

void requestData() {
  String url =
      'https://gist.githubusercontent.com/ericksants/56161ef65fa6d4852b25fa244e31bddf/raw/b767d4d5db034a478c25036591426f3d082c9ed7/accounts.json';
  Future<Response> response = get(Uri.parse(url));
  response.then((Response response) {
    print(response.body);
    json.decode(response.body);
    List<dynamic> listAccounts = json.decode(response.body);
    Map<String, dynamic> account = listAccounts.firstWhere(
      (element) => element["name"] == "Carla",
    );
    print(account['balance']);
  });
}

requestDataAsync() async {
  String url =
      'https://gist.githubusercontent.com/ericksants/56161ef65fa6d4852b25fa244e31bddf/raw/b767d4d5db034a478c25036591426f3d082c9ed7/accounts.json';
  Response response = await get(Uri.parse(url));
  print(jsonDecode(response.body)[0]);
}
