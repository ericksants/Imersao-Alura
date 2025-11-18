import 'package:main/models/account.dart';
import 'package:main/services/account_service.dart';

void main() {
  final accounts = [
    Account(
      id: '1',
      name: 'Maria',
      lastName: 'Silva',
      balance: 10.0,
      accountType: 'Pudim',
    ),
    Account(
      id: '2',
      name: 'João',
      lastName: 'Souza',
      balance: 20.0,
      accountType: 'Canjica',
    ),
    Account(
      id: '3',
      name: 'maria',
      lastName: 'Oliveira',
      balance: 30.0,
      accountType: 'Brigadeiro',
    ),
    Account(
      id: '4',
      name: 'Mariana',
      lastName: 'Pereira',
      balance: 40.0,
      accountType: 'Ambrosia',
    ),
  ];

  final result = AccountService.filterByName(accounts, 'maria');
  print('Encontradas: ${result.length} contas');
  for (var a in result) {
    print(a);
  }
}
