import 'dart:convert';

MateriasModel materiasModelFromJson(String str) => MateriasModel.fromJson(json.decode(str));

String materiasModelToJson(MateriasModel data) => json.encode(data.toJson());

class MateriasModel {
    MateriasModel({
        this.materias,
    });

    List<Materia> materias;

    factory MateriasModel.fromJson(Map<String, dynamic> json) => MateriasModel(
        materias: List<Materia>.from(json["materias"].map((x) => Materia.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "materias": List<dynamic>.from(materias.map((x) => x.toJson())),
    };
}

class Materia {
    Materia({
        this.notId,
        this.notParcial,
        this.notEstudiante,
        this.notHispersonal,
        this.notMalla,
        this.notEspecialidad,
        this.notCurso,
        this.notMateria,
        this.notPeriodo,
        this.notTrabajo1,
        this.notTrabajo2,
        this.notTrabajo3,
        this.notEvaluacion,
        this.notPromedio,
        this.notCualitativo,
        this.notPorAsistencia,
        this.notCualiAsistencia,
        this.notFecReg,
        this.notUser,
        this.perId,
        this.perCedula,
        this.perNombres,
        this.perTipo,
        this.perEstado,
        this.perClave,
        this.perInfo,
        this.perFecReglogin,
        this.perFecReg,
        this.perUser,
        this.id,
        this.notaParcial,
        this.notaPromedio,
        this.notaAsistencia,
        this.parciales,
        this.promedios,
        this.asistencias,
        this.proCualitativo,
        this.asisCualitativo,
    });

    int notId;
    int notParcial;
    int notEstudiante;
    int notHispersonal;
    String notMalla;
    String notEspecialidad;
    String notCurso;
    String notMateria;
    String notPeriodo;
    String notTrabajo1;
    String notTrabajo2;
    String notTrabajo3;
    double notEvaluacion;
    double notPromedio;
    String notCualitativo;
    double notPorAsistencia;
    String notCualiAsistencia;
    DateTime notFecReg;
    String notUser;
    int perId;
    String perCedula;
    String perNombres;
    String perTipo;
    String perEstado;
    String perClave;
    String perInfo;
    DateTime perFecReglogin;
    DateTime perFecReg;
    String perUser;
    String id;
    double notaParcial;
    double notaPromedio;
    double notaAsistencia;
    String parciales;
    String promedios;
    String asistencias;
    String proCualitativo;
    String asisCualitativo;

    factory Materia.fromJson(Map<String, dynamic> json) => Materia(
        notId: json["notId"],
        notParcial: json["notParcial"],
        notEstudiante: json["notEstudiante"],
        notHispersonal: json["notHispersonal"],
        notMalla: json["notMalla"],
        notEspecialidad: json["notEspecialidad"],
        notCurso: json["notCurso"],
        notMateria: json["notMateria"],
        notPeriodo: json["notPeriodo"],
        notTrabajo1: json["notTrabajo1"],
        notTrabajo2: json["notTrabajo2"],
        notTrabajo3: json["notTrabajo3"],
        notEvaluacion: json["notEvaluacion"].toDouble(),
        notPromedio: json["notPromedio"].toDouble(),
        notCualitativo: json["notCualitativo"],
        notPorAsistencia: json["notPorAsistencia"].toDouble(),
        notCualiAsistencia: json["notCualiAsistencia"],
        notFecReg: DateTime.parse(json["notFecReg"]),
        notUser: json["notUser"],
        perId: json["perId"],
        perCedula: json["perCedula"],
        perNombres: json["perNombres"],
        perTipo: json["perTipo"],
        perEstado: json["perEstado"],
        perClave: json["perClave"],
        perInfo: json["perInfo"],
        perFecReglogin: DateTime.parse(json["perFecReglogin"]),
        perFecReg: DateTime.parse(json["perFecReg"]),
        perUser: json["perUser"],
        id: json["id"],
        notaParcial: json["notaParcial"].toDouble(),
        notaPromedio: json["notaPromedio"].toDouble(),
        notaAsistencia: json["notaAsistencia"].toDouble(),
        parciales: json["parciales"],
        promedios: json["promedios"],
        asistencias: json["asistencias"],
        proCualitativo: json["ProCualitativo"],
        asisCualitativo: json["AsisCualitativo"],
    );

    Map<String, dynamic> toJson() => {
        "notId": notId,
        "notParcial": notParcial,
        "notEstudiante": notEstudiante,
        "notHispersonal": notHispersonal,
        "notMalla": notMalla,
        "notEspecialidad": notEspecialidad,
        "notCurso": notCurso,
        "notMateria": notMateria,
        "notPeriodo": notPeriodo,
        "notTrabajo1": notTrabajo1,
        "notTrabajo2": notTrabajo2,
        "notTrabajo3": notTrabajo3,
        "notEvaluacion": notEvaluacion,
        "notPromedio": notPromedio,
        "notCualitativo": notCualitativo,
        "notPorAsistencia": notPorAsistencia,
        "notCualiAsistencia": notCualiAsistencia,
        "notFecReg": notFecReg.toIso8601String(),
        "notUser": notUser,
        "perId": perId,
        "perCedula": perCedula,
        "perNombres": perNombres,
        "perTipo": perTipo,
        "perEstado": perEstado,
        "perClave": perClave,
        "perInfo": perInfo,
        "perFecReglogin": perFecReglogin.toIso8601String(),
        "perFecReg": perFecReg.toIso8601String(),
        "perUser": perUser,
        "id": id,
        "notaParcial": notaParcial,
        "notaPromedio": notaPromedio,
        "notaAsistencia": notaAsistencia,
        "parciales": parciales,
        "promedios": promedios,
        "asistencias": asistencias,
        "ProCualitativo": proCualitativo,
        "AsisCualitativo": asisCualitativo,
    };
}
