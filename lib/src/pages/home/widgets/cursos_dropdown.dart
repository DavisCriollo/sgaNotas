import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgaapp/src/pages/home/home_controller.dart';
import '../../../Models/periodoModel.dart';

class CursosDropdown extends StatelessWidget {
  const CursosDropdown({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    final cursos = controller.state.cursos;
    final String cursoSeleccionado = controller.state.cursoSeleccionado;

    if (cursos.isEmpty) return Container();

    return DropdownButton<String>(
      value: cursoSeleccionado,
      isExpanded: true,
      hint: Text("Seleccione el curso"),
      items: List.generate(
        cursos.length,
        (index) {
          final curso = cursos[index];
          return DropdownMenuItem(
            child: Text(curso.notCurso),
            value: curso.notCurso,
          );
        },
      ),
      onChanged: controller.setCurso,
    );
  }
}
