import 'package:main/models/account.dart';

void main() {
  final map = {'id': '1', 'name': 'A', 'lastName': 'B', 'balance': 123};
  final acc = Account.fromMap(map);
  print(acc);
}
