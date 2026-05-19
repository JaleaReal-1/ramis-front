// lib/main.dart (VERSIÓN FINAL CORREGIDA)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistema_ocs/features/login/auth_notifier.dart'; // Corregido: auth/auth_notifier
import 'package:sistema_ocs/features/login/login_provider.dart';
import 'package:sistema_ocs/features/login/login_screen.dart';   // Corregido: auth/login_screen
import 'package:sistema_ocs/core/theme/app_theme.dart';
import 'package:sistema_ocs/features/dashboard/dashboard_screen.dart'; // ✅ IMPORTAR EL DASHBOARD

// Punto de Entrada Principal
void main() {
  runApp(const ProviderScope(child: OCSApp()));
}

class OCSApp extends ConsumerWidget {
  const OCSApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 💡 Nota: Asegúrate de que AuthNotifier esté usando el tipo AuthState si seguiste los pasos anteriores.
    // Aquí usamos la forma simple AuthStatus para mantener la compatibilidad con tu código actual.
    // Si usaste AuthState, la línea debería ser: final authState = ref.watch(authNotifierProvider).status;
    final authStatus = ref.watch(authNotifierProvider);

    Widget homeScreen;
    // Si el usuario está autenticado, lo enviamos al Dashboard principal.
    if (authStatus == AuthStatus.authenticated) {
      homeScreen = const DashboardScreen(); // ✅ Redirección al Dashboard
    } else {
      homeScreen = const LoginScreen(); 
    }
    final navigatorKey = ref.watch(navigatorKeyProvider);

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Sistema OCS',
       theme: ThemeData(
        // Usamos la paleta de AppTheme
        primaryColor: AppTheme.primary,
        secondaryHeaderColor: AppTheme.secondary,
        scaffoldBackgroundColor: AppTheme.background,
        cardColor: AppTheme.card,
        dividerColor: AppTheme.divider,
        fontFamily: AppTheme.fontFamily,
        
        // Configurar TextTheme
        textTheme: const TextTheme(
          displayLarge: AppTheme.headlineLarge,
          displayMedium: AppTheme.headlineMedium,
          displaySmall: AppTheme.headlineSmall,
          titleLarge: AppTheme.titleLarge,
          titleMedium: AppTheme.titleMedium,
          titleSmall: AppTheme.titleSmall,
          bodyLarge: AppTheme.bodyLarge,
          bodyMedium: AppTheme.bodyMedium,
          bodySmall: AppTheme.bodySmall,
          labelLarge: AppTheme.labelLarge,
          labelMedium: AppTheme.labelMedium,
          labelSmall: AppTheme.labelSmall,
        ),
        
        // Configurar colorScheme
        colorScheme: const ColorScheme.light(
          primary: AppTheme.primary,
          secondary: AppTheme.secondary,
          surface: AppTheme.surface,
          background: AppTheme.background,
          error: AppTheme.error,
          onPrimary: AppTheme.background,
          onSecondary: AppTheme.background,
          onSurface: AppTheme.textPrimary,
          onBackground: AppTheme.textPrimary,
          onError: AppTheme.background,
        ),
        
        // Configurar elevatedButtonTheme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            foregroundColor: AppTheme.background,
            textStyle: AppTheme.labelLarge,
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingXL,
              vertical: AppTheme.spacingL,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: AppTheme.borderRadiusMedium,
            ),
            elevation: 2,
          ),
        ),
        
        // Configurar outlinedButtonTheme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.textPrimary,
            textStyle: AppTheme.labelLarge,
            side: BorderSide(color: AppTheme.border),
            shape: RoundedRectangleBorder(
              borderRadius: AppTheme.borderRadiusMedium,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingXL,
              vertical: AppTheme.spacingL,
            ),
          ),
        ),
        
        // Configurar inputDecorationTheme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppTheme.border,
          border: OutlineInputBorder(
            borderRadius: AppTheme.borderRadiusMedium,
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppTheme.borderRadiusMedium,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppTheme.borderRadiusMedium,
            borderSide: BorderSide(color: AppTheme.primary),
          ),
          labelStyle: AppTheme.labelMedium.copyWith(
            color: AppTheme.textDisabled,
          ),
          hintStyle: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textDisabled,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingL,
            vertical: AppTheme.spacingM,
          ),
        ),
      ),
      home: homeScreen,
    );
  }
}