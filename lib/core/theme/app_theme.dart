// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';

// ============================================
// PALETA DE COLORES PRINCIPAL
// ============================================

// Colores base (basados en tu código)
const Color _verdePasto = Color(0xFF8BC34A);
const Color _azulChilloso = Color(0xFF00BCD4);
const Color _grisOscuro = Color(0xFF37474F);
const Color _grisClaro = Color(0xFFF5F5F5);
const Color _blanco = Color(0xFFFFFFFF);

// Extensiones para crear variaciones de colores
extension ColorExtensions on Color {
  Color get lighten10 => Color.alphaBlend(Colors.white.withOpacity(0.1), this);
  Color get lighten20 => Color.alphaBlend(Colors.white.withOpacity(0.2), this);
  Color get lighten30 => Color.alphaBlend(Colors.white.withOpacity(0.3), this);
  Color get darken10 => Color.alphaBlend(Colors.black.withOpacity(0.1), this);
  Color get darken20 => Color.alphaBlend(Colors.black.withOpacity(0.2), this);
  Color get darken30 => Color.alphaBlend(Colors.black.withOpacity(0.3), this);
  Color get withOpacity10 => withOpacity(0.1);
  Color get withOpacity20 => withOpacity(0.2);
  Color get withOpacity30 => withOpacity(0.3);
}

// ============================================
// CLASE DE TEMA PRINCIPAL
// ============================================

class AppTheme {
  static const Color statusHeaderDark = Color(0xFF1A237E); // Azul oscuro para header
static const Color progressCircleBg = Color(0x1AFFFFFF); // Fondo blanco translúcido

// Gradientes específicos (manteniendo el diseño original)
static const LinearGradient statusHeaderGradient = LinearGradient(
  colors: [statusHeaderDark, textPrimary],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
static InputDecoration get inputDecoration => InputDecoration(
      filled: true,
      fillColor: surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: spacingL,
        vertical: spacingL,
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadiusMedium,
        borderSide: const BorderSide(color: border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadiusMedium,
        borderSide: const BorderSide(color: border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadiusMedium,
        borderSide: const BorderSide(color: primary, width: 2),
      ),
      labelStyle: TextStyle(color: textSecondary, fontSize: 14),
      hintStyle: TextStyle(color: textDisabled, fontSize: 14),
      prefixIconColor: primary,
    );

static const LinearGradient tabIndicatorGradient = LinearGradient(
  colors: [primary, secondary],
);

static const LinearGradient actionButtonGradient = LinearGradient(
  colors: [primary, secondary],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

// Colores para badges y chips específicos
static const Color quantityBadgeBg = Color(0xFFFFF8E1);
static const Color quantityBadgeBorder = Color(0xFFFFB74D);
static const Color unitBadgeBg = Color(0x0D37474F); // grisOscuro con 5% opacidad

// Colores para filas alternadas en tabla
static Color get tableRowOdd => secondary.withOpacity(0.1);
static Color get tableRowEven => primary.withOpacity(0.1);
  // Colores primarios
  static const Color primary = _azulChilloso;
  static const Color secondary = _verdePasto;
  static const Color accent = _verdePasto;
  
  // Colores de fondo
  static const Color background = _blanco;
  static const Color surface = _blanco;
  static const Color card = _blanco;
  
  // Colores de texto
  static const Color textPrimary = _grisOscuro;
  static const Color textSecondary = Color(0xFF666666);
  static const Color textDisabled = Color(0xFF999999);
  
  // Colores de estado
  static const Color success = _verdePasto;
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = _azulChilloso;
  
  // Colores de UI
  static const Color border = Color(0xFFEEEEEE);
  static const Color divider = Color(0xFFF0F0F0);
  static const Color shadow = Color(0x1A000000);
  
  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [_azulChilloso, _verdePasto],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [_grisClaro, Color(0xFFE8F5E9)],
  );
  
  // Sombras
  static final BoxShadow cardShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    blurRadius: 15,
    offset: const Offset(0, 4),
  );
  
  static final BoxShadow buttonShadow = BoxShadow(
    color: _azulChilloso.withOpacity(0.3),
    blurRadius: 8,
    offset: const Offset(0, 2),
  );
  
  // ============================================
  // TIPOGRAFÍA
  // ============================================
  
  static const String fontFamily = 'Roboto';
  
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: textPrimary,
    letterSpacing: 0.5,
  );
  
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: textPrimary,
    letterSpacing: 0.3,
  );
  
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: textPrimary,
    letterSpacing: 0.2,
  );
  
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: textPrimary,
  );
  
  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );
  
  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textPrimary,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textPrimary,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );
  
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: textSecondary,
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: textDisabled,
  );
  
  // ============================================
  // BORDES Y FORMAS
  // ============================================
  
  static const BorderRadius borderRadiusSmall = BorderRadius.all(Radius.circular(8));
  static const BorderRadius borderRadiusMedium = BorderRadius.all(Radius.circular(12));
  static const BorderRadius borderRadiusLarge = BorderRadius.all(Radius.circular(16));
  static const BorderRadius borderRadiusExtraLarge = BorderRadius.all(Radius.circular(20));
  static const BorderRadius borderRadiusCircle = BorderRadius.all(Radius.circular(100));
  
  static const BorderSide borderSide = BorderSide(
    color: border,
    width: 1,
  );
  
  static const BorderSide borderSideThick = BorderSide(
    color: border,
    width: 2,
  );
  
  // ============================================
  // ESPACIADO Y DIMENSIONES
  // ============================================
  
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 12.0;
  static const double spacingL = 16.0;
  static const double spacingXL = 20.0;
  static const double spacingXXL = 24.0;
  static const double spacingXXXL = 32.0;
  
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 20.0;
  static const double iconSizeLarge = 24.0;
  static const double iconSizeExtraLarge = 32.0;
  
  // ============================================
  // MÉTODOS DE AYUDA
  // ============================================
  
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'aprobado':
        return success;
      case 'pendiente':
        return warning;
      case 'rechazado':
      case 'eliminado':
        return error;
      default:
        return info;
    }
  }
  
  static Color getProgressColor(double progress) {
    if (progress >= 100) return success;
    if (progress > 0) return primary;
    return textDisabled;
  }
  
  static Color getVariantColor(Color baseColor, int level) {
    switch (level) {
      case 1:
        return baseColor.lighten10;
      case 2:
        return baseColor.lighten20;
      case 3:
        return baseColor.lighten30;
      case -1:
        return baseColor.darken10;
      case -2:
        return baseColor.darken20;
      case -3:
        return baseColor.darken30;
      default:
        return baseColor;
    }
  }
}

// ============================================
// EXTENSIONES PARA FACILITAR EL USO
// ============================================

extension ThemeExtensions on BuildContext {
  Color get primaryColor => AppTheme.primary;
  Color get secondaryColor => AppTheme.secondary;
  Color get backgroundColor => AppTheme.background;
  Color get surfaceColor => AppTheme.surface;
  Color get textColor => AppTheme.textPrimary;
  Color get successColor => AppTheme.success;
  Color get warningColor => AppTheme.warning;
  Color get errorColor => AppTheme.error;
  Color get infoColor => AppTheme.info;
  
  TextStyle get headlineLarge => AppTheme.headlineLarge;
  TextStyle get headlineMedium => AppTheme.headlineMedium;
  TextStyle get headlineSmall => AppTheme.headlineSmall;
  TextStyle get titleLarge => AppTheme.titleLarge;
  TextStyle get titleMedium => AppTheme.titleMedium;
  TextStyle get titleSmall => AppTheme.titleSmall;
  TextStyle get bodyLarge => AppTheme.bodyLarge;
  TextStyle get bodyMedium => AppTheme.bodyMedium;
  TextStyle get bodySmall => AppTheme.bodySmall;
  
  double get spacingS => AppTheme.spacingS;
  double get spacingM => AppTheme.spacingM;
  double get spacingL => AppTheme.spacingL;
  double get spacingXL => AppTheme.spacingXL;
  
  BorderRadius get borderRadiusMedium => AppTheme.borderRadiusMedium;
  BorderRadius get borderRadiusLarge => AppTheme.borderRadiusLarge;
  
  BoxShadow get cardShadow => AppTheme.cardShadow;
}

// ============================================
// WIDGETS REUTILIZABLES
// ============================================

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final bool showShadow;
  final BorderRadius? borderRadius;
  
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppTheme.spacingXL),
    this.backgroundColor,
    this.showShadow = true,
    this.borderRadius,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.card,
        borderRadius: borderRadius ?? AppTheme.borderRadiusLarge,
        boxShadow: showShadow ? [AppTheme.cardShadow] : null,
        border: Border.all(color: AppTheme.border),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final bool isFullWidth;
  final bool isElevated;
  
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.isFullWidth = false,
    this.isElevated = true,
  });
  
  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppTheme.primary,
        foregroundColor: textColor ?? AppTheme.background,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingXL,
          vertical: AppTheme.spacingL,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppTheme.borderRadiusMedium,
        ),
        elevation: isElevated ? 2 : 0,
        shadowColor: isElevated ? AppTheme.primary.withOpacity(0.3) : Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: AppTheme.iconSizeMedium),
            const SizedBox(width: AppTheme.spacingS),
          ],
          Text(
            text,
            style: AppTheme.labelLarge.copyWith(
              color: textColor ?? AppTheme.background,
            ),
          ),
        ],
      ),
    );
    
    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    
    return button;
  }
}

class AppInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? iconColor;
  
  const AppInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, 
              color: iconColor ?? AppTheme.primary, 
              size: AppTheme.iconSizeSmall
            ),
            const SizedBox(width: AppTheme.spacingS),
            Text(
              label,
              style: AppTheme.labelSmall.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingXS),
        Text(
          value,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class AppBadge extends StatelessWidget {
  final String text;
  final Color color;
  final bool isUpperCase;
  
  const AppBadge({
    super.key,
    required this.text,
    required this.color,
    this.isUpperCase = true,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingXS,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppTheme.borderRadiusSmall,
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: AppTheme.labelSmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class AppProgressBar extends StatelessWidget {
  final double progress;
  final Color? color;
  final double height;
  
  const AppProgressBar({
    super.key,
    required this.progress,
    this.color,
    this.height = 8.0,
  });
  
  
  @override
  Widget build(BuildContext context) {
    final progressColor = color ?? AppTheme.getProgressColor(progress);
    
    return Column(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            color: AppTheme.border,
            borderRadius: AppTheme.borderRadiusSmall,
          ),
          child: FractionallySizedBox(
            widthFactor: progress / 100,
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [progressColor, progressColor.withOpacity(0.8)],
                ),
                borderRadius: AppTheme.borderRadiusSmall,
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}
