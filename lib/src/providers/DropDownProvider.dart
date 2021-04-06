import 'package:flutter/material.dart';
import 'package:sgaapp/src/Models/cursoModel.dart';
import 'package:sgaapp/src/Models/especialidadModel.dart';
import 'package:sgaapp/src/Models/materiasSelect.dart';
import 'package:sgaapp/src/Models/periodoModel.dart';
import 'package:sgaapp/src/services/api.dart';

class DropDownProvider extends ChangeNotifier {
// ******* INICIALIZO EL CONSTRUCTOR *******//
  DropDownProvider() {
    getEspecialidad();
  }

  String _especialidadSelect;
  String _peridoSelect;
  String _cursoSelect;
// ESPECIALIDAD
  List<Especialidad> _especialidad = [];
  List<Especialidad> get especialidades => _especialidad;

  Future<void> getEspecialidad() async {
    // _periodo = [];
    //  _curso = [];
    _especialidad = await Api.instance.getEspecialidad();
    notifyListeners();
  }

  void setEspecialidad(String values) {
    _especialidadSelect = values;
    getPeriodo(values);
    notifyListeners();
  }

  String get especialidadSeleccionada => _especialidadSelect;

// PERIODO
  List<Periodo> _periodo = [];
  List<Periodo> get periodos => _periodo;

  void getPeriodo(String value) async {
    _periodo = await Api.instance.getPeriodo(value);
    notifyListeners();
  }

  String get periodoSeleccionado => _peridoSelect;
  set setPeriodo(String periodo) {
    // _periodo = [];
    _peridoSelect = periodo;
    getCurso(_especialidadSelect, _peridoSelect);
    notifyListeners();
  }

// CURSO
  List<Curso> _curso = [];
  List<Curso> get curso => _curso;

  void getCurso(String especialidad, String periodo) async {
    //  _curso = [];
    _curso = await Api.instance.getCursos(especialidad, periodo);
    notifyListeners();
  }

  String get cursoSeleccionado => _cursoSelect;
  set setCurso(String curso) {
    _cursoSelect = curso;
    notifyListeners();
  }

// // CURSOS
//   List<Curso> _cursos = [];
//   List<Curso> get cursos => _cursos;
//   Future<void> getCurso(String especialidad, String periodo) async {
//     _cursos = await Api.instance.getCursos(especialidad,periodo);
//     // if(_cursos.isNotEmpty)
//     // {
//     // _cursoSelect=_cursos.first.notCurso;
//     // }
//     notifyListeners();
//   }

//   String get cursoSeleccionado => _cursoSelect;
//   set setCurso(String value) {
//     _cursoSelect = value;
//     final String especialidad = especialidadSeleccionada;
//     final String periodo = periodoSeleccionado;
//     final String curso = cursoSeleccionado;
//     getInfoMateria(especialidad, periodo, curso);
//     notifyListeners();
//   }

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
