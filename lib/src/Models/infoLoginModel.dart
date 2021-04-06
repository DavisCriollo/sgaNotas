import 'dart:convert';

ModelLogin modelLoginFromJson(String str) =>
    ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
  ModelLogin({
    this.auth,
    this.token,
    this.expiresIn,
    this.info,
  });

  bool auth;
  String token;
  int expiresIn;

  Info info;

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
        auth: json["auth"],
        token: json["token"],
        expiresIn: json["expiresIn"],
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "auth": auth,
        "token": token,
        "expiresIn": expiresIn,
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
