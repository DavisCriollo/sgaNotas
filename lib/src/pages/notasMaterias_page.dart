import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sgaapp/src/utils/responsive.dart';


class NotaMateriaPage extends StatefulWidget {
  @override
  _NotaMateriaPageState createState() => _NotaMateriaPageState();
}

class _NotaMateriaPageState extends State<NotaMateriaPage> {
  List<String> items = List.generate(3, (couter) => "Materia: $couter");
  final Color colorPrimario = Color(0xFF76BB67);
  final Color colorSecundario = Color(0xFF9BC763);
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Matemática de empresas y economia ',
            style: GoogleFonts.roboto(
              fontSize: size.iScreen(2.5),
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: size.iScreen(1.0), right: size.iScreen(1.5)),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.iScreen(1.0)),
                  color: Colors.white,
                  height: size.iScreen(5.0),
                  width: size.iScreen(0.3),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Estudiante',
                        style: GoogleFonts.roboto(
                          fontSize: size.iScreen(1.8),
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                    Text(
                      '2 Nivel ',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(2.0),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          _Cabecera(
            size: size,
            colorPrimario: colorPrimario,
          ),
          _ContenidoPormedios(size: size, colorSecundario: colorSecundario),
          _PromedioFinal(
            size: size,
            colorPromario: colorPrimario,
          ),
        ],
      ),
    );
  }
}

class _PromedioFinal extends StatelessWidget {
  final Color colorPromario;

  _PromedioFinal({
    Key key,
    @required this.size,
    @required this.colorPromario,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          color: this.colorPromario,
          border: Border.all(color: Colors.transparent)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.transparent)),
            child: Text('PROMEDIO FINAL CALCULADO',
                style: GoogleFonts.roboto(
                    fontSize: size.iScreen(2.0),
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
          Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.transparent)),
              child: Text(
                '20.0',
                style: GoogleFonts.roboto(
                    fontSize: size.iScreen(4.5),
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              )),
        ],
      ),
    );
  }
}

class _ContenidoPormedios extends StatelessWidget {
  final colorSecundario;

  _ContenidoPormedios({
    Key key,
    @required this.size,
    @required this.colorSecundario,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(physics: BouncingScrollPhysics(), children: <Widget>[
      // PRIMER PARCIAL    //GENERA LAS NOTAS
      Container(
        decoration: BoxDecoration(
            // color: Color(0xFFAFD280),
            border: Border.all(color: Colors.transparent)),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.iScreen(1.5), vertical: size.iScreen(0.5)),
              width: size.wScreen(100),
              decoration: BoxDecoration(
                  color: this.colorSecundario,
                  border: Border.all(color: Colors.transparent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('PRIMER PARCIAL',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.9),
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Sobre 10 puntos',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.9),
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
            //seccion trabajos Investigacion
            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.iScreen(0.7)),
                        decoration: BoxDecoration(
                            // color: Colors.transparent
                            color: Colors.transparent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //  Text(items[index]),
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(0.0)),
                              height: size.iScreen(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.iScreen(0.5)),
                                      margin: EdgeInsets.only(
                                          bottom: size.iScreen(0.1)),
                                      child: Text(
                                          'Trabajos de Investigación / 4.00',
                                          // style: TextStyle(fontSize: 14.0),
                                          style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.8),
                                          ))),
                                  Row(
                                    children: <Widget>[
                                      _ItemNota(
                                        size: size,
                                        item: 'T1',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T2',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T3',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T4',
                                        nota: '5.5',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                      width: size.wScreen(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              child: Text('Promedio',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(1.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.4)),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC8DBE2),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Text('5.58',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.2),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                  ],
                )),
            //Seccion Exposiciones
            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.iScreen(0.7)),
                        decoration: BoxDecoration(
                            // color: Colors.transparent
                            color: Colors.transparent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //  Text(items[index]),
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(0.0)),
                              height: size.iScreen(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.iScreen(0.5)),
                                      margin: EdgeInsets.only(
                                          bottom: size.iScreen(0.1)),
                                      child: Text(
                                          'Lección ,Exposición, Informes / 3.00',
                                          // style: TextStyle(fontSize: 14.0),
                                          style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.8),
                                          ))),
                                  Row(
                                    children: <Widget>[
                                      _ItemNota(
                                        size: size,
                                        item: 'T1',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T2',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T3',
                                        nota: '5.5',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                      width: size.wScreen(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              child: Text('Promedio',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(1.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.4)),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC8DBE2),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Text('5.58',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.2),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                  ],
                )),

            //Pureba Parcial
            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.iScreen(0.7)),
                        decoration: BoxDecoration(
                            // color: Colors.transparent
                            color: Colors.transparent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //  Text(items[index]),
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(0.0)),
                              height: size.iScreen(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.iScreen(0.5)),
                                      margin: EdgeInsets.only(
                                          bottom: size.iScreen(0.1)),
                                      child: Text('Prueba Parcial / 3.00',
                                          // style: TextStyle(fontSize: 14.0),
                                          style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.8),
                                          ))),
                                  Row(
                                    children: <Widget>[
                                      _ItemNota(
                                        size: size,
                                        item: 'T1',
                                        nota: '5.5',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                      width: size.wScreen(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              child: Text('Promedio',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(1.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.4)),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC8DBE2),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Text('5.58',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.2),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                  ],
                )),
            // PROMEDIO PRIMER PARCIAL

            Container(
                padding: EdgeInsets.only(right: size.iScreen(0.0)),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.red)
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(
                              left: size.iScreen(2.3),
                              right: size.iScreen(2.0)),
                          decoration: BoxDecoration(
                              // color: Colors.transparent
                              color: Colors.transparent),
                          child: Text('PROMEDIO PARCIAL',
                              style: GoogleFonts.roboto(
                                fontSize: size.iScreen(2.3),
                                // fontWeight: FontWeight.w500,
                              ))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(0.5)),
                      width: size.wScreen(20.0),
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.iScreen(0.5)),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.iScreen(0.5)),
                          decoration: BoxDecoration(
                              color: Color(0xFFAFD280),
                              border: Border.all(color: Colors.transparent)),
                          child: Text('5.58',
                              style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(2.5),
                                  color: Colors.white
                                  // fontWeight: FontWeight.w500,
                                  ))),
                    ),
                  ],
                )),
          ],
        ),
      ),
      // SEGUNDO PARCIAL    //GENERA LAS NOTAS
      Container(
        decoration: BoxDecoration(
            // color: Color(0xFFAFD280),
            border: Border.all(color: Colors.transparent)),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.iScreen(1.0), vertical: size.iScreen(0.5)),
              width: size.wScreen(100),
              decoration: BoxDecoration(
                  color: Color(0xFFAFD280),
                  border: Border.all(color: Colors.transparent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('SEGUNDO PARCIAL',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.9),
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Sobre 10 puntos',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.9),
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
            //seccion trabajos Investigacion
            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.iScreen(0.7)),
                        decoration: BoxDecoration(
                            // color: Colors.transparent
                            color: Colors.transparent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //  Text(items[index]),
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(0.0)),
                              height: size.iScreen(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.iScreen(0.5)),
                                      margin: EdgeInsets.only(
                                          bottom: size.iScreen(0.1)),
                                      child: Text(
                                          'Trabajos de Investigación / 4.00',
                                          // style: TextStyle(fontSize: 14.0),
                                          style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.8),
                                          ))),
                                  Row(
                                    children: <Widget>[
                                      _ItemNota(
                                        size: size,
                                        item: 'T1',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T2',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T3',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T4',
                                        nota: '5.5',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                      width: size.wScreen(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              child: Text('Promedio',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(1.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.4)),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC8DBE2),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Text('5.58',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.2),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                  ],
                )),
            //Seccion Exposiciones
            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.iScreen(0.7)),
                        decoration: BoxDecoration(
                            // color: Colors.transparent
                            color: Colors.transparent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //  Text(items[index]),
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(0.0)),
                              height: size.iScreen(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.iScreen(0.5)),
                                      margin: EdgeInsets.only(
                                          bottom: size.iScreen(0.1)),
                                      child: Text(
                                          'Lección ,Exposición, Informes / 3.00',
                                          // style: TextStyle(fontSize: 14.0),
                                          style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.8),
                                          ))),
                                  Row(
                                    children: <Widget>[
                                      _ItemNota(
                                        size: size,
                                        item: 'T1',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T2',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T3',
                                        nota: '5.5',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                      width: size.wScreen(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              child: Text('Promedio',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(1.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.4)),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC8DBE2),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Text('5.58',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.2),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                  ],
                )),

            //Pureba Parcial
            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.iScreen(0.7)),
                        decoration: BoxDecoration(
                            // color: Colors.transparent
                            color: Colors.transparent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //  Text(items[index]),
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(0.0)),
                              height: size.iScreen(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.iScreen(0.5)),
                                      margin: EdgeInsets.only(
                                          bottom: size.iScreen(0.1)),
                                      child: Text('Prueba Parcial / 3.00',
                                          // style: TextStyle(fontSize: 14.0),
                                          style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.8),
                                          ))),
                                  Row(
                                    children: <Widget>[
                                      _ItemNota(
                                        size: size,
                                        item: 'T1',
                                        nota: '5.5',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                      width: size.wScreen(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              child: Text('Promedio',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(1.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.4)),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC8DBE2),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Text('5.58',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.2),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                  ],
                )),
            // PROMEDIO PRIMER PARCIAL

            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.red)
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(
                              left: size.iScreen(2.3),
                              right: size.iScreen(2.0)),
                          decoration: BoxDecoration(
                              // color: Colors.transparent
                              color: Colors.transparent),
                          child: Text('PROMEDIO PARCIAL',
                              style: GoogleFonts.roboto(
                                fontSize: size.iScreen(2.3),
                                // fontWeight: FontWeight.w500,
                              ))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(0.5)),
                      width: size.wScreen(20.0),
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.iScreen(0.5)),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.iScreen(0.5)),
                          decoration: BoxDecoration(
                              color: Color(0xFFAFD280),
                              border: Border.all(color: Colors.transparent)),
                          child: Text('5.58',
                              style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(2.2),
                                  color: Colors.white
                                  // fontWeight: FontWeight.w500,
                                  ))),
                    ),
                  ],
                )),
          ],
        ),
      ),
      // RECUPERACION    //GENERA LAS NOTAS
      Container(
        decoration: BoxDecoration(
            // color: Color(0xFFAFD280),
            border: Border.all(color: Colors.transparent)),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.iScreen(1.0), vertical: size.iScreen(0.5)),
              width: size.wScreen(100),
              decoration: BoxDecoration(
                  color: Color(0xFFAFD280),
                  border: Border.all(color: Colors.transparent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('RECUPERACIÓN',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.9),
                        fontWeight: FontWeight.w500,
                      )),
                  Text('Sobre 10 puntos',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.9),
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
            //seccion trabajos Investigacion
            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.iScreen(0.7)),
                        decoration: BoxDecoration(
                            // color: Colors.transparent
                            color: Colors.transparent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //  Text(items[index]),
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(0.0)),
                              height: size.iScreen(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.iScreen(0.5)),
                                      margin: EdgeInsets.only(
                                          bottom: size.iScreen(0.1)),
                                      child: Text(
                                          'Trabajos de Investigación / 4.00',
                                          // style: TextStyle(fontSize: 14.0),
                                          style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.8),
                                          ))),
                                  Row(
                                    children: <Widget>[
                                      _ItemNota(
                                        size: size,
                                        item: 'T1',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T2',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T3',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T4',
                                        nota: '5.5',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                      width: size.wScreen(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              child: Text('Promedio',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(1.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.4)),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC8DBE2),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Text('5.58',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.2),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                  ],
                )),
            //Seccion Exposiciones
            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.iScreen(0.7)),
                        decoration: BoxDecoration(
                            // color: Colors.transparent
                            color: Colors.transparent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //  Text(items[index]),
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(0.0)),
                              height: size.iScreen(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.iScreen(0.5)),
                                      margin: EdgeInsets.only(
                                          bottom: size.iScreen(0.1)),
                                      child: Text(
                                          'Lección ,Exposición, Informes / 3.00',
                                          // style: TextStyle(fontSize: 14.0),
                                          style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.8),
                                          ))),
                                  Row(
                                    children: <Widget>[
                                      _ItemNota(
                                        size: size,
                                        item: 'T1',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T2',
                                        nota: '5.5',
                                      ),
                                      _ItemNota(
                                        size: size,
                                        item: 'T3',
                                        nota: '5.5',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                      width: size.wScreen(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              child: Text('Promedio',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(1.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.4)),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC8DBE2),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Text('5.58',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.2),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                  ],
                )),

            //Pureba Parcial
            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.iScreen(0.7)),
                        decoration: BoxDecoration(
                            // color: Colors.transparent
                            color: Colors.transparent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //  Text(items[index]),
                            Container(
                              padding: EdgeInsets.only(
                                  left: size.iScreen(0.0),
                                  right: size.iScreen(0.0)),
                              height: size.iScreen(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: size.iScreen(0.5)),
                                      margin: EdgeInsets.only(
                                          bottom: size.iScreen(0.1)),
                                      child: Text('Prueba Parcial / 3.00',
                                          // style: TextStyle(fontSize: 14.0),
                                          style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.8),
                                          ))),
                                  Row(
                                    children: <Widget>[
                                      _ItemNota(
                                        size: size,
                                        item: 'T1',
                                        nota: '5.5',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                      width: size.wScreen(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(bottom: size.iScreen(1.0)),
                              child: Text('Promedio',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(1.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.4)),
                              decoration: BoxDecoration(
                                  color: Color(0xFFC8DBE2),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Text('5.58',
                                  style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.2),
                                    // fontWeight: FontWeight.w500,
                                  ))),
                        ],
                      ),
                    ),
                  ],
                )),
            // PROMEDIO PRIMER PARCIAL

            Container(
                padding: EdgeInsets.only(right: size.iScreen(1.0)),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.red)
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(
                              left: size.iScreen(2.3),
                              right: size.iScreen(2.0)),
                          decoration: BoxDecoration(
                              // color: Colors.transparent
                              color: Colors.transparent),
                          child: Text('PROMEDIO PARCIAL',
                              style: GoogleFonts.roboto(
                                fontSize: size.iScreen(2.3),
                                // fontWeight: FontWeight.w500,
                              ))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: size.iScreen(0.5)),
                      width: size.wScreen(20.0),
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.iScreen(0.5)),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.iScreen(0.5)),
                          decoration: BoxDecoration(
                              color: Color(0xFFAFD280),
                              border: Border.all(color: Colors.transparent)),
                          child: Text('5.58',
                              style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(2.2),
                                  color: Colors.white
                                  // fontWeight: FontWeight.w500,
                                  ))),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ]));
  }
}

class _ItemNota extends StatelessWidget {
  final String item;
  final String nota;

  _ItemNota({
    Key key,
    @required this.size,
    @required this.item,
    @required this.nota,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          this.item,
          style: GoogleFonts.roboto(
            fontSize: size.iScreen(1.9),
            // fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.transparent)),
          child: Text(
            this.nota,
            style: GoogleFonts.roboto(
              fontSize: size.iScreen(2.3),
            ),
          ),
        ),
      ],
    );
  }
}

class _Cabecera extends StatelessWidget {
  final Color colorPrimario;
  _Cabecera({
    Key key,
    @required this.size,
    @required this.colorPrimario,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.wScreen(100),
        margin: EdgeInsets.only(bottom: size.iScreen(0.0)),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.transparent)),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: size.iScreen(0.5)),
              width: size.wScreen(100),
              color: colorPrimario,
              child: Text(
                'NOTAS',
                style: GoogleFonts.roboto(
                  fontSize: size.iScreen(2.2),
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              color: Color(0xFFF2F2F2),
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Docente : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.iScreen(2.0),
                        ),
                      ),
                      Text('DAVID CRIOLLO',
                          style: GoogleFonts.roboto(
                            fontSize: size.iScreen(2.0),
                            // fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Periodo Escolar : ',
                        style: GoogleFonts.roboto(
                          fontSize: size.iScreen(2.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '2019 02',
                        style: GoogleFonts.roboto(
                          fontSize: size.iScreen(2.0),
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
