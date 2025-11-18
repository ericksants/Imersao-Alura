import 'dart:io';
import 'dart:async';
import 'package:uuid/uuid.dart';
import 'package:main/models/account.dart';
import 'package:main/services/account_service.dart';

class AccountScreen {
  final AccountService _accountService = AccountService();

  void initializeStream() {
    _accountService.streamInfos.listen((info) {
      print('Event: $info');
    });
  }

  void runChatBot() async {
    print("Bom dia! Como posso ajudar?");
    print("Que bom te ver por aqui");

    bool isRunning = true;
    while (isRunning) {
      print("Como eu posso ajudar você hoje? (digite o número desejado)");
      print("1 - Ver todas as contas");
      print("2 - Adicionar nova conta");
      print("3 - Buscar por nome\n");
      print("4 - Sair");

      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case "1":
            {
              await _getAllAccounts();
              break;
            }
          case "2":
            {
              print("Qual o nome completo da pessoa?");
              String? name = stdin.readLineSync();
              if (name != null) {
                print("Qual o saldo inicial da conta?");
                String? balanceString = stdin.readLineSync();
                if (balanceString != null &&
                    double.tryParse(balanceString) != null) {
                  await _addAccount(name, double.parse(balanceString));
                }
              }
              break;
            }
          case "3":
            {
              await _searchByName();
              break;
            }
          case "4":
            {
              isRunning = false;
              print("Encerrando o chatbot. Até mais!");
              break;
            }

          default:
            {
              print("Não entendi. Tente novamente.");
            }
        }
      }
    }
  }

  Future<void> _getAllAccounts() async {
    try {
      List<Account> listAccounts = await _accountService.getAll();
      print(listAccounts);
    } on FormatException catch (e) {
      print("O formato dos dados recebidos não é válido: ${e.message}");
    } on TimeoutException catch (e) {
      print(
        "A tentativa de conexão com o servidor de autenticação excedeu o tempo limite: ${e.message}",
      );
    } on Exception {
      print("Erro ao obter contas.");
      print("Tente novamente mais tarde.");
    } finally {
      print("${DateTime.now()} | Requisição de obtenção finalizada.");
    }
  }

  Future<void> _searchByName() async {
    print("Digite o nome a buscar:");
    String? name = stdin.readLineSync();
    if (name == null || name.trim().isEmpty) {
      print("Nome vazio. Abortando busca.");
      return;
    }
    List<Account> results = await _accountService.getByName(name);
    if (results.isEmpty) {
      print("Nenhuma conta encontrada para: $name");
    } else {
      print("Encontradas ${results.length} contas:");
      for (var a in results) {
        print(a);
      }
    }
  }

  Future<void> _addAccount(String name, double balance) async {
    Account newAccount = Account(
      id: Uuid().v1(),
      name: name.split(" ").first,
      lastName: name.split(" ").length > 1 ? name.split(" ").last : "",
      balance: balance,
      accountType: '',
    );
    await _accountService.addAccount(newAccount);
  }
}
