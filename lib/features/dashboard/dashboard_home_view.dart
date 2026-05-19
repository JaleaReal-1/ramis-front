import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DashboardHomeView extends StatelessWidget {
  const DashboardHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Fondo gris muy claro
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // --- CABECERA CON LOGO Y BIENVENIDA ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Logo en un contenedor circular con sombra
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0A1A2F).withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF0A1A2F),
                            child: const Center(
                              child: Text(
                                'R',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bienvenido,',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'RAMIS Mining',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A1A2F),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Panel de Control',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --- MÉTRICAS CLAVE (SIN TÍTULO, MÁS VISUAL) ---
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _buildMetricCard(
                  icon: LucideIcons.activity,
                  value: '5',
                  label: 'Operaciones',
                  color: const Color(0xFF0A1A2F),
                  bgColor: const Color(0xFFE3F2FD), // Azul muy claro
                ),
                _buildMetricCard(
                  icon: LucideIcons.truck,
                  value: '12',
                  label: 'Equipos',
                  color: Colors.green[700]!,
                  bgColor: Colors.green[50]!,
                ),
                _buildMetricCard(
                  icon: LucideIcons.trendingUp,
                  value: '98%',
                  label: 'Eficiencia',
                  color: const Color(0xFF0A1A2F),
                  bgColor: const Color(0xFFE3F2FD),
                ),
                _buildMetricCard(
                  icon: LucideIcons.users,
                  value: '340',
                  label: 'Colaboradores',
                  color: Colors.green[700]!,
                  bgColor: Colors.green[50]!,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // --- TARJETA DE GRÁFICO SIMULADO (PARA DAR VIDA) ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Producción Semanal',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A1A2F),
                        ),
                      ),
                      Icon(
                        LucideIcons.barChart3,
                        color: Colors.green[700],
                        size: 22,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBar('L', 40, Colors.green[700]!),
                      _buildBar('M', 60, Colors.green[700]!),
                      _buildBar('M', 35, Colors.green[700]!),
                      _buildBar('J', 80, const Color(0xFF0A1A2F)),
                      _buildBar('V', 55, const Color(0xFF0A1A2F)),
                      _buildBar('S', 45, const Color(0xFF0A1A2F)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --- ACCIONES RÁPIDAS (SOLO TRES, VISUALES) ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        LucideIcons.zap,
                        color: const Color(0xFF0A1A2F),
                        size: 22,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Acciones rápidas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A1A2F),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildQuickAction(
                    icon: LucideIcons.filePlus,
                    label: 'Nuevo reporte',
                    color: const Color(0xFF0A1A2F),
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildQuickAction(
                    icon: LucideIcons.alertTriangle,
                    label: 'Registrar incidente',
                    color: Colors.green[700]!,
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildQuickAction(
                    icon: LucideIcons.calendar,
                    label: 'Planificar',
                    color: const Color(0xFF0A1A2F),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[700],
        child: const Icon(LucideIcons.messageCircle, color: Colors.white),
      ),
    );
  }

  // Tarjeta de métrica simplificada
  Widget _buildMetricCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  // Barra para el gráfico simulado
  Widget _buildBar(String day, double height, Color color) {
    return Column(
      children: [
        Container(
          width: 16,
          height: height,
          decoration: BoxDecoration(
            color: color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  // Botón de acción rápida minimalista
  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(LucideIcons.chevronRight, color: color, size: 18),
          ],
        ),
      ),
    );
  }
}