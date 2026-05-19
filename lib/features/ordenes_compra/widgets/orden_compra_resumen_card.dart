import 'package:flutter/material.dart';
import 'package:sistema_ocs/core/theme/app_colors.dart';
import 'package:sistema_ocs/data/models/ordenes_resumen/rq_resumen_dto.dart';

class OrdenCompraResumenCard extends StatelessWidget {
  final RqResumenDto rq;
  final void Function(int ordenId) onDelete;

  const OrdenCompraResumenCard({
    super.key,
    required this.rq,
    required this.onDelete,
  });

  Color _progressColor(double p) {
    if (p >= 100) return AppColors.accentRamisGreen;
    if (p > 0) return AppColors.primaryRamisBlue;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final color = _progressColor(rq.progresoCompra);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        title: Text('RQ #${rq.rqId}', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Estado: ${rq.estadoCompra.toUpperCase()}'),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: rq.progresoCompra / 100,
              color: color,
            ),
            Text('${rq.progresoCompra.toStringAsFixed(1)}%'),
          ],
        ),
        children: rq.items.map((item) {
          return ListTile(
            title: Text(item.descripcion),
            subtitle: Text(
              'Req: ${item.cantidadRequerida} | Comprado: ${item.compradoTotal}',
            ),
            trailing: Text(item.estadoItem.toUpperCase()),
          );
        }).toList(),
      ),
    );
  }
}
