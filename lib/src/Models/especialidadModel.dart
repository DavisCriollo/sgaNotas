import 'dart:convert';

List<Especialidad> especialidadModelFromJson(String str) =>
    List<Especialidad>.from(
        json.decode(str).map((x) => Especialidad.fromJson(x)));

String especialidadModelToJson(List<Especialidad> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Especialidades {
  List<Especialidad> items = new List();
  Especialidades();

  Especialidades.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final especialidad = Especialidad.fromJson(item);
      items.add(especialidad);
    });
  }
}

class Especialidad {
  Especialidad({
    this.notEspecialidad,
  });

  String notEspecialidad;

  factory Especialidad.fromJson(Map<String, dynamic> json) => Especialidad(
        notEspecialidad: json["notEspecialidad"],
      );

  Map<String, dynamic> toJson() => {
        "notEspecialidad": notEspecialidad,
      };
}
