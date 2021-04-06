

import 'dart:convert';

DetalleDeMateria detalleDeMateriaFromJson(String str) => DetalleDeMateria.fromJson(json.decode(str));

String detalleDeMateriaToJson(DetalleDeMateria data) => json.encode(data.toJson());

class DetalleDeMateria {
    DetalleDeMateria({
        this.docente,
        this.data,
        this.globales,
    });

    String docente;
    List<Materia> data;
    List<Globale> globales;

    factory DetalleDeMateria.fromJson(Map<String, dynamic> json) => DetalleDeMateria(
        docente: json["docente"],
        data: List<Materia>.from(json["data"].map((x) => Materia.fromJson(x))),
        globales: List<Globale>.from(json["globales"].map((x) => Globale.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "docente": docente,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "globales": List<dynamic>.from(globales.map((x) => x.toJson())),
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
        this.notSeccion,
        this.notInfo,
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
        this.supId,
        this.supCodigo,
        this.supEstudiante,
        this.supDocente,
        this.supInfo,
        this.supFecReg,
        this.supUser,
        this.paralelo,
        this.id,
        this.notaParcial,
        this.notaPromedio,
        this.notaAsistencia,
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
    String notSeccion;
    String notInfo;
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
    dynamic supId;
    dynamic supCodigo;
    dynamic supEstudiante;
    dynamic supDocente;
    dynamic supInfo;
    dynamic supFecReg;
    dynamic supUser;
    String paralelo;
    int id;
    double notaParcial;
    double notaPromedio;
    double notaAsistencia;

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
        notSeccion: json["notSeccion"],
        notInfo: json["notInfo"],
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
        supId: json["supId"],
        supCodigo: json["supCodigo"],
        supEstudiante: json["supEstudiante"],
        supDocente: json["supDocente"],
        supInfo: json["supInfo"],
        supFecReg: json["supFecReg"],
        supUser: json["supUser"],
        paralelo: json["Paralelo"],
        id: json["id"],
        notaParcial: json["notaParcial"].toDouble(),
        notaPromedio: json["notaPromedio"].toDouble(),
        notaAsistencia: json["notaAsistencia"].toDouble(),
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
        "notSeccion": notSeccion,
        "notInfo": notInfo,
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
        "supId": supId,
        "supCodigo": supCodigo,
        "supEstudiante": supEstudiante,
        "supDocente": supDocente,
        "supInfo": supInfo,
        "supFecReg": supFecReg,
        "supUser": supUser,
        "Paralelo": paralelo,
        "id": id,
        "notaParcial": notaParcial,
        "notaPromedio": notaPromedio,
        "notaAsistencia": notaAsistencia,
    };
}

class Globale {
    Globale({
        this.notId,
        this.notParcial,
        this.notEstudiante,
        this.notHispersonal,
        this.notMalla,
        this.notEspecialidad,
        this.notCurso,
        this.notMateria,
        this.notPeriodo,
        this.notSeccion,
        this.notInfo,
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
        this.supId,
        this.supCodigo,
        this.supEstudiante,
        this.supDocente,
        this.supInfo,
        this.supFecReg,
        this.supUser,
        this.paralelo,
        this.id,
        this.notaParcial,
        this.notaPromedio,
        this.notaAsistencia,
        this.parciales,
        this.promedios,
        this.asistencias,
        this.proCualitativo,
        this.asisCualitativo,
        this.promedio,
        this.asistencia,
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
    String notSeccion;
    String notInfo;
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
    dynamic supId;
    dynamic supCodigo;
    dynamic supEstudiante;
    dynamic supDocente;
    dynamic supInfo;
    dynamic supFecReg;
    dynamic supUser;
    String paralelo;
    String id;
    double notaParcial;
    double notaPromedio;
    double notaAsistencia;
    String parciales;
    String promedios;
    String asistencias;
    String proCualitativo;
    String asisCualitativo;
    double promedio;
    double asistencia;

    factory Globale.fromJson(Map<String, dynamic> json) => Globale(
        notId: json["notId"],
        notParcial: json["notParcial"],
        notEstudiante: json["notEstudiante"],
        notHispersonal: json["notHispersonal"],
        notMalla: json["notMalla"],
        notEspecialidad: json["notEspecialidad"],
        notCurso: json["notCurso"],
        notMateria: json["notMateria"],
        notPeriodo: json["notPeriodo"],
        notSeccion: json["notSeccion"],
        notInfo: json["notInfo"],
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
        supId: json["supId"],
        supCodigo: json["supCodigo"],
        supEstudiante: json["supEstudiante"],
        supDocente: json["supDocente"],
        supInfo: json["supInfo"],
        supFecReg: json["supFecReg"],
        supUser: json["supUser"],
        paralelo: json["Paralelo"],
        id: json["id"],
        notaParcial: json["notaParcial"].toDouble(),
        notaPromedio: json["notaPromedio"].toDouble(),
        notaAsistencia: json["notaAsistencia"].toDouble(),
        parciales: json["parciales"],
        promedios: json["promedios"],
        asistencias: json["asistencias"],
        proCualitativo: json["ProCualitativo"],
        asisCualitativo: json["AsisCualitativo"],
        promedio: json["promedio"].toDouble(),
        asistencia: json["asistencia"].toDouble(),
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
        "notSeccion": notSeccion,
        "notInfo": notInfo,
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
        "supId": supId,
        "supCodigo": supCodigo,
        "supEstudiante": supEstudiante,
        "supDocente": supDocente,
        "supInfo": supInfo,
        "supFecReg": supFecReg,
        "supUser": supUser,
        "Paralelo": paralelo,
        "id": id,
        "notaParcial": notaParcial,
        "notaPromedio": notaPromedio,
        "notaAsistencia": notaAsistencia,
        "parciales": parciales,
        "promedios": promedios,
        "asistencias": asistencias,
        "ProCualitativo": proCualitativo,
        "AsisCualitativo": asisCualitativo,
        "promedio": promedio,
        "asistencia": asistencia,
    };
}
