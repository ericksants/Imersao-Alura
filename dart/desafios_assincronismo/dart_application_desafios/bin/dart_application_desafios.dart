import 'package:dart_application_desafios/vet_schedule.dart';
import 'package:dart_application_desafios/fetch_recipes.dart';
import 'package:dart_application_desafios/books_for_author.dart';
import 'package:dart_application_desafios/volleyball_teams.dart';
import 'package:dart_application_desafios/fetch_recipes_with_ingredient.dart';

void main() async {
  print('Hello, Dart Application Desafios!');
  // Exemplo de chamadas - descomente para testar cada função
  //await fetchRecipes();
  //await booksForAuthor('José');
  await fetchRecipesWithIngredient(['molho de tomate']);
  //await organizeVolleyballTeams();
  //await fetchVetAndSchedule("Dra. Patrícia Gomes");
}
