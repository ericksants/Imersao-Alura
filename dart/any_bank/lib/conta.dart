abstract class Conta {
  String titular;
  double _saldo;

  Conta(this.titular, this._saldo);

  // Getter para acessar o saldo (somente leitura)
  double get saldo => _saldo;

  void receberValor(double valor) {
    _saldo += valor;
    imprimirSaldo('Recebeu:', valor);
  }

  void enviarValor(double valor) {
    if (valor > _saldo) {
      print('Saldo insuficiente para a transação.');
      return;
    }
    _saldo -= valor;
    imprimirSaldo('Enviou:', valor);
  }

  void saldoAtual() {
    print('Titular: $titular, Saldo Atual: $_saldo');
  }

  void imprimirSaldo(tipo, valor) {
    print('Titular: $titular, $tipo $valor Novo Saldo: $_saldo');
  }
}

class ContaPoupanca extends Conta {
  double taxaRendimento = 0.05;
  ContaPoupanca(super.titular, super._saldo);

  void aplicarRendimento() {
    double rendimento = _saldo * taxaRendimento;
    receberValor(rendimento);
    print('Rendimento aplicado: $rendimento');
  }
}

class ContaCorrente extends Conta {
  double emprestimo = 300;
  ContaCorrente(super.titular, super._saldo);
  @override
  void enviarValor(double valor) {
    if (valor > _saldo + emprestimo) {
      print('Saldo insuficiente para a transação, mesmo com empréstimo.');
      return;
    }
    _saldo -= valor;
    imprimirSaldo('Enviou:', valor);
  }
}

class ContaSalario extends Conta {
  var contratanteCNPJ = '383.928.478/0001-00';
  var contratanteNome = 'Empresa XYZ Ltda';
  ContaSalario(super.titular, super._saldo);

  void depositarSalario(double valor) {
    _saldo += valor;
    print(
      'Salário da empresa: $contratanteNome, de CNPJ: $contratanteCNPJ no valor de: $valor, foi depositado.',
    );
  }
}

mixin Imposto {
  double calcularImposto(double valor) {
    return valor * 0.3;
  }
}

class ContaEmpresa extends Conta with Imposto {
  ContaEmpresa(super.titular, super._saldo);

  @override
  void enviarValor(double valor) {
    double imposto = calcularImposto(valor);
    double totalDebito = valor + imposto;

    if (totalDebito > _saldo) {
      print('Saldo insuficiente para a transação com imposto.');
      return;
    }

    _saldo -= totalDebito;
    imprimirSaldo('Enviou:', valor);
    print('Imposto cobrado: $imposto');
  }

  @override
  void receberValor(double valor) {
    double imposto = calcularImposto(valor);
    double valorLiquido = valor - imposto;

    _saldo += valorLiquido;
    imprimirSaldo('Recebeu:', valorLiquido);
    print('Imposto cobrado: $imposto');
  }
}

class ContaInvestimento extends Conta with Imposto {
  ContaInvestimento(super.titular, super._saldo);

  @override
  void enviarValor(double valor) {
    double imposto = calcularImposto(valor);
    double totalDebito = valor + imposto;

    if (totalDebito > _saldo) {
      print('Saldo insuficiente para a transação com imposto.');
      return;
    }

    _saldo -= totalDebito;
    imprimirSaldo('Enviou:', valor);
    print('Imposto cobrado: $imposto');
  }

  @override
  void receberValor(double valor) {
    double imposto = calcularImposto(valor);
    double valorLiquido = valor - imposto;

    _saldo += valorLiquido;
    imprimirSaldo('Recebeu:', valorLiquido);
    print('Imposto cobrado: $imposto');
  }
}
