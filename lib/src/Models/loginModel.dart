// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel(
      {
      this.usuario,//'2250154131',//'2350177339',/*BORRA CUANDO SE IMPLEMENTE*/
      this.password,//'2250154131', //'2350177339',/*BORRA CUANDO SE IMPLEMENTE*/
      this.tipo //= 1,
      });

  String usuario;
  String password;
  int tipo;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        usuario: json["usuario"],
        password: json["password"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "password": password,
        "tipo": tipo,
      };
}
