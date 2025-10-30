import 'package:http/http.dart';

void main() {
  print('Hello, World!');
  requestData();
}

requestData() {
  String url =
      'https://gist.githubusercontent.com/ericksants/56161ef65fa6d4852b25fa244e31bddf/raw/b767d4d5db034a478c25036591426f3d082c9ed7/accounts.json';
  Future<Response> response = get(Uri.parse(url));
  response.then((Response response) {
    print(response.body);
  });
}
