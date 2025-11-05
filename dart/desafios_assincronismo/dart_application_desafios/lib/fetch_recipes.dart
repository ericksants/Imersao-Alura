import 'package:http/http.dart';

//Aula 1 : Buscar receitas de uma API pública
Future<void> fetchRecipes() async {
  String apiUrl =
      'https://gist.githubusercontent.com/ericksants/faf3cdd0da13b974c75fdcd87d1f399a/raw/bc4ead218611f994d32d6502e0eae4767f700ce4/recipes.json';

  try {
    Response response = await get(Uri.parse(apiUrl));
    print(response.body);
  } catch (error) {
    print('Erro ao buscar receitas: $error');
  }
}
