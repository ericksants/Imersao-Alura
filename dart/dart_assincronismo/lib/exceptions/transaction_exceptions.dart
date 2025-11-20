import 'package:main/models/account.dart';

class SenderNotExistsException implements Exception {
  final String message;
  SenderNotExistsException({this.message = 'Sender account does not exist.'});
}

class ReceiverNotExistsException implements Exception {
  final String message;
  ReceiverNotExistsException({
    this.message = 'Receiver account does not exist.',
  });
}

class InsufficientBalanceException implements Exception {
  String message;
  Account cause;
  double amount;
  double taxes;

  InsufficientBalanceException({
    this.message = 'Insufficient balance for this transaction.',
    required this.cause,
    required this.amount,
    required this.taxes,
  });
}
