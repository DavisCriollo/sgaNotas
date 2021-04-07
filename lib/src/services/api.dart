import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sgaapp/src/Models/cursoModel.dart';
import 'package:sgaapp/src/Models/especialidadModel.dart';
import 'package:sgaapp/src/Models/infoLoginModel.dart';
import 'package:sgaapp/src/Models/loginModel.dart';
import 'package:sgaapp/src/Models/materiasDetalles.dart';
import 'package:sgaapp/src/Models/materiasModel.dart';
import 'package:sgaapp/src/Models/materiasSelect.dart';
import 'package:sgaapp/src/Models/periodoModel.dart';
import 'package:sgaapp/src/Models/usuarioDatosModel.dart';
import 'package:sgaapp/src/utils/autenticacion.dart';
import 'package:sgaapp/src/utils/dialogs.dart';

class Api {
  Api._internal();
  static Api _instance = Api._internal();
  static Api get instance => _instance;

  final Dio _dio = new Dio(
    BaseOptions(
      // baseUrl: 'http://192.168.10.11:4001/api',
      // baseUrl: 'http://167.250.183.27:4001/api',
      // baseUrl: 'http://104.131.117.24:4001/api',
      baseUrl: 'https://atlantic.gerverd.com/api',
    ),
  );

  // LOGIN DEL USUARIO
  Future login(BuildContext context, {@required LoginModel login}) async {
    final ProgressDialog progresDIalog = ProgressDialog(context);
    try {
      progresDIalog.show();
      final Response response = await this._dio.post(
        '/login/',
        data: {
          "usuario": login.usuario,
          "password": login.password,
          "tipo": 1,
        },
      );

      // Auth.instance.setSession(response.data);
      final infoData = ModelLogin.fromJson(response.data);
      await Auth.instance.setSession(infoData);
      progresDIalog.dismisDialog();
      if (response.statusCode == 200) {
        // print(response.data);
        // Navigator.pushNamedAndRemoveUntil(context, 'home', (_) => false,
        Navigator.pushNamedAndRemoveUntil(context, 'home', (_) => false, arguments: infoData);
        return Session.fromJson(response.data);
      }
    } catch (e) {
      progresDIalog.dismisDialog();
      if (e is DioError) {
        String message = e.message;
        if (e.response != null) {
          if (e.response.statusCode == null) {
            message = 'Servidor No Conectado';
          } else if (e.response.statusCode == 404) {
            message = 'Página no Existe';
          } else if (e.response.statusCode == 401) {
            message = 'Usuario y/o Clave Incorrectos';
          }
          print(e.response.statusCode);
          print(e.response.data);
        } else {
          message = 'Sin conexion a Intenet';
        }

        Dialogs.info(
          context,
          title: 'ERROR',
          content: message,
        );
      } else {
        print(e.message);
        print(e.request);
      }
    }
  }

//=========================================
// OBTENGO IMPORMACION DEL DISPOSITIVO
  Future<Session> infoSave() async {
    // Future<SaveSession> infoSave() async {
    try {
      final info = await Auth.instance.getSession();
      return info;
    } catch (e) {
      print(e);
      return null;
    }
  }

// =============================
// OBTENGO MATERIAS
  Future<MateriasModel> getMaterias(BuildContext context) async {
    final ProgressDialog progresDIalog = ProgressDialog(context);
    try {
      final Session token = await Auth.instance.getSession();
      // final SaveSession token = await Auth.instance.getSession();
      final Response response = await this._dio.post(
        '/materias',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'x-access-token': '${token.token}',
        }),
        data: {
          "id": '${token.info.idUser}',
        },
      );

      final infoMaterias = MateriasModel.fromJson(response.data);
      return infoMaterias;
    } catch (e) {
      progresDIalog.dismisDialog();
      if (e is DioError) {
        String message = e.message;
        if (e.response != null) {
          if (e.response.statusCode == null) {
            message = 'Servidor No Conectado';
          } else if (e.response.statusCode == 404) {
            message = 'Página no Existe';
          } else if (e.response.statusCode == 401) {
            message = 'Usuario y/o Clave Incorrectos';
          }
          print(e.response.statusCode);
          print(e.response.data);
        } else {
          message = 'Sin conexion a Intenet';
        }

        Dialogs.info(
          context,
          title: 'ERROR',
          content: message,
        );
      } else {
        print(e);
        String message = e.message;
        if (e.response.statusCode == 404) {
          message = 'Página no Existe';
        } else if (e.response.statusCode == 401) {
          message = 'Usuario y/o Clave Incorrectos';
        }
        Dialogs.info(
          context,
          title: 'ERROR',
          content: message,
        );
      }
    }
    return null;
  }

//=========================================
// OBTENGO ESPECIALIDAD
  Future<List<Especialidad>> getEspecialidad() async {
    // final ProgressDialog progresDIalog = ProgressDialog(context);
    try {
      final Session token = await Auth.instance.getSession();
      // final SaveSession token = await Auth.instance.getSession();
      // progresDIalog.show();
      final Response response = await this._dio.post(
        '/especialidad',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'x-access-token': '${token.token}',
        }),
        data: {
          "id": '${token.info.idUser}',
        },
      );

      if (response.statusCode == 200) {
        final infoData = new Especialidades.fromJsonList(response.data);
        //  print(infoData.items[0].notEspecialidad);
        //  print(infoData.items[1].notEspecialidad);
        return infoData.items;
      }
    } catch (e) {
      if (e is DioError) {
        // print(e.response.data);
        // String message = e.message;
        // if (e.response.statusCode == 404) {
        //   message = 'Página no Existe';
        // } else if (e.response.statusCode == 401) {
        //   message = 'Usuario y/o Clave Incorrectos';
        // }

        // Dialogs.info(
        //   title: 'ERROR',
        //   content: message,
        // );
      } else {
        // print(e);
      }
    }
    return null;
  }

//=========================================
// OBTENGO PERIODO
  Future<List<Periodo>> getPeriodo(String especialidad) async {
    // final ProgressDialog progresDIalog = ProgressDialog(context);
    try {
      final Session token = await Auth.instance.getSession();
      // final SaveSession token = await Auth.instance.getSession();
      // progresDIalog.show();
      final Response response = await this._dio.post(
        '/infodata',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'x-access-token': '${token.token}',
        }),
        data: {
          "id": '${token.info.idUser}',
          "option": 1,
          "especialidad": "$especialidad", //'$especialidad',
          "periodo": "", //"PERIODO I ~ MAYO 2020 - OCTUBRE 2020",
          "curso": " " //"TERCERO"
        },
      );

      if (response.statusCode == 200) {
        final infoData = new Periodos.fromJsonList(response.data);
// print(infoData.items[0].notPeriodo);
//    print(infoData.items[1].notPeriodo);
        return infoData.items;
      }
    } catch (e) {
      //  progresDIalog.dismisDialog();
      if (e is DioError) {
        // print(e.response.statusCode);
        // print(e.response.data);
        // String message = e.message;
        // if (e.response.statusCode == 404) {
        //   message = 'Página no Existe';
        // } else if (e.response.statusCode == 401) {
        //   message = 'Usuario y/o Clave Incorrectos';
        // }

        // Dialogs.info(
        //   context,
        //   title: 'ERROR',
        //   content: message,
        // );
      } else {
        // print(e);
      }
    }
    return null;
  }

// OBTENGO CURSO
  Future<List<Curso>> getCursos(String especialidad, String periodo) async {
    // final ProgressDialog progresDIalog = ProgressDialog(context);
    try {
      final Session token = await Auth.instance.getSession();
      // final SaveSession token = await Auth.instance.getSession();
      // progresDIalog.show();
      final Response response = await this._dio.post(
        '/infodata',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'x-access-token': '${token.token}',
        }),
        data: {
          "id": '${token.info.idUser}',
          "option": 2,
          "especialidad": "$especialidad", //'$especialidad',
          "periodo": '$periodo', //"PERIODO I ~ MAYO 2020 - OCTUBRE 2020",
          "curso": "" //"TERCERO"//"TERCERO"
        },
      );

      if (response.statusCode == 200) {
        final dato = CursosList.fromJson(response.data);
// print(dato.cursos[0].notCurso);

        return dato.cursos;
      }
    } catch (e) {
      //  progresDIalog.dismisDialog();
      if (e is DioError) {
        // print(e.response.statusCode);
        // print(e.response.data);
        // String message = e.message;
        // if (e.response.statusCode == 404) {
        //   message = 'Página no Existe';
        // } else if (e.response.statusCode == 401) {
        //   message = 'Usuario y/o Clave Incorrectos';
        // }

        // Dialogs.info(
        //   context,
        //   title: 'ERROR',
        //   content: message,
        // );
      } else {
        print(e);
      }
    }
    return null;
  }

// OBTENGO LAS MATERIAS MEDIANTE COMBO
  Future<List<MateriasSelect>> getMateriasSelect(String especialidad, String periodo, String curso) async {
    // Future<MateriasDetalle> getMateriaDetalle() async {
    // final ProgressDialog progresDIalog = ProgressDialog(context);
    try {
      final Session token = await Auth.instance.getSession();
      // final SaveSession token = await Auth.instance.getSession();
      // progresDIalog.show();
      final Response response = await this._dio.post(
        '/infodata/',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'x-access-token': '${token.token}',
        }),
        data: {
          "id": '${token.info.idUser}',
          "option": 3,
          "especialidad": '$especialidad',
          // "Tecnología Superior en Comercio Exterior", //"$especialidad", //'$especialidad',
          "periodo": "$periodo",
          // "PERIODO I ~ MAYO 2020 - OCTUBRE 2020", //'$periodo', //"PERIODO I ~ MAYO 2020 - OCTUBRE 2020",
          "curso": '$curso', //'TERCERO', //"$curso",
        },
      );

      if (response.statusCode == 200) {
        final infoData = MateriasList.fromJson(response.data);
        return infoData.materias;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  // OBTENGO DETLLE DE LAS MATERIAS

  Future<DetalleDeMateria> getMateriasDetalle(String especialidad, String periodo, String curso, String materia) async {
    // Future<MateriasDetalle> getMateriaDetalle() async {
    // final ProgressDialog progresDIalog = ProgressDialog(context);
    try {
      final Session token = await Auth.instance.getSession();
      // final SaveSession token = await Auth.instance.getSession();
      // progresDIalog.show();
      final Response response = await this._dio.post(
        '/notas/',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'x-access-token': '${token.token}',
        }),
        data: {
          "id": '${token.info.idUser}',
          "especialidad": '$especialidad',
          // "Tecnología Superior en Comercio Exterior", //"$especialidad", //'$especialidad',
          "periodo": "$periodo",
          // "PERIODO I ~ MAYO 2020 - OCTUBRE 2020", //'$periodo', //"PERIODO I ~ MAYO 2020 - OCTUBRE 2020",
          "curso": '$curso', //'TERCERO', //"$curso",
          "materia": '$materia', //'TERCERO', //"$curso",
        },
      );

      if (response.statusCode == 200) {
        final infoData = DetalleDeMateria.fromJson(response.data);
        return infoData;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  // OBTENGO DATOS DEL USUARIO
  Future<List<UsuarioModel>> getDatosUsuario() async {
    // Future<MateriasDetalle> getMateriaDetalle() async {
    // final ProgressDialog progresDIalog = ProgressDialog(context);
    try {
      final Session token = await Auth.instance.getSession();
      // final SaveSession token = await Auth.instance.getSession();
      // progresDIalog.show();
      final Response response = await this._dio.post(
        '/datos/',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
        data: {
          "codigo": '${token.info.idUser}',
        },
      );

      if (response.statusCode == 200) {
        //  final infoData = DatosList.fromJson(response.data);
        final infoData = DatosList.fromJson(response.data);
        // print(response.data);
        // print(infoData);
        return infoData.usuario;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
//=========================================

  // ENVIO CORREO DEL USUARIO PARA RECUPERAR CONTRASEÑA
  Future<void> sendCorreo(BuildContext context, {@required String correo}) async {
    final ProgressDialog progresDIalog = ProgressDialog(context);
    try {
      progresDIalog.show();
      final Response response = await this._dio.post(
        '/contrasena/',
        data: {
          "usuario": correo,
        },
      );
      progresDIalog.dismisDialog();
      if (response.statusCode == 200) {
        Confirmacion.info(
          context,
          title: 'Correo Enviado',
          content: response.data['msg'],
        );
      }
    } catch (e) {
      progresDIalog.dismisDialog();
      if (e is DioError) {
        String message = e.message;
        if (e.response != null) {
          if (e.response.statusCode == null) {
            message = 'Servidor No Conectado';
          } else if (e.response.statusCode == 404) {
            message = 'Página no Existe';
          } else if (e.response.statusCode == 401) {
            message = 'Usuario o Correo inválido';
          }
        } else {
          message = 'Sin conexion a Intenet';
        }

        Dialogs.info(
          context,
          title: 'ERROR',
          content: message,
        );
      } else {}
    }
  }
}
