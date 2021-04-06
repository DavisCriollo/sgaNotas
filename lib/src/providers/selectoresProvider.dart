import 'package:flutter/material.dart';

import 'package:sgaapp/src/Models/cursoModel.dart';
import 'package:sgaapp/src/Models/especialidadModel.dart';
import 'package:sgaapp/src/Models/materiasSelect.dart';
import 'package:sgaapp/src/Models/periodoModel.dart';
import 'package:sgaapp/src/services/api.dart';

class SelectProvider extends ChangeNotifier {
  String _cursoSeleccionado;
  String _especialidadSeleccionada;
  String _periodoSeleccionado;

  // ******* INICIALIZO EL CONSTRUCTOR *******//

  SelectProvider() {
    getEspecialidad();
  }

// ESPECIALIDAD
  List<Especialidad> _especialidad = [];
  List<Especialidad> get especialidades => _especialidad;

  void getEspecialidad() async {
    _especialidad = await Api.instance.getEspecialidad();
    notifyListeners();
  }

  String get especialidadesSeleccionado => _especialidadSeleccionada;
  set setespecialiadad(String value) {
    _especialidadSeleccionada = value;
    getPeriodo(value);
    notifyListeners();
  }

  // PERIODO
  List<Periodo> _periodo = [];
  List<Periodo> get periodos => _periodo;

  void getPeriodo(String value) async {
    _periodo = await Api.instance.getPeriodo(value);
    notifyListeners();
  }

  String get periodoSeleccionado => _periodoSeleccionado;
  set setPeriodo(String periodo)  {
    _periodoSeleccionado = periodo;

    final String especialidad = _especialidadSeleccionada;
    getCurso(especialidad, periodo);

    // notifyListeners();
  }

// CURSOS
  List<Curso> _cursos = [];
  List<Curso> get cursos => _cursos;
  Future<void> getCurso(String especialidad, String periodo) async {
    _cursos = await Api.instance.getCursos(
      especialidad,
      periodo,
         );
    if(_cursos.isNotEmpty)
    {
    _cursoSeleccionado=_cursos.first.notCurso;
    }
    notifyListeners();
  }

  String get cursoSeleccionado => _cursoSeleccionado;
  set setCurso(String value) {
    _cursoSeleccionado = value;
    final String especialidad = especialidadesSeleccionado;
    final String periodo = periodoSeleccionado;
    final String curso = cursoSeleccionado;
    getInfoMateria(especialidad, periodo, curso);
    notifyListeners();
  }

  List<MateriasSelect> _datos = [];

  void getInfoMateria(String especialidad, String periodo, String curso) async {
    final data =
        await Api.instance.getMateriasSelect(especialidad, periodo, curso);
    _datos.clear();
    _datos.addAll(data);
    notifyListeners();
  }

  List<MateriasSelect> get materiaObtenida => _datos;
}
