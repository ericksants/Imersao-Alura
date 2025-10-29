class Cliente {
  String nome;
  final List<String> _quartosReservados;

  Cliente(this.nome, [List<String>? quartosReservados])
      : _quartosReservados = List<String>.from(quartosReservados ?? []);

  List<String> get quartosReservados => List.unmodifiable(_quartosReservados);

  bool temReserva(String quarto) => _quartosReservados.contains(quarto);

  void reservarQuarto(String quarto) {
    if (quarto.trim().isEmpty) {
      throw ArgumentError('Número do quarto não pode ser vazio');
    }
    
    if (!_quartosReservados.contains(quarto)) {
      _quartosReservados.add(quarto);
      print('Quarto $quarto reservado com sucesso');
    } else {
      print('Quarto $quarto já está reservado');
    }
    print('Reservas de $nome: $quartosReservados');
  }

  void cancelarReserva(String quarto) {
    if (quarto.trim().isEmpty) {
      throw ArgumentError('Número do quarto não pode ser vazio');
    }

    if (_quartosReservados.contains(quarto)) {
      _quartosReservados.remove(quarto);
      print('Reserva cancelada: $quarto');
    } else {
      print('Nenhuma reserva encontrada para: $quarto');
    }
    print('Reservas de $nome: $quartosReservados');
  }
}

// Instância de exemplo
final clienteJoaquim = Cliente('Joaquim');
