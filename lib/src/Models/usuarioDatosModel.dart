// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

import 'dart:convert';


class DatosList {
  final List<UsuarioModel> usuario;

  DatosList({
    this.usuario,
});

  factory DatosList.fromJson(List<dynamic> parsedJson) {

    List<UsuarioModel> usuario = new List<UsuarioModel>();
    usuario = parsedJson.map((i)=>UsuarioModel.fromJson(i)).toList();

    return new DatosList(
      usuario: usuario
    );
  }
}




List<UsuarioModel> usuarioModelFromJson(String str) => List<UsuarioModel>.from(json.decode(str).map((x) => UsuarioModel.fromJson(x)));

String usuarioModelToJson(List<UsuarioModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsuarioModel {
    UsuarioModel({
        this.codPer,
        this.cedula,
        this.nombres,
        this.tipo,
        this.estado,
        this.usua,
        this.genero,
        this.tipoSangre,
        this.estCivil,
        this.etnia,
        this.discapacidad,
        this.porcentaje,
        this.nCarnet,
        this.integrantes,
        this.fecNacimiento,
        this.codPais,
        this.nombrePais,
        this.codProvincia,
        this.nombreProvincia,
        this.nCiudad,
        this.nParroquia,
        this.profesion,
        this.gradAcademico,
        this.dProvincia,
        this.dCuidad,
        this.dParroquia,
        this.direccion,
        this.dCalle1,
        this.dCalle2,
        this.dCasa,
        this.dBarrio,
        this.celular,
        this.telefono,
        this.email,
        this.observaciones,
        this.foto,
        this.info,
        this.hisInfo,
        this.especialidad,
        this.curso,
        this.periodo,
        this.modalidad,
        this.paralelo,
        this.hisMaterias,
        this.fecRegistro,
        this.todos,
    });

    int codPer;
    String cedula;
    String nombres;
    String tipo;
    String estado;
    String usua;
    String genero;
    String tipoSangre;
    String estCivil;
    String etnia;
    String discapacidad;
    String porcentaje;
    String nCarnet;
    String integrantes;
    DateTime fecNacimiento;
    String codPais;
    String nombrePais;
    String codProvincia;
    String nombreProvincia;
    String nCiudad;
    String nParroquia;
    String profesion;
    String gradAcademico;
    String dProvincia;
    String dCuidad;
    String dParroquia;
    String direccion;
    String dCalle1;
    String dCalle2;
    String dCasa;
    String dBarrio;
    String celular;
    String telefono;
    String email;
    String observaciones;
    String foto;
    String info;
    String hisInfo;
    String especialidad;
    String curso;
    String periodo;
    String modalidad;
    String paralelo;
    String hisMaterias;
    DateTime fecRegistro;
    String todos;

    factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        codPer: json["CodPer"],
        cedula: json["Cedula"],
        nombres: json["Nombres"],
        tipo: json["Tipo"],
        estado: json["Estado"],
        usua: json["Usua"],
        genero: json["Genero"],
        tipoSangre: json["TipoSangre"],
        estCivil: json["EstCivil"],
        etnia: json["Etnia"],
        discapacidad: json["Discapacidad"],
        porcentaje: json["Porcentaje"],
        nCarnet: json["NCarnet"],
        integrantes: json["Integrantes"],
        fecNacimiento: DateTime.parse(json["FecNacimiento"]),
        codPais: json["CodPais"],
        nombrePais: json["NombrePais"],
        codProvincia: json["CodProvincia"],
        nombreProvincia: json["NombreProvincia"],
        nCiudad: json["NCiudad"],
        nParroquia: json["NParroquia"],
        profesion: json["Profesion"],
        gradAcademico: json["GradAcademico"],
        dProvincia: json["DProvincia"],
        dCuidad: json["DCuidad"],
        dParroquia: json["DParroquia"],
        direccion: json["Direccion"],
        dCalle1: json["DCalle1"],
        dCalle2: json["DCalle2"],
        dCasa: json["DCasa"],
        dBarrio: json["DBarrio"],
        celular: json["Celular"],
        telefono: json["Telefono"],
        email: json["Email"],
        observaciones: json["Observaciones"],
        foto: json["Foto"],
        info: json["Info"],
        hisInfo: json["hisInfo"],
        especialidad: json["Especialidad"],
        curso: json["Curso"],
        periodo: json["Periodo"],
        modalidad: json["Modalidad"],
        paralelo: json["Paralelo"],
        hisMaterias: json["hisMaterias"],
        fecRegistro: DateTime.parse(json["FecRegistro"]),
        todos: json["todos"],
    );

    Map<String, dynamic> toJson() => {
        "CodPer": codPer,
        "Cedula": cedula,
        "Nombres": nombres,
        "Tipo": tipo,
        "Estado": estado,
        "Usua": usua,
        "Genero": genero,
        "TipoSangre": tipoSangre,
        "EstCivil": estCivil,
        "Etnia": etnia,
        "Discapacidad": discapacidad,
        "Porcentaje": porcentaje,
        "NCarnet": nCarnet,
        "Integrantes": integrantes,
        "FecNacimiento": "${fecNacimiento.year.toString().padLeft(4, '0')}-${fecNacimiento.month.toString().padLeft(2, '0')}-${fecNacimiento.day.toString().padLeft(2, '0')}",
        "CodPais": codPais,
        "NombrePais": nombrePais,
        "CodProvincia": codProvincia,
        "NombreProvincia": nombreProvincia,
        "NCiudad": nCiudad,
        "NParroquia": nParroquia,
        "Profesion": profesion,
        "GradAcademico": gradAcademico,
        "DProvincia": dProvincia,
        "DCuidad": dCuidad,
        "DParroquia": dParroquia,
        "Direccion": direccion,
        "DCalle1": dCalle1,
        "DCalle2": dCalle2,
        "DCasa": dCasa,
        "DBarrio": dBarrio,
        "Celular": celular,
        "Telefono": telefono,
        "Email": email,
        "Observaciones": observaciones,
        "Foto": foto,
        "Info": info,
        "hisInfo": hisInfo,
        "Especialidad": especialidad,
        "Curso": curso,
        "Periodo": periodo,
        "Modalidad": modalidad,
        "Paralelo": paralelo,
        "hisMaterias": hisMaterias,
        "FecRegistro": fecRegistro.toIso8601String(),
        "todos": todos,
    };
}
