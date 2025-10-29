import 'package:any_bank/any_bank.dart';
import 'package:test/test.dart';

void main() {
  group('ContaCorrente - operações bancárias', () {
    late ContaCorrente conta;
    const saldoInicial = 1000.0;

    setUp(() {
      conta = ContaCorrente('João', saldoInicial);
    });

    test('deve criar conta com titular e saldo inicial corretos', () {
      expect(conta.titular, equals('João'));
      expect(conta.saldo, equals(saldoInicial));
    });

    test('deve receber valor e aumentar saldo', () {
      conta.receberValor(250.0);
      expect(conta.saldo, equals(saldoInicial + 250.0));
    });

    test('deve enviar valor com saldo suficiente e diminuir saldo', () {
      conta.enviarValor(400.0);
      expect(conta.saldo, equals(saldoInicial - 400.0));
    });

    test('não deve enviar valor se saldo insuficiente', () {
      conta.enviarValor(2000.0);
      expect(conta.saldo, equals(saldoInicial));
    });

    test('deve realizar múltiplas operações corretamente', () {
      conta.receberValor(100.0);
      conta.enviarValor(50.0);
      conta.receberValor(200.0);
      expect(conta.saldo, equals(saldoInicial + 100.0 - 50.0 + 200.0));
    });
  });
}
