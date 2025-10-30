import 'package:desafios/reserva.dart' as desafios;

void main(List<String> arguments) {
  print('Desafio de Reserva de Quartos');

  final cliente = desafios.Cliente('Maria');

  cliente.reservarQuarto('101');
  cliente.reservarQuarto('102');
  cliente.cancelarReserva('101');
  cliente.cancelarReserva('103'); // Tentativa de cancelar uma reserva inexistente
}
