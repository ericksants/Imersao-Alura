import 'dart:convert';
import 'package:http/http.dart';

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
