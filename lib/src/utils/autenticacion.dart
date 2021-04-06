import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart' show required;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sgaapp/src/Models/infoLoginModel.dart';



class Auth {
  Auth.internal();
  static Auth _instance = Auth.internal();
  static Auth get instance => _instance;

  final _storage = FlutterSecureStorage();

  final key = 'SESSION';

// GUARDO LA INFORMACION EN EL DISPOSITIVO

  Future<void> setSession(ModelLogin data) async {
    final Session session = Session(
        token: data.token,
        auth: data.auth,
        info: Info(
          idUser: data.info.idUser,
          nombre: data.info.nombre,
          usuario: data.info.usuario,
          tipoUsuario: data.info.tipoUsuario,
          estado: data.info.tipoUsuario,
          permiso: data.info.estado,
        ));
    final String value = jsonEncode(session.toJson());
    await this._storage.write(key: key, value: value);
    print('Session saved');
    // print(value);
    // print('======asdka===');
    // getSession();
  }


// OBTEMENOS LA INFORMACION DEL DISPOSITIVO
Future<Session> getSession() async {
    final String value = await this._storage.read(key: key);
    if (value != null) {
      final Map<String, dynamic> json = jsonDecode(value);
      final session = Session.fromJson(json);
      // print(session.info);
      return session;
    }
    return null;
  }


  // CIERRO SESSION
  Future<void> logOut(BuildContext context) async {
    await this._storage.deleteAll();
    Navigator.pushNamedAndRemoveUntil(context, 'login', (_) => false);
  }
}

// CLASE PARA DATOS LOGIN

// To parse this JSON data, do
//
//     final session = sessionFromJson(jsonString);

Session sessionFromJson(String str) => Session.fromJson(json.decode(str));

String sessionToJson(Session data) => json.encode(data.toJson());

class Session {
  Session({
    @required this.auth,
    @required this.token,
    @required this.info,
  });

  bool auth;
  String token;
  Info info;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        auth: json["auth"],
        token: json["token"],
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "auth": auth,
        "token": token,
        "info": info.toJson(),
      };
}

class Info {
  Info({
    this.nombre,
    this.tipoUsuario,
    this.estado,
    this.idUser,
    this.usuario,
    this.permiso,
  });

  String nombre;
  String tipoUsuario;
  String estado;
  String idUser;
  String usuario;
  String permiso;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        nombre: json["nombre"],
        tipoUsuario: json["tipoUsuario"],
        estado: json["estado"],
        idUser: json["idUser"],
        usuario: json["usuario"],
        permiso: json["permiso"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "tipoUsuario": tipoUsuario,
        "estado": estado,
        "idUser": idUser,
        "usuario": usuario,
        "permiso": permiso,
      };
}
