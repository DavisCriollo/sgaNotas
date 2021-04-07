import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgaapp/src/pages/home/home_controller.dart';

import '../../../Models/especialidadModel.dart';

class EspecialidadesDropdown extends StatelessWidget {
  const EspecialidadesDropdown({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final List<Especialidad> especialidades = controller.state.especialidades;
    final String especialidadSeleccionda = controller.state.especialidadSeleccionada;

    return DropdownButton<String>(
      value: especialidadSeleccionda,
      isExpanded: true,
      hint: Text("Seleccione Especialidad"),
      items: List.generate(
        especialidades.length,
        (index) {
          final Especialidad especialidad = especialidades[index];
          return DropdownMenuItem(
            child: Text(especialidad.notEspecialidad),
            value: especialidad.notEspecialidad,
          );
        },
      ),
      onChanged: (text) => controller.setEspecialidad(text),
    );
  }
}
