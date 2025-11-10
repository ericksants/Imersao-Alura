import 'dart:convert';
import 'package:http/http.dart';
import 'package:dart_application_desafios/api_key.dart';

void main() {
  // Importe as bibliotecas necessárias.
  // Defina a função assíncrona sendProduct utilizando async.
  // Realize a requisição HTTP usando o método POST.
  // Codifique os dados a serem enviados no formato JSON usando json.encode().
  // Crie uma chave de API do GIST, caso não tenha, e configure-a no cabeçalho do POST.
  // Adicione o corpo da requisição (body) com os dados codificados.
  // Imprima a resposta da API.

  Map<String, dynamic> newProduct = {
    "id": 4,
    "name": "Monitor",
    "price": 800.00,
  };
  sendProduct(newProduct);
}

Future<void> sendProduct(Map<String, dynamic> product) async {
  Uri url = Uri.parse('SUA_URL_GIST_AQUI');

  Response response = await post(
    url,
    body: json.encode({
      "description": "products.json",
      "public": true,
      "files": {
        "products.json": {"content": json.encode(product)},
      },
    }),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
  );

  if (response.statusCode == 200) {
    print('Produto enviado com sucesso!');
  } else {
    print('Erro ao enviar produto: ${response.statusCode}');
  }
}
