import 'package:main/models/account.dart';
import 'package:main/helpers/helper_taxes.dart';

void main() {
  final aAmb = Account(
    id: '1',
    name: 'Ana',
    lastName: 'A',
    balance: 10000.0,
    accountType: 'Ambrosia',
  );
  final aCan = Account(
    id: '2',
    name: 'Beto',
    lastName: 'B',
    balance: 10000.0,
    accountType: 'Canjica',
  );
  final aPud = Account(
    id: '3',
    name: 'Cris',
    lastName: 'C',
    balance: 10000.0,
    accountType: 'Pudim',
  );
  final aBrg = Account(
    id: '4',
    name: 'Dani',
    lastName: 'D',
    balance: 10000.0,
    accountType: 'Brigadeiro',
  );

  print(
    'Ambrosia tax (6000): ${calculateTaxesByAccount(senderAccount: aAmb, amount: 6000)}',
  );
  print(
    'Canjica tax (6000): ${calculateTaxesByAccount(senderAccount: aCan, amount: 6000)}',
  );
  print(
    'Pudim tax (6000): ${calculateTaxesByAccount(senderAccount: aPud, amount: 6000)}',
  );
  print(
    'Brigadeiro tax (6000): ${calculateTaxesByAccount(senderAccount: aBrg, amount: 6000)}',
  );
  print(
    'Below threshold (5000): ${calculateTaxesByAccount(senderAccount: aAmb, amount: 5000)}',
  );
}
