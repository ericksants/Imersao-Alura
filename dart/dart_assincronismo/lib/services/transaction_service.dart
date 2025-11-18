import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';
import 'package:main/api_key.dart';
import 'package:main/models/account.dart';
import 'package:main/models/transaction.dart';
import 'package:main/helpers/helper_taxes.dart';
import 'package:main/services/account_service.dart';

class TransactionService {
  final StreamController<String> _streamController = StreamController<String>();
  Stream<String> get streamInfos => _streamController.stream;

  // Usamos o mesmo Gist; armazenaremos em "transactions.json" dentro dele.
  String url = 'https://api.github.com/gists/56161ef65fa6d4852b25fa244e31bddf';

  Future<List<Transaction>> getAll() async {
    Response response = await get(Uri.parse(url));
    _streamController.add(
      "${DateTime.now()} | Requisição Assíncrona (transactions)",
    );

    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> listDynamic = json.decode(
      mapResponse["files"]["transactions.json"]["content"],
    );

    List<Transaction> listTransactions = [];

    for (dynamic dyn in listDynamic) {
      Map<String, dynamic> mapTx = dyn as Map<String, dynamic>;
      Transaction tx = Transaction.fromMap(mapTx);
      listTransactions.add(tx);
    }
    return listTransactions;
  }

  Future<void> save(List<Transaction> listTransactions, {String? note}) async {
    List<Map<String, dynamic>> listContent = [];
    for (Transaction tx in listTransactions) {
      listContent.add(tx.toMap());
    }

    String content = json.encode(listContent);

    Response response = await post(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $apiKey'},
      body: jsonEncode({
        "description": "transactions.json",
        "public": true,
        "files": {
          "transactions.json": {"content": content},
        },
      }),
    );

    if (response.statusCode.toString()[0] == "2") {
      _streamController.add(
        "${DateTime.now()} | Requisição gravação transações bem sucedida (${note ?? ''}).",
      );
    } else {
      _streamController.add(
        "${DateTime.now()} | Requisição gravação transações falhou (${note ?? ''}).",
      );
    }
  }

  Future<void> addTransaction(Transaction transaction) async {
    List<Transaction> listTransactions = await getAll();
    listTransactions.add(transaction);
    await save(listTransactions, note: transaction.id);
  }

  /// Executa a transação entre duas contas.
  /// Retorna o objeto Transaction criado em caso de sucesso, ou null em caso de
  /// contas não encontradas ou saldo insuficiente.
  Future<Transaction?> makeTransaction(
    String senderId,
    String receiverId,
    double amount,
  ) async {
    final accountService = AccountService();

    // Carrega todas as contas
    List<Account> accounts = await accountService.getAll();

    Account? sender;
    Account? receiver;
    try {
      sender = accounts.firstWhere((a) => a.id == senderId);
    } catch (_) {
      sender = null;
    }
    try {
      receiver = accounts.firstWhere((a) => a.id == receiverId);
    } catch (_) {
      receiver = null;
    }

    if (sender == null || receiver == null) {
      // contas não existem
      return null;
    }

    // Calcula taxa com base na conta do remetente
    final taxes = calculateTaxesByAccount(
      senderAccount: sender,
      amount: amount,
    );

    // Verifica saldo disponível
    if (sender.balance < amount + taxes) {
      return null;
    }

    // Atualiza saldos nas contas (em memória)
    sender.balance -= amount - taxes;
    receiver.balance += amount;

    // Salva lista de contas usando o AccountService (reaproveita o save)
    await accountService.save(accounts, addedAccountName: sender.name);

    // Cria o registro da transação
    final tx = Transaction(
      id: Uuid().v1(),
      senderAccountId: sender.id,
      receiverAccountId: receiver.id,
      amount: amount,
      date: DateTime.now(),
      taxes: taxes,
    );

    // Adiciona o registro de transação
    await addTransaction(tx);

    return tx;
  }
}
