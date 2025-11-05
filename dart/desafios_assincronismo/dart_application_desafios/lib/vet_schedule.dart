import 'dart:convert';
import 'package:http/http.dart';

//Aula 2 : Buscar veterinário e agendar consultas
Future<void> fetchVetAndSchedule(String veterinarian) async {
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
