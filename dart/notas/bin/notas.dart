import 'dart:io';

void main() {
  List<String> notas = <String>[];
  menu(notas);
}

String getComando() {
  print('Digite um comando: 1 - Adicionar nota, 2 - Listar notas, 3 - Sair');
  List<String>? comandos = <String>['1', '2', '3'];
  String? entrada = '';
  
  entrada = stdin.readLineSync();

  if (entrada == null || !comandos.contains(entrada)) {
    print('Comando inválido. Tente novamente.');
    getComando(); 
  }
  return entrada!;
}

List<String> adicionarNota(List<String> notas) {
  print('Digite a nota que deseja adicionar:');
  String? nota = '';
  nota = stdin.readLineSync();
  if (nota == null || nota.isEmpty) {
    print('Nota inválida. Tente novamente.');
    adicionarNota(notas);
  } 
  print('Nota adicionada com sucesso!');
  notas.add(nota!);

  return notas;
}

void listarNotas(List<String> notas) {
  print('Suas notas são:');
  for (var i = 0; i < notas.length; i++) {
    print('- ${notas[i]}');
  }
}

void menu(List<String> notas) {
  print('');
  cabecalho(); // Limpa o console
  print('');
  String comando = getComando();
  print('');
  switch (comando) {
    case '1':
      adicionarNota(notas);
      menu(notas);
    case '2':
      listarNotas(notas);
      menu(notas);
    case '3':
      print('Saindo do programa. Até mais!');  
  }
}

void cabecalho() {
  print("    _   __      __            ");
  print("   / | / /___  / /_____ ______");
  print("  /  |/ / __ \\/ __/ __ \`/ ___/");
  print(" / /|  / /_/ / /_/ /_/ (__  ) ");
  print("/_/ |_/\\____/\\__/\\__,_/____/  ");
  print("                              ");                      
}

