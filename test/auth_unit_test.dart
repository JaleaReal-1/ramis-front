import 'package:flutter_test/flutter_test.dart';

// Esta es la función simulada de tu proyecto que queremos probar
bool validarEmail(String email) {
  return email.contains('@') && email.endsWith('.com');
}

void main() {
  // agrupar pruebas relacionadas
  group('Pruebas de Validación de Email', () {
    
    test('Debería retornar TRUE si el correo es válido', () {
      // 1. Arrange (Preparar)
      String correoCorrecto = "usuario@ramis.com";

      // 2. Act (Actuar)
      bool resultado = validarEmail(correoCorrecto);

      // 3. Assert (Verificar)
      expect(resultado, isTrue);
    });

    test('Debería retornar FALSE si al correo le falta el @', () {
      String correoInvalido = "usuarioramis.com";
      bool resultado = validarEmail(correoInvalido);
      expect(resultado, isFalse);
    });
  });
}