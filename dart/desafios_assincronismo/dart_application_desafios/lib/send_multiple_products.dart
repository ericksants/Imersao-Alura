import 'dart:convert';
import 'package:http/http.dart';
import 'package:dart_application_desafios/api_key.dart';

void main() {
  // Importe as bibliotecas necessárias.
  // Defina a função assíncrona sendMultipleProducts utilizando async.
  // Realize a requisição HTTP usando o método POST.
  // Codifique os dados a serem enviados no formato JSON usando json.encode().
  // Adicione o cabeçalho Authorization com o token de autenticação.
  // Adicione o corpo da requisição (body) com os dados codificados.
  // Para a chave "description" utilize o nameList recebido por parâmetro.
  // Para a chave contendo o nome do arquivo, crie um nome que não tenha letras maísculas e espaços usando .toLowerCase().replaceAll(" ", "").
  // Imprima a resposta da API.
  var newProducts = [
    {"id": 5, "name": "Teclado", "price": 200.00},
    {"id": 6, "name": "Mouse", "price": 100.00},
  ];
  sendMultipleProducts(newProducts, "Periféricos");
}

Future<void> sendMultipleProducts(
  List<Map<String, dynamic>> products,
  String nameList,
) async {
  Uri url = Uri.parse('SUA_URL_GIST_AQUI');

  String content = json.encode(products);

  Response response = await post(
    url,
    body: json.encode({
      "description": nameList,
      "public": true,
      "files": {
        "${nameList.toLowerCase().replaceAll(" ", "")}.json": {
          "content": content,
        },
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
