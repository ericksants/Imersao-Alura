import 'dart:convert';

void main() {
  //   Importe a biblioteca dart:convert.
  // Decodifique a string JSON usando json.decode().
  // Adicione a nova entrada na lista.
  // Codifique a lista de volta para JSON usando json.encode().
  // Imprima o JSON atualizado.
  String responseBody = '''
  [
    {"id": 1, "name": "Celular", "price": 1200.75},
    {"id": 2, "name": "Notebook", "price": 3500.10},
    {"id": 3, "name": "Tablet", "price": 1500.00}
  ]
  ''';

  // Decodifica a string JSON para uma lista de mapas
  List<dynamic> products = json.decode(responseBody);

  // Adiciona uma nova entrada na lista
  Map<String, dynamic> newProduct = {
    "id": 4,
    "name": "Monitor",
    "price": 800.00,
  };
  products.add(newProduct);

  // Codifica a lista de volta para JSON
  String updatedJson = json.encode(products);

  print(updatedJson);
}
