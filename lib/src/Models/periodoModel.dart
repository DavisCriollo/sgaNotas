import 'dart:convert';

List<Periodo> periodoFromJson(String str) =>
    List<Periodo>.from(json.decode(str).map((x) => Periodo.fromJson(x)));

String periodoToJson(List<Periodo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Periodos {
  List<Periodo> items = new List();
  Periodos();

  Periodos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final especialidad = Periodo.fromJson(item);
      items.add(especialidad);
    });
  }
}

class Periodo {
  Periodo({
    this.notPeriodo,
  });

  String notPeriodo;

  factory Periodo.fromJson(Map<String, dynamic> json) => Periodo(
        notPeriodo: json["notPeriodo"],
      );

  Map<String, dynamic> toJson() => {
        "notPeriodo": notPeriodo,
      };
}
