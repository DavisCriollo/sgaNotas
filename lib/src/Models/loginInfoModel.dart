// To parse this JSON data, do
//
//     final loginInfo = loginInfoFromJson(jsonString);

import 'dart:convert';

LoginInfo loginInfoFromJson(String str) => LoginInfo.fromJson(json.decode(str));

String loginInfoToJson(LoginInfo data) => json.encode(data.toJson());

class LoginInfo {
    LoginInfo({
        this.auth,
        this.token,
        this.expiresIn,
        this.createdAt,
        this.info,
    });

    bool auth;
    String token;
    int expiresIn;
    DateTime createdAt;
    Info info;

    factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
        auth: json["auth"],
        token: json["token"],
        expiresIn: json["expiresIn"],
        createdAt: DateTime.parse(json["createdAt"]),
        info: Info.fromJson(json["info"]),
    );

    Map<String, dynamic> toJson() => {
        "auth": auth,
        "token": token,
        "expiresIn": expiresIn,
        "createdAt": createdAt.toIso8601String(),
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
