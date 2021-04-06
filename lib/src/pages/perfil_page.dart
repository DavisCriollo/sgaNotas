import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sgaapp/src/Models/usuarioDatosModel.dart';
import 'package:sgaapp/src/services/api.dart';

import 'package:sgaapp/src/utils/responsive.dart';

class PerfilPage extends StatefulWidget {
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  File imagefile;
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil',
            style: GoogleFonts.roboto(
              fontSize: size.iScreen(3.0),
              color: Colors.white,
            )),
        // actions: <Widget>[
        //   FlatButton(
        //     child: Icon(
        //       FontAwesomeIcons.save,
        //       color: Colors.white,
        //       size: size.iScreen(4.0),
        //     ),
        //     onPressed: () {
        //       print('Guardar');
        //     },
        //   ),
        // ],
      ),
      body: FutureBuilder(
          future: Api.instance.getDatosUsuario(),
          builder: (BuildContext context,
              AsyncSnapshot<List<UsuarioModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final usuario = snapshot.data[index];
                  return Column(
                    // ELEMENTOS DEL FORMULARIO
                    children: <Widget>[
                      //====== ALIAS NOMBRE APELLIDO =======//

                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.blue),
                            ),
                        width: size.wScreen(100),
                        height: size.wScreen(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(size.iScreen(0.5)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  width: size.iScreen(0.3),
                                  color: Color(0xFF18459C),
                                ),
                              ),
                              width: size.iScreen(11),
                              height: size.iScreen(11),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                // child: Image(
                                //   image: ('${usuario.foto}' != "")
                                //       ? AssetImage('${usuario.foto}')
                                //       : AssetImage('assets/imgs/user.png'),
                                //   // image: verificaImagen(),
                                //   fit: BoxFit.cover,
                                // ),
                                child: Image(
                                  image: AssetImage('assets/imgs/user.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //=============================//
                      // PAPELLIDOS Y NOMBRES

                      Container(
                        padding: EdgeInsets.all(
                          size.iScreen(1.0),
                        ),
                        // decoration: BoxDecoration(
                        //   border: Border(
                        //     bottom: BorderSide(color: Color(0xFFE0E0E0)),
                        //   ),
                        // ),
                        width: size.wScreen(100),
                        child: Column(
                          children: [
                            // CÉDULA
                            Container(
                              width: size.wScreen(100),
                              child: Text('Cédula:',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.black45,
                                    // color: Color(0xFF18459C),
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                size.iScreen(1.0),
                              ),
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                              ),
                              width: size.wScreen(100),
                              child: SelectableText('${usuario.cedula}',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    fontWeight: FontWeight.w500,
                                    //  color: Colors.black45,
                                    //  color: Color(0xFF18459C),
                                  )),
                            ),

                            // APELLIDO Y NOMBRE
                            Container(
                              width: size.wScreen(100),
                              child: Text('Apellidos y Nombres:',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.black45,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                size.iScreen(1.0),
                              ),
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                              ),
                              width: size.wScreen(100),
                              child: SelectableText('${usuario.nombres}',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    fontWeight: FontWeight.w500,
                                    // color: Colors.black26,
                                  )),
                            ),
                            // FECHA DE NACIMIENTO
                            Container(
                              width: size.wScreen(100),
                              child: Text('Fecha de Nancimiento:',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.black45,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                size.iScreen(1.0),
                              ),
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                              ),
                              width: size.wScreen(100),
                              child: SelectableText(
                                  ('${usuario.fecNacimiento}' != "")
                                      ? '${usuario.fecNacimiento}'
                                      : 'No Asignado',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    fontWeight: FontWeight.w500,
                                    // color: Colors.black26,
                                  )),
                            ),
                            // CORREO
                            Container(
                              width: size.wScreen(100),
                              child: Text('Tipo de sangre:',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.black45,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                size.iScreen(1.0),
                              ),
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                              ),
                              width: size.wScreen(100),
                              child: SelectableText(
                                  ('${usuario.tipoSangre}' != "")
                                      ? '${usuario.tipoSangre}'
                                      : 'No Asignado',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    fontWeight: FontWeight.w500,
                                    // color: Colors.black26,
                                  )),
                            ),
                            // CORREO
                            Container(
                              width: size.wScreen(100),
                              child: Text('Correo:',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.black45,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                size.iScreen(1.0),
                              ),
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                              ),
                              width: size.wScreen(100),
                              child: SelectableText(
                                  ('${usuario.email}' != "")
                                      ? '${usuario.email}'
                                      : 'No Asignado',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    fontWeight: FontWeight.w500,
                                    // color: Colors.black26,
                                  )),
                            ),
                            // TELÉFONOS
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    // color:Colors.red,

                                    child: Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: size.wScreen(48),
                                          child: Text('Teléfono:',
                                              style: GoogleFonts.roboto(
                                                fontSize: size.iScreen(1.7),
                                                // fontWeight: FontWeight.w500,
                                                color: Colors.black45,
                                              )),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(
                                            size.iScreen(1.0),
                                          ),
                                          width: size.wScreen(45),
                                          child: SelectableText(
                                              ('${usuario.telefono}' != "")
                                                  ? '${usuario.telefono}'
                                                  : 'No Asignado',
                                              style: GoogleFonts.roboto(
                                                fontSize: size.iScreen(1.7),
                                                fontWeight: FontWeight.w500,
                                                // color: Colors.black26,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: size.wScreen(45),
                                    // color:Colors.green,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: size.wScreen(48),
                                          child: Text('Celular:',
                                              style: GoogleFonts.roboto(
                                                fontSize: size.iScreen(1.7),
                                                // fontWeight: FontWeight.w500,
                                                color: Colors.black45,
                                              )),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(
                                            size.iScreen(1.0),
                                          ),
                                          width: size.wScreen(48),
                                          child: SelectableText(
                                              ('${usuario.celular}' != "")
                                                  ? '${usuario.celular}'
                                                  : 'No Asignado',
                                              style: GoogleFonts.roboto(
                                                fontSize: size.iScreen(1.7),
                                                fontWeight: FontWeight.w500,
                                                // color: Colors.black26,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // DIRECCION
                            Container(
                              width: size.wScreen(100),
                              child: Text('Direccón:',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.black45,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                size.iScreen(1.0),
                              ),
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                              ),
                              width: size.wScreen(100),
                              child: SelectableText(
                                  ('${usuario.direccion}' != "")
                                      ? '${usuario.direccion}'
                                      : 'No Asignado',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    fontWeight: FontWeight.w500,
                                    // color: Colors.black26,
                                  )),
                            ),
                            // PAIS
                            Container(
                              width: size.wScreen(100),
                              child: Text('País:',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.black45,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                size.iScreen(1.0),
                              ),
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                              ),
                              width: size.wScreen(100),
                              child: SelectableText(
                                  ('${usuario.nombrePais}' != "")
                                      ? '${usuario.nombrePais}'
                                      : 'No Asignado',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    fontWeight: FontWeight.w500,
                                    // color: Colors.black26,
                                  )),
                            ),
                            // PROVINCIA
                            Container(
                              width: size.wScreen(100),
                              child: Text('Provincia:',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.black45,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                size.iScreen(1.0),
                              ),
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                              ),
                              width: size.wScreen(100),
                              child: SelectableText(
                                  ('${usuario.nombreProvincia}' != "")
                                      ? '${usuario.nombreProvincia}'
                                      : 'No Asignado',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    fontWeight: FontWeight.w500,
                                    // color: Colors.black26,
                                  )),
                            ),
                          ],
                        ),
                      ),

                      // // DIRECCION
                      // Container(
                      //   padding: EdgeInsets.all(
                      //     size.iScreen(1.0),
                      //   ),
                      //   decoration: BoxDecoration(
                      //     border: Border(
                      //       bottom: BorderSide(color: Color(0xFFE0E0E0)),
                      //     ),
                      //   ),
                      //   width: size.wScreen(100),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Container(
                      //         margin:
                      //             EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                      //         // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                      //         width: size.iScreen(6.0),
                      //         // height: 50.0,
                      //         child: Icon(
                      //           FontAwesomeIcons.mapMarkerAlt,
                      //           size: size.iScreen(3.2),
                      //           color: Color(0xFFFF0000),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               border: Border.all(color: Colors.grey),
                      //               borderRadius: BorderRadius.circular(8)),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               focusedBorder: InputBorder.none,
                      //               border: InputBorder.none,
                      //               contentPadding: EdgeInsets.all(5.0),
                      //               // labelText: 'Apellidos y Nombres',
                      //               hintText: 'Direcciòn',
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // // EMAIL
                      // Container(
                      //   padding: EdgeInsets.all(
                      //     size.iScreen(1.0),
                      //   ),
                      //   decoration: BoxDecoration(
                      //     border: Border(
                      //       bottom: BorderSide(color: Color(0xFFE0E0E0)),
                      //     ),
                      //   ),
                      //   width: size.wScreen(100),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Container(
                      //         margin:
                      //             EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                      //         // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                      //         width: size.iScreen(6.0),
                      //         // height: 50.0,
                      //         child: Icon(
                      //           FontAwesomeIcons.envelope,
                      //           size: size.iScreen(3.2),
                      //           color: Color(0xFFFF0000),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               border: Border.all(color: Colors.grey),
                      //               borderRadius: BorderRadius.circular(8)),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               focusedBorder: InputBorder.none,
                      //               border: InputBorder.none,
                      //               contentPadding: EdgeInsets.all(5.0),
                      //               // labelText: 'Apellidos y Nombres',
                      //               hintText: 'Email',
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // // MOVIL
                      // Container(
                      //   padding: EdgeInsets.all(
                      //     size.iScreen(1.0),
                      //   ),
                      //   decoration: BoxDecoration(
                      //     border: Border(
                      //       bottom: BorderSide(color: Color(0xFFE0E0E0)),
                      //     ),
                      //   ),
                      //   width: size.wScreen(100),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Container(
                      //         margin:
                      //             EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                      //         // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                      //         width: size.iScreen(6.0),
                      //         // height: 50.0,
                      //         child: Icon(
                      //           FontAwesomeIcons.phoneAlt,
                      //           size: size.iScreen(3.2),
                      //           color: Color(0xFFFF0000),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               border: Border.all(color: Colors.grey),
                      //               borderRadius: BorderRadius.circular(8)),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               focusedBorder: InputBorder.none,
                      //               border: InputBorder.none,
                      //               contentPadding: EdgeInsets.all(5.0),
                      //               // labelText: 'Apellidos y Nombres',
                      //               hintText: 'Teléfono',
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // // MOVIL
                      // Container(
                      //   padding: EdgeInsets.all(
                      //     size.iScreen(1.0),
                      //   ),
                      //   decoration: BoxDecoration(
                      //     border: Border(
                      //       bottom: BorderSide(color: Color(0xFFE0E0E0)),
                      //     ),
                      //   ),
                      //   width: size.wScreen(100),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Container(
                      //         margin:
                      //             EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                      //         // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                      //         width: size.iScreen(6.0),
                      //         // height: 50.0,
                      //         child: Icon(
                      //           FontAwesomeIcons.mobileAlt,
                      //           size: size.iScreen(3.2),
                      //           color: Color(0xFFFF0000),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               border: Border.all(color: Colors.grey),
                      //               borderRadius: BorderRadius.circular(8)),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               focusedBorder: InputBorder.none,
                      //               border: InputBorder.none,
                      //               contentPadding: EdgeInsets.all(5.0),
                      //               // labelText: 'Apellidos y Nombres',
                      //               hintText: 'Movil',
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // // MOVIL
                      // Container(
                      //   padding: EdgeInsets.all(
                      //     size.iScreen(1.0),
                      //   ),
                      //   decoration: BoxDecoration(
                      //     border: Border(
                      //       bottom: BorderSide(color: Color(0xFFE0E0E0)),
                      //     ),
                      //   ),
                      //   width: size.wScreen(100),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Container(
                      //         margin:
                      //             EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                      //         // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                      //         width: size.iScreen(6.0),
                      //         // height: 50.0,
                      //         child: Icon(
                      //           FontAwesomeIcons.unlock,
                      //           size: size.iScreen(3.2),
                      //           color: Color(0xFFFF0000),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               border: Border.all(color: Colors.grey),
                      //               borderRadius: BorderRadius.circular(8)),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               focusedBorder: InputBorder.none,
                      //               border: InputBorder.none,
                      //               contentPadding: EdgeInsets.all(5.0),
                      //               // labelText: 'Apellidos y Nombres',
                      //               hintText: 'Contraseña Actual',
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // // MOVIL
                      // Container(
                      //   padding: EdgeInsets.all(
                      //     size.iScreen(1.0),
                      //   ),
                      //   decoration: BoxDecoration(
                      //     border: Border(
                      //       bottom: BorderSide(color: Color(0xFFE0E0E0)),
                      //     ),
                      //   ),
                      //   width: size.wScreen(100),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Container(
                      //         margin:
                      //             EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                      //         // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                      //         width: size.iScreen(6.0),
                      //         // height: 50.0,
                      //         child: Icon(
                      //           FontAwesomeIcons.lock,
                      //           size: size.iScreen(3.2),
                      //           color: Color(0xFFFF0000),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               border: Border.all(color: Colors.grey),
                      //               borderRadius: BorderRadius.circular(8)),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               focusedBorder: InputBorder.none,
                      //               border: InputBorder.none,
                      //               contentPadding: EdgeInsets.all(5.0),
                      //               // labelText: 'Apellidos y Nombres',
                      //               hintText: 'Nueva Contraseña',
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // // MOVIL
                      // Container(
                      //   padding: EdgeInsets.all(
                      //     size.iScreen(1.0),
                      //   ),
                      //   decoration: BoxDecoration(
                      //     border: Border(
                      //       bottom: BorderSide(color: Color(0xFFE0E0E0)),
                      //     ),
                      //   ),
                      //   width: size.wScreen(100),
                      //   child: Row(
                      //     children: <Widget>[
                      //       Container(
                      //         margin:
                      //             EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                      //         // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                      //         width: size.iScreen(6.0),
                      //         // height: 50.0,
                      //         child: Icon(
                      //           FontAwesomeIcons.unlockAlt,
                      //           size: size.iScreen(3.2),
                      //           color: Color(0xFFFF0000),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               border: Border.all(color: Colors.grey),
                      //               borderRadius: BorderRadius.circular(8)),
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               focusedBorder: InputBorder.none,
                      //               border: InputBorder.none,
                      //               contentPadding: EdgeInsets.all(5.0),
                      //               // labelText: 'Apellidos y Nombres',
                      //               hintText: 'Confirmar Contraseña',
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  // Future<void> _muestraOpcionesImagen(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Seleccionar Foto'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Container(
  //                   alignment: Alignment.center,
  //                   // margin: EdgeInsets.all(5.0),
  //                   // padding: EdgeInsets.symmetric(vertical: 5.0),
  //                   decoration: BoxDecoration(
  //                       // border: Border.all(color: Colors.red)
  //                       ),
  //                   child: FlatButton(
  //                       splashColor: Color(0xFFC1272D),
  //                       // highlightColor: Colors.green[300],
  //                       child: Text(
  //                         'Abrir Galería',
  //                         style: TextStyle(fontSize: 18.0),
  //                       ),
  //                       onPressed: () {
  //                         _abrirGaleria(context);
  //                         Navigator.of(context).pop();
  //                       })
  //                   // Text('Abrir Galería',style: TextStyle(fontSize: 17.0),)
  //                   ),
  //               Container(
  //                   alignment: Alignment.center,
  //                   // margin: EdgeInsets.all(5.0),
  //                   // padding: EdgeInsets.symmetric(vertical: 5.0),
  //                   decoration: BoxDecoration(
  //                       // border: Border.all(color: Colors.red)
  //                       ),
  //                   child: FlatButton(
  //                       splashColor: Color(0xFFC1272D),
  //                       // highlightColor: Colors.green[300],
  //                       child: Text(
  //                         'Tomar Foto',
  //                         style: TextStyle(fontSize: 18.0),
  //                       ),
  //                       onPressed: () {
  //                         _abrirCamara(context);
  //                         Navigator.of(context).pop();
  //                       })
  //                   // Text('Abrir Galería',style: TextStyle(fontSize: 17.0),)
  //                   ),
  //             ],
  //           ),
  //         ),
  //         // actions: <Widget>[
  //         //   FlatButton(
  //         //     child: Text('Cancelar'),
  //         //     onPressed: () {
  //         //       Navigator.of(context).pop();
  //         //     },
  //         //   ),
  //         // ],
  //       );
  //     },
  //   );
  // }
// Image verificaImagen()
// {

//   if(imagefile == null)
//   {
//     return Null;
//   }
//   else{
//     Image.file(imagefile,width: 75.00,height: 75.00);
//   }
// }

  // _abrirGaleria(BuildContext context) async {
  //   // var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   // this.setState((){
  //   //   imagefile=picture;
  //   // });
  //   print('GALERIA');
  // }

  // _abrirCamara(BuildContext context) async {
  //   //  var picture = await ImagePicker.pickImage(source: ImageSource.camera);
  //   // this.setState((){
  //   //   imagefile=picture;
  //   // });
  //   print('CAMARA');
  // }
}
