import 'dart:convert';

class CursosList {
  final List<Curso> cursos;

  CursosList({
    this.cursos,
  });

  factory CursosList.fromJson(List<dynamic> parsedJson) {
    List<Curso> cursos = new List<Curso>();
    cursos = parsedJson.map((i) => Curso.fromJson(i)).toList();

    return new CursosList(cursos: cursos);
  }
}

class Cursos {
  List<Curso> items = new List();
  Cursos();

  Cursos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final curso = Curso.fromJson(item);
      items.add(curso);
    });
  }
}

List<Curso> cursoFromJson(String str) =>
    List<Curso>.from(json.decode(str).map((x) => Curso.fromJson(x)));

String cursoToJson(List<Curso> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Curso {
  Curso({
    this.notCurso,
  });

  String notCurso;

  factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        notCurso: json["notCurso"],
      );

  Map<String, dynamic> toJson() => {
        "notCurso": notCurso,
      };
}
