import 'package:equatable/equatable.dart';

import '../../Models/cursoModel.dart';
import '../../Models/especialidadModel.dart';
import '../../Models/materiasSelect.dart';
import '../../Models/periodoModel.dart';
import 'package:meta/meta.dart' show required;

class HomeState extends Equatable {
  final String cursoSeleccionado;
  final String especialidadSeleccionada;
  final String periodoSeleccionado;

  final List<Especialidad> especialidades;
  final List<Periodo> periodos;
  final List<Curso> cursos;
  final List<MateriasSelect> datos;

  static HomeState get initialState => HomeState(
        cursoSeleccionado: null,
        especialidadSeleccionada: null,
        periodoSeleccionado: null,
        especialidades: [],
        periodos: [],
        cursos: [],
        datos: [],
      );

  HomeState({
    @required this.cursoSeleccionado,
    @required this.especialidadSeleccionada,
    @required this.periodoSeleccionado,
    @required this.especialidades,
    @required this.periodos,
    @required this.cursos,
    @required this.datos,
  });

  HomeState copyWith({
    String cursoSeleccionado,
    String especialidadSeleccionada,
    String periodoSeleccionado,
    List<Especialidad> especialidades,
    List<Periodo> periodos,
    List<Curso> cursos,
    List<MateriasSelect> datos,
  }) {
    return HomeState(
      cursoSeleccionado: cursoSeleccionado ?? this.cursoSeleccionado,
      especialidadSeleccionada: especialidadSeleccionada ?? this.especialidadSeleccionada,
      periodoSeleccionado: periodoSeleccionado ?? this.periodoSeleccionado,
      especialidades: especialidades ?? this.especialidades,
      periodos: periodos ?? this.periodos,
      cursos: cursos ?? this.cursos,
      datos: datos ?? this.datos,
    );
  }

  HomeState setPeriodo(String periodoSeleccionado) {
    return HomeState(
      cursoSeleccionado: this.cursoSeleccionado,
      especialidadSeleccionada: this.especialidadSeleccionada,
      periodoSeleccionado: periodoSeleccionado,
      especialidades: this.especialidades,
      periodos: this.periodos,
      cursos: this.cursos,
      datos: this.datos,
    );
  }

  HomeState setCurso(String cursoSeleccionado) {
    return HomeState(
      cursoSeleccionado: cursoSeleccionado,
      especialidadSeleccionada: this.especialidadSeleccionada,
      periodoSeleccionado: this.periodoSeleccionado,
      especialidades: this.especialidades,
      periodos: this.periodos,
      cursos: this.cursos,
      datos: this.datos,
    );
  }

  @override
  List<Object> get props => [
        cursoSeleccionado,
        especialidadSeleccionada,
        periodoSeleccionado,
        especialidades,
        periodos,
        cursos,
        datos,
      ];
}
