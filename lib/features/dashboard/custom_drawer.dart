// lib/features/dashboard/custom_drawer.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sistema_ocs/core/theme/app_colors.dart';
import 'package:sistema_ocs/features/login/auth_notifier.dart';

// NUEVA: Pantalla principal del módulo de almacén
import 'package:sistema_ocs/features/almacen/almacen_main_screen.dart';

class CustomDrawer extends ConsumerWidget {
  final Function(int) onMenuItemTap;

  const CustomDrawer({super.key, required this.onMenuItemTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<String?>(
      future: const FlutterSecureStorage().read(key: 'user_role'),
      builder: (context, snapshot) {
        final userRole = snapshot.data ?? 'user'; // fallback si no hay role
        final userEmail = 'usuario@ramis.com'; // TODO: también leer de storage si lo guardas

        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  userRole.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(userEmail),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: AppColors.accentRamisGreen,
                  child: Icon(Icons.business_center, color: Colors.white),
                ),
                decoration: const BoxDecoration(
                  color: AppColors.primaryRamisBlue,
                ),
              ),

              // Ítems existentes
              _buildDrawerTile(context, Icons.dashboard, 'Dashboard', 0, onMenuItemTap),
              _buildDrawerTile(context, Icons.list_alt, 'Requerimientos (RQ)', 1, onMenuItemTap),
              _buildDrawerTile(context, Icons.shopping_cart, 'Ítems para Comprar', 2, onMenuItemTap),
              _buildDrawerTile(context, Icons.receipt_long, 'Órdenes de Compra (OCs)', 6, onMenuItemTap),
              _buildDrawerTile(context, Icons.local_shipping, 'Logística / Envíos', 3, onMenuItemTap),
              _buildDrawerTile(context, Icons.inventory, 'Inventario', 4, onMenuItemTap),
              _buildDrawerTile(context, Icons.add_box, 'Cargar RQ (PDF)', 5, onMenuItemTap),

              // NUEVO: Ítem de Almacén (visible solo para roles relevantes)
              if (userRole == 'trabajador' || userRole == 'almacenero' || userRole == 'admin') ...[
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.local_laundry_service, color: AppColors.primaryRamisBlue),
                  title: const Text('Almacén / Préstamos de Equipos'),
                  subtitle: const Text('Solicitar, devolver, confirmar'),
                  onTap: () {
                    Navigator.pop(context); // cierra drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AlmacenMainScreen()),
                    );
                  },
                ),
              ],

              const Divider(),

              // Logout
              ListTile(
                leading: const Icon(Icons.logout, color: AppColors.error),
                title: const Text('Cerrar Sesión'),
                onTap: () {
                  ref.read(authNotifierProvider.notifier).logout();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawerTile(BuildContext context, IconData icon, String title, int index, Function(int) onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryRamisBlue),
      title: Text(title),
      onTap: () {
        onTap(index);
        Navigator.pop(context);
      },
    );
  }
}