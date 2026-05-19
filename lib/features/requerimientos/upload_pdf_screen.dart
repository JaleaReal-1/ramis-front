import 'package:flutter/material.dart';
import 'package:sistema_ocs/core/theme/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadPDFScreen extends StatelessWidget {
  const UploadPDFScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.picture_as_pdf,
                size: 80, color: AppColors.primaryRamisBlue),
            const SizedBox(height: 20),
            const Text(
              'Cargar Requerimiento desde PDF',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryRamisBlue,
              ),
            ),
            const SizedBox(height: 30),

            // ⭐ Nuevo borde dashed con DottedBorder
            DottedBorder(
              color: AppColors.accentRamisGreen,
              strokeWidth: 2,
              dashPattern: const [8, 4],
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              child: Container(
                height: 150,
                width: double.infinity,
                color: AppColors.accentRamisGreen.withOpacity(0.1),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload,
                        size: 40, color: AppColors.accentRamisGreen),
                    SizedBox(height: 10),
                    Text('Arrastre o toque para seleccionar archivo PDF'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                // Lógica de FilePicker para subir PDF
              },
              icon: const Icon(Icons.save_alt),
              label: const Text('Subir RQ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentRamisGreen,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
