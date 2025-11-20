import 'package:main/models/account.dart';

double calculateTaxesByAccount({
  required Account sender,
  required double amount,
}) {
  // Regra: apenas valores estritamente maiores que 5000 têm taxa
  if (amount <= 5000) return 0.0;

  final type = (sender.accountType ?? '').toLowerCase().trim();
  if (type == 'ambrosia') return amount * 0.005;
  if (type == 'canjica') return amount * 0.0033;
  if (type == 'pudim') return amount * 0.0025;
  if (type == 'brigadeiro') return amount * 0.0001;

  // tipo desconhecido: sem taxa
  return 0.0;
}
