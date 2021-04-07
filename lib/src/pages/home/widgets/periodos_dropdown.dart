import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgaapp/src/pages/home/home_controller.dart';
import '../../../Models/periodoModel.dart';

class PeriodosDropdown extends StatelessWidget {
  const PeriodosDropdown({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final List<Periodo> periodos = controller.state.periodos;
    final String periodoSeleccionado = controller.state.periodoSeleccionado;

    if (periodos.isEmpty) return Container();

    return DropdownButton<String>(
      value: periodoSeleccionado,
      isExpanded: true,
      hint: Text("Seleccione el periodo"),
      items: List.generate(
        periodos.length,
        (index) {
          final Periodo periodo = periodos[index];
          return DropdownMenuItem(
            child: Text(periodo.notPeriodo),
            value: periodo.notPeriodo,
          );
        },
      ),
      onChanged: controller.setPeriodo,
    );
  }
}
