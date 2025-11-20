import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:main/api_key.dart';
import 'package:main/models/account.dart';

class AccountService {
  final StreamController<String> _streamController = StreamController<String>();
  Stream<String> get streamInfos => _streamController.stream;

  String url = 'https://api.github.com/gists/56161ef65fa6d4852b25fa244e31bddf';

  Future<List<Account>> getAll() async {
    Response response = await get(Uri.parse(url));
    _streamController.add("${DateTime.now()} | Requisição Assíncrona");

    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> listDynamic = json.decode(
      mapResponse["files"]["accounts.json"]["content"],
    );

    List<Account> listAccounts = [];

    for (dynamic dyn in listDynamic) {
      Map<String, dynamic> mapAccount = dyn as Map<String, dynamic>;
      Account account = Account.fromMap(mapAccount);
      listAccounts.add(account);
    }
    return listAccounts;
  }

  Future<List<Account>> getByName(String name) async {
    if (name.trim().isEmpty) return [];
    final List<Account> all = await getAll();
    final query = name.toLowerCase();
    return all.where((a) => a.name.toLowerCase().contains(query)).toList();
  }

  //teste local
  static List<Account> filterByName(List<Account> accounts, String name) {
    if (name.trim().isEmpty) return [];
    final query = name.toLowerCase();
    return accounts.where((a) => a.name.toLowerCase().contains(query)).toList();
  }

  Future addAccount(Account account) async {
    List<Account> listAccounts = await getAll();
    listAccounts.add(account);

    // delega a persistência para o método save
    await save(listAccounts, accountName: account.name);
  }

  /// Persiste a lista de contas no Gist (serializa e faz o POST).
  /// Recebe opcionalmente o nome da conta adicionada para mensagens no stream.
  save(List<Account> listAccounts, {String accountName = ""}) async {
    List<Map<String, dynamic>> listContent = [];
    for (Account account in listAccounts) {
      listContent.add(account.toMap());
    }

    String content = json.encode(listContent);

    Response response = await post(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $apiKey'},
      body: jsonEncode({
        "description": "accounts.json",
        "public": true,
        "files": {
          "accounts.json": {"content": content},
        },
      }),
    );

    if (response.statusCode.toString()[0] == "2") {
      _streamController.add(
        "${DateTime.now()} | Requisição adição bem sucedida ($accountName).",
      );
    } else {
      _streamController.add(
        "${DateTime.now()} | Requisição falhou ($accountName).",
      );
    }
  }
}
