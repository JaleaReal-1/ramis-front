import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Un widget simple simulando tu vista de RamisToolX
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Text('Bienvenido a RamisToolX'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  testWidgets('Validar que la pantalla de bienvenida renderice el título y el botón', (WidgetTester tester) async {
    // 1. Cargar el widget en el entorno de pruebas inflándolo artificialmente
    await tester.pumpWidget(const WelcomeScreen());

    // 2. Buscar elementos en la pantalla usando 'find'
    final tituloFinder = find.text('Bienvenido a RamisToolX');
    final botonFinder = find.byType(ElevatedButton);

    // 3. Verificar que los elementos existan exactamente una vez en la UI
    expect(tituloFinder, findsOneWidget);
    expect(botonFinder, findsOneWidget);
  });
}