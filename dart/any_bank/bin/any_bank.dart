import 'package:any_bank/conta.dart';

void main() {
  ContaCorrente contaLucas = ContaCorrente('Lucas', 2000.00);
  ContaPoupanca contaRoberto = ContaPoupanca('Roberto', 2000.00);
  ContaSalario contaAna = ContaSalario('Ana', 3000.00);

  contaAna.depositarSalario(3500.00);
  contaAna.saldoAtual();
}
