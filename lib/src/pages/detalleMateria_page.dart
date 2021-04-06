import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sgaapp/src/Models/materiasDetalles.dart';
import 'package:sgaapp/src/services/api.dart';
import 'package:sgaapp/src/utils/calculos.dart';
import 'package:sgaapp/src/utils/responsive.dart';

class NotasMateriaPage extends StatefulWidget {
  @override
  _NotasMateriaPageState createState() => _NotasMateriaPageState();
}

class _NotasMateriaPageState extends State<NotasMateriaPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    final Map<dynamic, dynamic> infoRoute =
        ModalRoute.of(context).settings.arguments;

    final Color colorPrimario = infoRoute['color'];
    final Color colorSecundario = infoRoute['color'].withOpacity(0.8);
    final Color colorTerciario = infoRoute['color'].withOpacity(0.4);

    final String especialidad = infoRoute['especialidad'];
    final String periodo = infoRoute['periodo'];
    final String materia = infoRoute['materia'];
    final String curso = infoRoute['curso'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Materia ',
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
                    Text('Curso',
                        style: GoogleFonts.roboto(
                          fontSize: size.iScreen(1.5),
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                    Text(
                      '${infoRoute['curso']}',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.7),
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
      body: FutureBuilder(
        future: Api.instance.getMateriasDetalle(
          especialidad,
          periodo,
          curso,
          materia,
        ),
        builder:
            (BuildContext context, AsyncSnapshot<DetalleDeMateria> snapshot) {
          if (!snapshot.hasData || snapshot.data == null)
            return Center(
                child: CircularProgressIndicator(backgroundColor: Colors.red));

          if (snapshot.hasData) {
            final docente = snapshot.data.docente;
            final dataMateria = snapshot.data.data;
            final globales = snapshot.data.globales;

            return Column(
              children: <Widget>[
                _Cabecera(
                  materia: '${dataMateria[0].notMateria}',
                  docente: '$docente',
                  periodo: '${dataMateria[0].notPeriodo}',
                  size: size,
                  colorSecundario: colorSecundario,
                ),
                _ContenidoPormedios(
                  globales: globales,
                  materia: dataMateria,
                  size: size,
                  colorPrimario: colorPrimario,
                  colorSecundario: colorSecundario,
                  colorTerciario: colorTerciario,
                ),
                _PromedioFinal(
                  globales: globales,
                  size: size,
                  colorSecundario: colorSecundario,
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _PromedioFinal extends StatelessWidget {
  final List<Globale> globales;
  final Color colorSecundario;

  _PromedioFinal({
    Key key,
    @required this.size,
    @required this.colorSecundario,
    @required this.globales,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          color: this.colorSecundario,
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
                (globales[0].supInfo != null)
                    ? '${globales[0].supInfo.split(",")[4].split(":")[1].replaceAll("\}", "").replaceAll("\"", "")}'
                    : this.globales[0].promedio.toString(),
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
  final List<Globale> globales;
  final List<Materia> materia;
  final Color colorSecundario;
  final Color colorPrimario;
  final Color colorTerciario;

  // PARCIAALES
  _ContenidoPormedios({
    Key key,
    @required this.size,
    @required this.colorTerciario,
    @required this.colorSecundario,
    @required this.colorPrimario,
    @required this.materia,
    @required this.globales,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    //====SUMO LOS TRABAJOS PARCIAL 1=====//
    var t1P1 = double.parse(materia[0].notTrabajo1);
    var t2P1 = double.parse(materia[0].notTrabajo2);
    var t3P1 = double.parse(materia[0].notTrabajo3);
    var sumaTrabajosP1 = t1P1 + t2P1 + t3P1;
    //====SUMO LOS TRABAJOS PARCIAL 2=====//
    var t1P2 = double.parse(materia[1].notTrabajo1);
    var t2P2 = double.parse(materia[1].notTrabajo2);
    var t3P2 = double.parse(materia[1].notTrabajo3);
    var sumaTrabajosP2 = (t1P2 + t2P2 + t3P2) != 0 ? t1P2 + t2P2 + t3P2 : '0.0';

    return Expanded(
        child: ListView(physics: BouncingScrollPhysics(), children: <Widget>[
      // =====================================    ITEM DE PARCIAL  ===============================================================//
      ItemParcial(
        size: size,
        colorPrimario: colorPrimario,
        colorSecundario: colorSecundario,
        colorTerciario: colorTerciario,
        //  *********  CONTENIDO  *************//
        banner: 'PRIMER PARCIAL',
        materiaInfo: materia[0],
        sumaTrabajos: Calculos.instance.redondeaDouble(sumaTrabajosP1, 2),
      ),

      // ===============================================PRIMER PARCIAL    //GENERA LAS NOTAS =====================================//
      ItemParcial(
        size: size,
        colorPrimario: colorPrimario,
        colorSecundario: colorSecundario,
        colorTerciario: colorTerciario,
        //  *********  CONTENIDO  *************//
        banner: 'SEGUNDO PARCIAL',
        materiaInfo: materia[1],
        sumaTrabajos: Calculos.instance.redondeaDouble(sumaTrabajosP2, 2),
      ),
      //========================================== RECUPERACION    //GENERA LAS NOTAS ========================================//
      Recuperacion(
        size: size,
        banner: 'RECUPERACÓN',
        colorPrimario: colorPrimario,
        colorSecundario: colorSecundario,
        colorTerciario: colorTerciario,
        //  *********  CONTENIDO  *************//
        globales: globales,
      ),
    ]));
  }
}

class ItemParcial extends StatelessWidget {
  final Materia materiaInfo;
  final String banner;
  final double sumaTrabajos;
  ItemParcial({
    Key key,
    @required this.size,
    @required this.colorPrimario,
    @required this.colorSecundario,
    @required this.colorTerciario,
    @required this.banner,
    @required this.materiaInfo,
    @required this.sumaTrabajos,
  }) : super(key: key);

  final Responsive size;
  final Color colorPrimario;
  final Color colorSecundario;
  final Color colorTerciario;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.iScreen(1.5), vertical: size.iScreen(0.5)),
            width: size.wScreen(100),
            decoration: BoxDecoration(
                color: this.colorPrimario,
                border: Border.all(color: Colors.transparent)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(this.banner,
                    style: GoogleFonts.roboto(
                      fontSize: size.iScreen(1.9),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
                Text('Sobre 10 puntos',
                    style: GoogleFonts.roboto(
                      fontSize: size.iScreen(1.9),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          //seccion trabajos Investigacion
          Container(
              padding: EdgeInsets.only(right: size.iScreen(1.0)),
              decoration: BoxDecoration(
                // color:Colors.purple,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
              child: Column(
                children: [
                  Container(
                      width: size.wScreen(100),
                      padding: EdgeInsets.only(
                        left: size.iScreen(0.5),
                        top: size.iScreen(0.5),
                        bottom: size.iScreen(0.5),
                      ),
                      margin: EdgeInsets.only(bottom: size.iScreen(0.1)),
                      child: Text('Trabajos de Investigación / 7.00',
                          style: GoogleFonts.roboto(
                            fontSize: size.iScreen(1.8),
                          ))),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: size.iScreen(0.7)),
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    top: size.iScreen(2.0),
                                    left: size.iScreen(0.0),
                                    right: size.iScreen(0.0)),
                                height: size.iScreen(10.0),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.transparent)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    _ItemNota(
                                      size: size,
                                      item: 'T1',
                                      nota: //'5.5',
                                          '${this.materiaInfo.notTrabajo1}',
                                    ),
                                    _ItemNota(
                                      size: size,
                                      item: 'T2',
                                      nota: //'5.5',
                                          '${this.materiaInfo.notTrabajo2}',
                                    ),
                                    _ItemNota(
                                      size: size,
                                      item: 'T3',
                                      nota: //'5.5',
                                          '${this.materiaInfo.notTrabajo3}',
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
                        width: size.wScreen(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                                margin:
                                    EdgeInsets.only(bottom: size.iScreen(1.0)),
                                child: Text('Sumatoria',
                                    style: GoogleFonts.roboto(
                                      fontSize: size.iScreen(1.7),
                                    ))),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.iScreen(1.0)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.iScreen(0.4)),
                                decoration: BoxDecoration(
                                    color: this.colorSecundario,
                                    border:
                                        Border.all(color: Colors.transparent)),
                                child: Text(this.sumaTrabajos.toString(),
                                    style: GoogleFonts.roboto(
                                        fontSize: size.iScreen(2.2),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white))),
                          ],
                        ),
                      ),
                    ],
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
              child: Column(
                children: [
                  Container(
                      width: size.wScreen(100),
                      padding: EdgeInsets.only(
                        left: size.iScreen(0.5),
                        top: size.iScreen(0.5),
                        bottom: size.iScreen(0.5),
                      ),
                      margin: EdgeInsets.only(bottom: size.iScreen(0.1)),
                      child: Text('Evaluación Parcial / 3.00',
                          style: GoogleFonts.roboto(
                            fontSize: size.iScreen(1.8),
                          ))),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: size.iScreen(0.7)),
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    top: size.iScreen(2.0),
                                    left: size.iScreen(0.0),
                                    right: size.iScreen(0.0)),
                                height: size.iScreen(10.0),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.transparent)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        _ItemNota(
                                          size: size,
                                          item: 'Eval',
                                          nota: //'5.5',
                                              '${this.materiaInfo.notEvaluacion}',
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
                            // color: Colors.red,
                            border: Border.all(color: Colors.transparent)),
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                        width: size.wScreen(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                                margin:
                                    EdgeInsets.only(bottom: size.iScreen(1.0)),
                                child: Text('Cuantitativo',
                                    style: GoogleFonts.roboto(
                                      fontSize: size.iScreen(1.7),
                                    ))),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.iScreen(0.0)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.iScreen(0.5),
                                    vertical: size.iScreen(0.5)),
                                decoration: BoxDecoration(
                                    color: this.colorTerciario,
                                    border:
                                        Border.all(color: Colors.transparent)),
                                child:
                                    Text('${this.materiaInfo.notCualitativo}',
                                        style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.7),
                                          fontWeight: FontWeight.w500,
                                        ))),
                          ],
                        ),
                      ),
                    ],
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
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: size.iScreen(0.0),
                                right: size.iScreen(0.0)),
                            height: size.iScreen(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.iScreen(0.5)),
                                    margin: EdgeInsets.only(
                                        bottom: size.iScreen(0.1)),
                                    child: Text('Asistencia  %',
                                        style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.8),
                                        ))),
                                Row(
                                  children: <Widget>[
                                    _ItemNota(
                                      size: size,
                                      item: 'Asist',
                                      nota: //'5.5',
                                          '${this.materiaInfo.notPorAsistencia}',
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
                    padding: EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                    width: size.wScreen(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: size.iScreen(1.0)),
                            child: Text('Cuantitativo',
                                style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.7),
                                ))),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.iScreen(1.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.iScreen(0.5),
                                vertical: size.iScreen(0.5)),
                            decoration: BoxDecoration(
                                color: this.colorTerciario,
                                border: Border.all(color: Colors.transparent)),
                            child: Text(
                                '${this.materiaInfo.notCualiAsistencia}',
                                style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87))),
                      ],
                    ),
                  ),
                ],
              )),
          // PROMEDIO PRIMER PARCIAL

          Container(
              padding: EdgeInsets.only(right: size.iScreen(0.0)),
              decoration: BoxDecoration(
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
                            left: size.iScreen(2.3), right: size.iScreen(2.0)),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Text('PROMEDIO PARCIAL',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(2.3),
                            ))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: size.iScreen(0.5)),
                    width: size.wScreen(20.0),
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                        decoration: BoxDecoration(
                            color: this.colorSecundario,
                            border: Border.all(color: Colors.transparent)),
                        child: Text('${this.materiaInfo.notPromedio}',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(2.5),
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ))),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class Recuperacion extends StatelessWidget {
  final List<Globale> globales;
  final String banner;
  final Color colorPrimario;
  final Color colorSecundario;
  final Color colorTerciario;
  Recuperacion({
    Key key,
    @required this.size,
    @required this.colorPrimario,
    @required this.colorSecundario,
    @required this.colorTerciario,
    @required this.banner,
    @required this.globales,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.iScreen(1.0), vertical: size.iScreen(0.5)),
            width: size.wScreen(100),
            decoration: BoxDecoration(
                color: this.colorPrimario,
                border: Border.all(color: Colors.transparent)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('RECUPERACIÓN',
                    style: GoogleFonts.roboto(
                      fontSize: size.iScreen(1.9),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
                Text('Sobre 10 puntos',
                    style: GoogleFonts.roboto(
                      fontSize: size.iScreen(1.9),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
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
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: size.iScreen(0.0),
                                right: size.iScreen(0.0)),
                            height: size.iScreen(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.iScreen(0.5)),
                                    margin: EdgeInsets.only(
                                        bottom: size.iScreen(0.1)),
                                    child: Text('Exámen Supletorio',
                                        style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.8),
                                        ))),
                                _ItemNota(
                                    size: size,
                                    item: 'Exa',
                                    nota: (globales[0].supInfo != null)
                                        ? '${globales[0].supInfo.split(",")[2].split(":")[1].replaceAll('"', "")}'
                                        : '0.00'),
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
                    padding: EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                    width: size.wScreen(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: size.iScreen(1.0)),
                            child: Text('Cualitativo',
                                style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.7),
                                  // fontWeight: FontWeight.w500,
                                ))),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.iScreen(1.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.iScreen(0.5),
                                vertical: size.iScreen(0.5)),
                            decoration: BoxDecoration(
                                color: this.colorTerciario,
                                border: Border.all(color: Colors.transparent)),
                            child: Text(
                                (globales[0].supInfo != null)
                                    ? '${globales[0].supInfo.split(",")[5].split(":")[1].replaceAll("\}", "").replaceAll("\"", "")}'
                                    : 'NO DEFINIDO',
                                // 'REPROBADO',
                                style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.7),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ))),
                      ],
                    ),
                  ),
                ],
              )),
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
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(
                            left: size.iScreen(2.3), right: size.iScreen(2.0)),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Text('PROMEDIO RECUPERACIÒN',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(2.3),
                            ))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: size.iScreen(0.5)),
                    width: size.wScreen(20.0),
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                        decoration: BoxDecoration(
                            color: this.colorSecundario,
                            border: Border.all(color: Colors.transparent)),
                        child: Text(
                            (globales[0].supInfo != null)
                                ? '${globales[0].supInfo.split(",")[1].split(":")[1].replaceAll("\}", "").replaceAll("\"", "")}'
                                : '0.00',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(2.2),
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ))),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class Parcial extends StatelessWidget {
  final double sumaTrabajos;

  final Materia materiaInfo;
  final String banner;
  Parcial({
    Key key,
    @required this.size,
    @required this.colorSecundario,
    @required this.banner,
    @required this.colorPrimario,
    @required this.colorTerciario,
    @required this.materiaInfo,
    @required this.sumaTrabajos,
  }) : super(key: key);

  final Responsive size;
  final Color colorSecundario;
  final Color colorPrimario;
  final Color colorTerciario;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.iScreen(1.5), vertical: size.iScreen(0.5)),
            width: size.wScreen(100),
            decoration: BoxDecoration(
                color: this.colorPrimario,
                border: Border.all(color: Colors.transparent)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(this.banner,
                    style: GoogleFonts.roboto(
                      fontSize: size.iScreen(1.9),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
                Text('Sobre 10 puntos',
                    style: GoogleFonts.roboto(
                      fontSize: size.iScreen(1.9),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
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
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: size.iScreen(0.0),
                                right: size.iScreen(0.0)),
                            height: size.iScreen(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.iScreen(0.5)),
                                    margin: EdgeInsets.only(
                                        bottom: size.iScreen(0.1)),
                                    child:
                                        Text('Trabajos de Investigación / 4.00',
                                            style: GoogleFonts.roboto(
                                              fontSize: size.iScreen(1.8),
                                            ))),
                                Row(
                                  children: <Widget>[
                                    _ItemNota(
                                      size: size,
                                      item: 'T1',
                                      nota: '${this.materiaInfo.notTrabajo1}',
                                    ),
                                    _ItemNota(
                                      size: size,
                                      item: 'T2',
                                      nota: '${this.materiaInfo.notTrabajo2}',
                                    ),
                                    _ItemNota(
                                      size: size,
                                      item: 'T3',
                                      nota: '${this.materiaInfo.notTrabajo3}',
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
                    padding: EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                    width: size.wScreen(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: size.iScreen(1.0)),
                            child: Text('Sumatoria',
                                style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.7),
                                ))),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.iScreen(1.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.iScreen(0.4)),
                            decoration: BoxDecoration(
                                color: this.colorSecundario,
                                border: Border.all(color: Colors.transparent)),
                            child: Text(this.sumaTrabajos.toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.2),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
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
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: size.iScreen(0.0),
                                right: size.iScreen(0.0)),
                            height: size.iScreen(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent)),
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
                                        style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.8),
                                        ))),
                                Row(
                                  children: <Widget>[
                                    _ItemNota(
                                      size: size,
                                      item: 'Eval',
                                      nota: '${this.materiaInfo.notEvaluacion}',
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
                    padding: EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                    width: size.wScreen(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: size.iScreen(1.0)),
                            child: Text('Cuantitativo',
                                style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.7),
                                ))),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.iScreen(0.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.iScreen(0.5),
                                vertical: size.iScreen(0.5)),
                            decoration: BoxDecoration(
                                color: this.colorTerciario,
                                border: Border.all(color: Colors.transparent)),
                            child: Text('${this.materiaInfo.notCualitativo}',
                                style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.7),
                                  fontWeight: FontWeight.w500,
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
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: size.iScreen(0.0),
                                right: size.iScreen(0.0)),
                            height: size.iScreen(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.iScreen(0.5)),
                                    margin: EdgeInsets.only(
                                        bottom: size.iScreen(0.1)),
                                    child: Text('Asistencia  %',
                                        style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.8),
                                        ))),
                                Row(
                                  children: <Widget>[
                                    _ItemNota(
                                      size: size,
                                      item: 'Asist',
                                      nota:
                                          '${this.materiaInfo.notPorAsistencia}',
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
                    padding: EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                    width: size.wScreen(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: size.iScreen(1.0)),
                            child: Text('Cuantitativo',
                                style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(1.7),
                                ))),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.iScreen(1.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.iScreen(0.5),
                                vertical: size.iScreen(0.5)),
                            decoration: BoxDecoration(
                                color: this.colorTerciario,
                                border: Border.all(color: Colors.transparent)),
                            child: Text(
                                '${this.materiaInfo.notCualiAsistencia}',
                                style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(1.7),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87))),
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
                            left: size.iScreen(2.3), right: size.iScreen(2.0)),
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: Text('PROMEDIO PARCIAL',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(2.3),
                            ))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent)),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: size.iScreen(0.5)),
                    width: size.wScreen(20.0),
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                        decoration: BoxDecoration(
                            color: this.colorSecundario,
                            border: Border.all(color: Colors.transparent)),
                        child: Text('${this.materiaInfo.notPromedio}',
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(2.5),
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ))),
                  ),
                ],
              )),
        ],
      ),
    );
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
  final String materia;
  final String periodo;
  final String docente;
  final Color colorSecundario;
  _Cabecera({
    Key key,
    @required this.size,
    @required this.colorSecundario,
    @required this.materia,
    @required this.periodo,
    @required this.docente,
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
              color: colorSecundario,
              child: Text(
                this.materia, //Tecnología Superior en Comercio Exterior//AUIN VA ELA MATERIA SELECCIONADA
                style: GoogleFonts.roboto(
                  fontSize: size.iScreen(2.1),
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                border: Border(
                  bottom: BorderSide(
                    color: this.colorSecundario,
                    width: 1.0,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Docente : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.iScreen(1.8),
                        ),
                      ),
                      Text(
                          // 'No Data',
                          '${this.docente}', //AQUI VA EL NOMBRE DEL DOCENTE
                          style: GoogleFonts.roboto(
                            fontSize: size.iScreen(1.8),
                          )),
                    ],
                  ),
                  Container(
                    width: size.wScreen(100),
                    child: Text(
                      // 'PERIODO',
                      '${this.periodo}', //AQUI VA EL PERIODO
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
