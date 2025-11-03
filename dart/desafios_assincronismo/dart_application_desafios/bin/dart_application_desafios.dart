import 'dart:convert';
import 'package:http/http.dart';

void main() async {
  print('Hello, Dart Application Desafios!');
  // await fetchRecipes();
  // booksForAuthor('José');
  //await fetchRecipesWithIngredient('molho de tomate');
  // organizeVolleyballTeams();
  fetchVetAndSchedule("Dra. Patrícia Gomes");
}

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

//Aula 2 : Filtrar receitas por ingrediriente
Future<void> fetchRecipesWithIngredient(List listIngredients) async {
  String url =
      "https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/recipes.json";
  Response response = await get(Uri.parse(url));
  List<dynamic> listRecipes = json.decode(response.body);

  List<String> listPossibleRecipes = [];

  for (dynamic recipeDyn in listRecipes) {
    Map<String, dynamic> recipe = recipeDyn as Map<String, dynamic>;
    List<dynamic> recipeIngredients = recipe["ingredients"];

    bool containsAllIngredients = listIngredients.every((ingredient) {
      bool isContainsIngredient = false;
      for (String recipeIngredient in recipeIngredients) {
        if (recipeIngredient.toLowerCase().contains(ingredient.toLowerCase())) {
          isContainsIngredient = true;
          break;
        }
      }
      return isContainsIngredient;
    });

    if (containsAllIngredients) {
      listPossibleRecipes.add(recipe["name"]);
    }
  }

  for (String recipe in listPossibleRecipes) {
    print("Receita: $recipe");
  }
}

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

//Aula 2 : Organizando times de vôlei por nível de habilidade
Future<void> organizeVolleyballTeams() async {
  // Implementação futura
  String apiUrl =
      "https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/players.json";

  try {
    Response response = await get(Uri.parse(apiUrl));
    Map<String, dynamic> mapPlayers = json.decode(response.body);
    int playersPerTeam = mapPlayers["rules"]["playersPerTeam"];

    List<dynamic> listPlayers = mapPlayers["players"];

    listPlayers.sort(
      (a, b) => (b["roundsWaiting"] as int).compareTo(a["roundsWaiting"]),
    );

    List<dynamic> listFirstTeam = listPlayers.sublist(0, playersPerTeam);
    List<dynamic> listSecondTeam = listPlayers.sublist(
      playersPerTeam,
      playersPerTeam * 2,
    );

    print("**Time A**");
    for (Map<String, dynamic> person in listFirstTeam) {
      print(person["name"]);
    }

    print("\n**Time B**");
    for (Map<String, dynamic> person in listSecondTeam) {
      print(person["name"]);
    }

    // Lógica para organizar os times de vôlei
  } catch (error) {
    print('Erro ao buscar jogadores: $error');
  }
}

//Aula 2 : Buscar veterinário e agendar consultas
fetchVetAndSchedule(String veterinarian) async {
  String url =
      "https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/vet.json";
  Response response = await get(Uri.parse(url));

  List<dynamic> listAppointments = json.decode(response.body);

  List<dynamic> vetAppointments = listAppointments
      .where((appointment) => appointment["veterinarian"] == veterinarian)
      .toList();

  vetAppointments.sort(
    (a, b) => DateTime.parse(
      a["appointment"],
    ).compareTo(DateTime.parse(b["appointment"])),
  );

  print("Consultas Agendadas para $veterinarian:");
  for (Map<String, dynamic> appointment in vetAppointments) {
    print(
      "Pet: ${appointment["pet_name"]} - Horário: ${appointment["appointment"]}",
    );
  }
}
