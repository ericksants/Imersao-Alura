import 'package:main/models/transaction.dart';
import 'package:main/screens/account_screen.dart';
import 'package:main/services/transaction_service.dart';

void main() {
  // AccountScreen accountScreen = AccountScreen();
  // accountScreen.initializeStream();
  // accountScreen.runChatBot();

  TransactionService transactionService = TransactionService();
  transactionService.makeTransaction('1', '2', 7000);
}
