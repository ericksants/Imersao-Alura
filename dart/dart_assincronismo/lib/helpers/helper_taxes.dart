import 'package:main/models/account.dart';

/// Calcula as taxas aplicáveis para uma transação de `amount` feita pela
/// conta `account`.
///
/// Regras:
/// - Retorna 0.0 se `amount` for menor ou igual a 5000.
/// - Para valores acima de 5000, aplica a taxa conforme o `account.accountType`:
///   - Ambrosia: 0.5% (0.005)
///   - Canjica: 0.33% (0.0033)
///   - Pudim: 0.25% (0.0025)
///   - Brigadeiro: 0.01% (0.0001)
double calculateTaxesByAccount(Account account, double amount) {
  if (amount <= 5000) return 0.0;

  final type = account.accountType.toLowerCase().trim();
  double rate;

  switch (type) {
    case 'ambrosia':
      rate = 0.005; // 0.5%
      break;
    case 'canjica':
      rate = 0.0033; // 0.33%
      break;
    case 'pudim':
      rate = 0.0025; // 0.25%
      break;
    case 'brigadeiro':
      rate = 0.0001; // 0.01%
      break;
    default:
      rate = 0.0; // tipo desconhecido: sem taxa
  }

  return amount * rate;
}
