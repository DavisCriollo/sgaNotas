import '../Models/cursoModel.dart';
import '../Models/especialidadModel.dart';
import '../Models/materiasSelect.dart';
import '../Models/periodoModel.dart';
import 'package:meta/meta.dart' show required;

import '../services/api.dart';

abstract class CurriculumRepository {
  Future<List<Especialidad>> getEspecialidades();
  Future<List<Periodo>> getPeriodos(String especialidad);
  Future<List<Curso>> getCursos({
    @required String especialidad,
    @required String periodo,
  });
  Future<List<MateriasSelect>> getMaterias({
    @required String especialidad,
    @required String periodo,
    @required String curso,
  });
}

class CurriculumRepositoryImpl implements CurriculumRepository {
  @override
  Future<List<Curso>> getCursos({String especialidad, String periodo}) {
    return Api.instance.getCursos(
      especialidad,
      periodo,
    );
  }

  @override
  Future<List<Especialidad>> getEspecialidades() {
    return Api.instance.getEspecialidad();
  }

  @override
  Future<List<MateriasSelect>> getMaterias({String especialidad, String periodo, String curso}) {
    return Api.instance.getMateriasSelect(especialidad, periodo, curso);
  }

  @override
  Future<List<Periodo>> getPeriodos(String especialidad) {
    return Api.instance.getPeriodo(especialidad);
  }
}
