import 'dart:convert';
import 'package:http/http.dart';

//Aula 2 : Buscar livros de um autor específico
Future<void> booksForAuthor(String author) async {
  String apiUrl =
      'https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/books.json';

  try {
    Response response = await get(Uri.parse(apiUrl));
    List<dynamic> listBooks = json.decode(response.body);
    List<dynamic> booksByAuthor = listBooks
        .where((book) => book["author"].contains(author))
        .toList();

    for (dynamic book in booksByAuthor) {
      print("Título: ${book["title"]}");
    }
  } catch (error) {
    print('Erro ao buscar livros: $error');
  }
}
