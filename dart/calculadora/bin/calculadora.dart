import 'dart:io';

void main() {
  double parametroUm = 0;
  double parametroDois = 0;
  String operacao = '';
  String? entrada;
  List<String> operacoesValidas = <String>['+', '-', '*', '/'];

  void soma() {
    print(parametroUm + parametroDois);
  }

  void subtracao() {
    print(parametroUm - parametroDois);
  }

  void multiplicacao() {
    print(parametroUm * parametroDois);
  }

  void divisao() {
    print(parametroUm / parametroDois);
  }

  void calcular() {
    switch (operacao) {
      case '+':
        soma();
        break;
      case '-':
        subtracao();
        break;
      case '*':
        multiplicacao();
        break;
      case '/':
        divisao();
        break;
      default:
        print('Operação inválida');
    }
  }

  void getOperacao() {
    print('Digite uma operação ${operacoesValidas.toString()}:');
    entrada = stdin.readLineSync();
    if (entrada != null) {
      if (operacoesValidas.contains(entrada)) {
        operacao = entrada!;
      }else {
        print('Operação inválida, tente novamente.');
        getOperacao();
      }
    }
  }

  print('Digite o primeiro número:');
  entrada = stdin.readLineSync();
  if (entrada != null) {
    if (entrada != '') {
      parametroUm = double.parse(entrada!);
    }
  }

  getOperacao();
  
  print('Digite o segundo número:');
  entrada = stdin.readLineSync();
  if (entrada != null) {
    if (entrada != '') {
      parametroDois = double.parse(entrada!);
    }
  }

  calcular();
}
