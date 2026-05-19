import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sistema_ocs/features/almacen/almacen_dashboard_screen.dart';
import 'package:sistema_ocs/features/dashboard/dashboard_screen.dart';
import 'package:sistema_ocs/features/login/auth_notifier.dart';
import 'package:sistema_ocs/features/login/login_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    // Listener del estado de autenticación
    ref.listen<AuthStatus>(authNotifierProvider, (previous, next) async {
      if (next == AuthStatus.authenticated) {
        print('¡Login Exitoso!');

        final authService = ref.read(authServiceProvider);
        final user = await authService.getCurrentUser();

        if (user != null) {
          print('=== DATOS DEL USUARIO LEÍDOS DEL STORAGE ===');
          print('ID: ${user.id}');
          print('Nombre: ${user.nombre}');
          print('Apellidos: ${user.apellidos}');
          print('Nombres completos: ${user.nombresCompletos}');
          print('DNI: ${user.dni ?? "No disponible"}');
          print('Cargo: ${user.cargo ?? "No disponible"}');
          print('Código único: ${user.codigoUnico ?? "No disponible"}');
          print('Email: ${user.email}');
          print('Role: ${user.role}');

          final role = user.role.toLowerCase();

          // Navegación segura con navigatorKey (no usa context ni ref del widget)
          final navigatorKey = ref.read(navigatorKeyProvider);
          if (role == 'trabajador' || role == 'almacenero') {
            navigatorKey.currentState?.pushReplacement(
              MaterialPageRoute(builder: (_) => const AlmacenDashboardScreen()),
            );
          } else {
            navigatorKey.currentState?.pushReplacement(
              MaterialPageRoute(builder: (_) => const DashboardScreen()),
            );
          }
        } else {
          print('⚠️ No se pudo leer el usuario del storage después del login');
          final navigatorKey = ref.read(navigatorKeyProvider);
          navigatorKey.currentState?.pushReplacement(
            MaterialPageRoute(builder: (_) => const DashboardScreen()),
          );
        }
      } else if (next == AuthStatus.unauthenticated && previous == AuthStatus.loading) {
        // Aquí SÍ puedes usar ScaffoldMessenger con context, porque es sincrónico
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Credenciales inválidas o error de servidor'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    });

    final isLoading = ref.watch(authNotifierProvider) == AuthStatus.loading;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Iniciar Sesión OCS',
          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1B2B4B), // Azul marino
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/imagen1.png'), // Ajusta la ruta
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color(0xFF1B2B4B).withOpacity(0.4), // Overlay azul marino
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85), // Fondo semitransparente plomo claro
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1B2B4B).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Ícono con animación sutil (efecto sorpresa)
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 2),
                    curve: Curves.elasticOut,
                    builder: (context, double value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    child: const Icon(
                      Icons.lock_person,
                      size: 80,
                      color: Color(0xFF1B2B4B), // Azul marino
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Sistema de Gestión OCS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B2B4B), // Azul marino
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      labelStyle: const TextStyle(color: Color(0xFF1B2B4B)),
                      prefixIcon: const Icon(Icons.email, color: Color(0xFF1B2B4B)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.blueGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF1B2B4B), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: const TextStyle(color: Color(0xFF1B2B4B)),
                      prefixIcon: const Icon(Icons.lock, color: Color(0xFF1B2B4B)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.blueGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF1B2B4B), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Por favor llena todos los campos')),
                              );
                              return;
                            }

                            await ref.read(authNotifierProvider.notifier).login(email, password);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[300], // Plomo
                      foregroundColor: const Color(0xFF1B2B4B), // Azul marino
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xFF1B2B4B),
                            ),
                          )
                        : const Text(
                            'Iniciar Sesión',
                            style: TextStyle(fontSize: 18),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}