import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:main/api_key.dart';

StreamController<String> streamController = StreamController<String>();
void main() {
  StreamSubscription streamSubscription = streamController.stream.listen((
    String info,
  ) {
    print('Event: $info');
  });
  requestDataAsync();
  requestData();
  sendDataAsync({
    "id": "ID001NEW",
    "name": "Erick",
    "lastName": "Santos",
    "balance": 5000,
  });
}

void requestData() {
  String url =
      'https://gist.githubusercontent.com/ericksants/56161ef65fa6d4852b25fa244e31bddf/raw/b767d4d5db034a478c25036591426f3d082c9ed7/accounts.json';
  Future<Response> response = get(Uri.parse(url));
  response.then((Response response) {
    streamController.add("${DateTime.now()} | Requisição com Future");
  });
}

Future<List<dynamic>> requestDataAsync() async {
  String url =
      'https://gist.githubusercontent.com/ericksants/56161ef65fa6d4852b25fa244e31bddf/raw/b767d4d5db034a478c25036591426f3d082c9ed7/accounts.json';
  Response response = await get(Uri.parse(url));
  streamController.add("${DateTime.now()} | Requisição Assíncrona");
  return json.decode(response.body);
}

Future sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccounts = await requestDataAsync();
  listAccounts.add(mapAccount);
  String content = json.encode(listAccounts);

  String url = 'https://api.github.com/gists/56161ef65fa6d4852b25fa244e31bddf';

  Response response = await post(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer $apiKey'},
    body: jsonEncode({
      "description": "accounts.json",
      "public": true,
      "files": {
        "accounts.json": {"content": content},
      },
    }),
  );

  if (response.statusCode.toString()[0] == "2") {
    streamController.add(
      "${DateTime.now()} | Requisição adição bem sucedida (${mapAccount["name"]}).",
    );
  } else {
    streamController.add(
      "${DateTime.now()} | Requisição falhou (${mapAccount["name"]}).",
    );
  }
}
