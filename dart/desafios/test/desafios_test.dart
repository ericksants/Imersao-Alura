import 'package:desafios/reserva.dart';
import 'package:test/test.dart';

void main() {
  group('Cliente - reservas', () {
    test('reservar adiciona à lista', () {
      final cliente = Cliente('Ana');
      cliente.reservarQuarto('101');
      expect(cliente.quartosReservados, contains('101'));
    });

    test('reservar quarto já reservado não duplica', () {
      final cliente = Cliente('Ana');
      cliente.reservarQuarto('101');
      cliente.reservarQuarto('101');
      expect(cliente.quartosReservados.length, equals(1));
    });

    test('reservar quarto vazio lança erro', () {
      final cliente = Cliente('Ana');
      expect(() => cliente.reservarQuarto('  '), throwsArgumentError);
    });

    test('cancelar remove se existir', () {
      final cliente = Cliente('Beto', ['202']);
      cliente.cancelarReserva('202');
      expect(cliente.quartosReservados, isNot(contains('202')));
    });

    test('cancelar sem reserva não lança e mantém lista', () {
      final cliente = Cliente('Cida');
      cliente.cancelarReserva('303');
      expect(cliente.quartosReservados, isEmpty);
    });

    test('cancelar quarto vazio lança erro', () {
      final cliente = Cliente('Cida');
      expect(() => cliente.cancelarReserva(''), throwsArgumentError);
    });

    test('lista de reservas é imutável externamente', () {
      final cliente = Cliente('Dino', ['404']);
      final lista = cliente.quartosReservados;
      expect(() => lista.add('405'), throwsA(TypeMatcher<UnsupportedError>()));
    });

    test('verifica reserva existente', () {
      final cliente = Cliente('Eva', ['505']);
      expect(cliente.temReserva('505'), isTrue);
      expect(cliente.temReserva('606'), isFalse);
    });
  });
}
