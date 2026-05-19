// lib/core/theme/app_colors.dart

import 'package:flutter/material.dart';

// Colores basados en el logo de Corporación Ramis
class AppColors {
  // Azul oscuro/marino - Primario
  static const Color primaryRamisBlue = Color(0xFF193D8F); 
  
  // Verde brillante/lima - Secundario/Acentuado/Éxito
  static const Color accentRamisGreen = Color(0xFF79B42A); 

  // Colores de estado
  static const Color success = accentRamisGreen;
  static const Color error = Color(0xFFD32F2F); // Rojo estándar para rechazo
  static const Color warning = Color(0xFFFFC107); // Amarillo para pendientes

  // Fondo y texto
  static const Color backgroundLight = Color(0xFFF5F5F5); // Gris muy claro
  static const Color textDark = Color(0xFF333333);
}