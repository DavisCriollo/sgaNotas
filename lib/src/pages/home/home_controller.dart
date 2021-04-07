import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter_share/flutter_share.dart';
import 'package:sgaapp/src/data/account_repository.dart';
import 'package:sgaapp/src/data/authentication_repository.dart';
import 'package:sgaapp/src/data/curriculum_repositor.dart';
import 'package:sgaapp/src/pages/home/home_state.dart';

import '../../Models/cursoModel.dart';
import '../../Models/materiasSelect.dart';
import '../../Models/periodoModel.dart';
import '../../utils/autenticacion.dart';
import 'package:meta/meta.dart';

class HomeController extends ChangeNotifier {
  Session _session;
  Session get session => _session;

  HomeState _state = HomeState.initialState;
  HomeState get state => _state;

  final AccountRepository accountRepository;
  final CurriculumRepository curriculumRepository;
  final AuthenticationRepository authenticationRepository;

  HomeController({
    @required this.accountRepository,
    @required this.curriculumRepository,
    @required this.authenticationRepository,
  }) {
    _init();
  }

  Future<void> _init() async {
    _session = await this.accountRepository.session();
    final especialidades = await this.curriculumRepository.getEspecialidades();

    _state = _state.copyWith(
      especialidades: especialidades,
    );
    notifyListeners();
  }

  ///
  Future<void> setEspecialidad(String value) async {
    _state = _state.copyWith(
      especialidadSeleccionada: value,
      periodos: [],
      cursos: [],
      datos: [],
    );
    _state = _state.setPeriodo(null);
    _state = _state.setCurso(null);
    notifyListeners();
    final List<Periodo> periodos = await curriculumRepository.getPeriodos(
      _state.especialidadSeleccionada,
    );
    _state = _state.copyWith(
      periodos: periodos,
    );
    notifyListeners();
  }

  Future<void> setPeriodo(String value) async {
    _state = _state.copyWith(
      periodoSeleccionado: value,
      datos: [],
    );
    _state = _state.setCurso(null);
    notifyListeners();
    final List<Curso> cursos = await curriculumRepository.getCursos(
      especialidad: _state.especialidadSeleccionada,
      periodo: _state.periodoSeleccionado,
    );
    _state = _state.copyWith(
      cursos: cursos,
    );
    notifyListeners();
  }

  Future<void> setCurso(String value) async {
    _state = _state.copyWith(cursoSeleccionado: value);
    notifyListeners();
    final List<MateriasSelect> materias = await curriculumRepository.getMaterias(
      especialidad: _state.especialidadSeleccionada,
      periodo: _state.periodoSeleccionado,
      curso: _state.cursoSeleccionado,
    );
    _state = _state.copyWith(datos: materias);
    notifyListeners();
  }

  /// share the website
  Future<void> shareApp() async {
    return FlutterShare.share(
      title: 'My App',
      text: 'Sga App',
      linkUrl: 'https://play.google.com/store/apps/details?id=com.neitor.sgaapp',
      chooserTitle: 'Sistema de Gestión Académica',
    );
  }

  /// close the current session and delete the storage
  Future<void> signOut() {
    return this.authenticationRepository.signOut();
  }

  @override
  void dispose() {
    // LIBERAR RECURSOS
    super.dispose();
  }
}
