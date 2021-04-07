import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sgaapp/src/pages/home/home_controller.dart';

import '../../../Models/materiasSelect.dart';
import '../../../utils/calculos.dart';
import '../../../utils/responsive.dart';

class Materias extends StatelessWidget {
  const Materias({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    final controller = context.watch<HomeController>();
    // COLORES PARA LAS CALIFICACIONES
    final Color colorReprobado = Color(0xFFD9544F);
    final Color colorRecuperacion = Color(0xFFEFAD4D);
    final Color colorBueno = Color(0xFF1DA1F2);
    final Color colorMuyBueno = Color(0xFF0075D8);
    final Color colorExelente = Color(0xFF5BB85D);
    Color color;

    final datos = controller.state.datos;
    if (datos.isEmpty) {
      return Container(
        child: Text("Selccione los datos"),
      );
    }
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: datos.length,
      itemBuilder: (BuildContext context, int index) {
        final materia = datos[index];

        final materias = materia;
        // SEPARO LOS PROMEDIOS PARCIALES
        final List<String> tmpParcial = materia.parciales.split(',');
        final parcial1 = tmpParcial[0];
        final parcial2 = tmpParcial.length > 1 ? tmpParcial[1] : '0.0';
        // SUMO LOS PROMEDIOS PROMEDIOS
        final List<String> tmpPromedio = materia.promedios.split(',');
        final promedio1 = double.parse(tmpPromedio[0]);
        final promedio2 = double.parse(tmpParcial.length > 1 ? tmpPromedio[1] : '0.0');
        final promResult = promedio1 + promedio2;
        // REDONDEO EL PROMEDIO OBTENIDO
        final resuladoPromedio = Calculos.instance.redondeaDouble(promResult, 2);
        // SUMO LAS ASISTENCIAS
        final List<String> tmpasistencia = materia.asistencias.split(',');
        final asistencia1 = double.parse(tmpasistencia[0]);
        final asistencia2 = double.parse(tmpasistencia.length > 1 ? tmpasistencia[1] : '0.0');
        final asistResult = asistencia1 + asistencia2;
        // REDONDEO EL PROMEDIO OBTENIDO
        final resuladoAsistencia = Calculos.instance.redondeaDouble(asistResult, 2);
        if (resuladoPromedio >= 0 && resuladoPromedio <= 4.99) {
          color = colorReprobado;
        } else if (resuladoPromedio >= 5 && resuladoPromedio <= 6.99) {
          color = colorRecuperacion;
        } else if (resuladoPromedio >= 7.00 && resuladoPromedio <= 7.99) {
          color = colorBueno;
        } else if (resuladoPromedio >= 8.00 && resuladoPromedio <= 8.99) {
          color = colorMuyBueno;
        } else if (resuladoPromedio >= 9.00 && resuladoPromedio <= 10.00) {
          color = colorExelente;
        }
        return _ItemMateria(
          infomateria: materias,
          color: color,
          size: size,
          // page: 'materiaDetalle',
          materia: '${materia.notMateria}',
          p1: (parcial1.length > 0) ? '$parcial1' : '0.0',
          p2: (parcial2.length > 0) ? '$parcial2' : '0.0',
          pf: '${resuladoPromedio.toString()}',
          promedio: 100,
          percent: resuladoPromedio / 10,
          asistencia: '${resuladoAsistencia.toString()}',
        );
      },
    );
  }
}

class _ItemMateria extends StatelessWidget {
  final MateriasSelect infomateria;
  final String p1;
  final String p2;
  final String pf;
  final String asistencia;
  final double percent;
  final double promedio;
  final String materia;
  final Color color;
  _ItemMateria({
    Key key,
    @required this.size,
    // @required this.page,
    @required this.materia,
    @required this.promedio,
    @required this.color,
    @required this.p1,
    @required this.p2,
    @required this.pf,
    @required this.percent,
    @required this.asistencia,
    @required this.infomateria,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    // final  materia= Api.instance.getMaterias(context);
    double porcentaje = Calculos.instance.redondeaDouble(this.percent * 100, 2);

    return Container(
      width: size.wScreen(100),
      margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
      padding: EdgeInsets.only(top: size.iScreen(1.0), bottom: size.iScreen(1.0)),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Color(0xFFF2F2F2),
          width: 5.0,
        ),
      )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(size.iScreen(1.0)),
                    width: size.iScreen(2.0),
                    height: size.iScreen(2.0),
                    decoration: BoxDecoration(
                      color: this.color,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Container(
                    width: size.wScreen(57.0),
                    padding: EdgeInsets.symmetric(horizontal: size.iScreen(0.5), vertical: size.iScreen(0.5)),
                    // color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.red,
                          padding: EdgeInsets.only(bottom: size.iScreen(0.5)),
                          child: Text(
                            this.materia,
                            style: GoogleFonts.roboto(
                              fontSize: size.iScreen(1.5),
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                              child: Column(
                                children: [
                                  Text(
                                    'P1',
                                    style: GoogleFonts.roboto(
                                        fontSize: size.iScreen(1.5),
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '$p1',
                                    style: GoogleFonts.roboto(
                                      fontSize: size.iScreen(1.8),
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SEPARADOR
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                              color: Colors.grey,
                              width: size.iScreen(0.12),
                              height: size.iScreen(3.0),
                            ),
                            // ***********************/
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                              child: Column(
                                children: [
                                  Text(
                                    'P2',
                                    style: GoogleFonts.roboto(
                                        fontSize: size.iScreen(1.5),
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '$p2',
                                    style: GoogleFonts.roboto(
                                      fontSize: size.iScreen(1.8),
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ), // SEPARADOR
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                              color: Colors.grey,
                              width: size.iScreen(0.12),
                              height: size.iScreen(3.0),
                            ),
                            // ***********************/
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                              child: Column(
                                children: [
                                  Text(
                                    'PF',
                                    style: GoogleFonts.roboto(
                                        fontSize: size.iScreen(1.5),
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '$pf',
                                    style: GoogleFonts.roboto(
                                      fontSize: size.iScreen(1.8),
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ***********************/
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                              child: Column(
                                children: [
                                  Text(
                                    'Asis %',
                                    style: GoogleFonts.roboto(
                                        fontSize: size.iScreen(1.5),
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '$asistencia',
                                    style: GoogleFonts.roboto(
                                      fontSize: size.iScreen(1.8),
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                // color: Colors.red,
                width: size.wScreen(30.0),
                padding: EdgeInsets.only(right: size.iScreen(1.3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: CircularPercentIndicator(
                        // backgroundColor: Colors.red,//Color de la base del Circulo
                        progressColor: this.color,
                        radius: size.iScreen(6.0),
                        lineWidth: 7.0,
                        percent: this.percent,
                        center: Text(
                          '$porcentaje',
                          style: GoogleFonts.roboto(
                            fontSize: size.iScreen(1.4),
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    // SEPARADOR
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
                      color: Colors.grey,
                      width: size.iScreen(0.12),
                      height: size.iScreen(6.0),
                    ),
                    // ***********************/
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        width: size.iScreen(3.0),
                        height: size.iScreen(3.0),
                        child: Text(
                          '+',
                          style: GoogleFonts.roboto(
                            fontSize: size.iScreen(2.5),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        Map<dynamic, dynamic> data = {
                          'color': this.color,
                          'especialidad': this.infomateria.notEspecialidad,
                          'periodo': this.infomateria.notPeriodo,
                          'curso': this.infomateria.notCurso,
                          'materia': this.infomateria.notMateria,
                        };

                        Navigator.pushNamed(context, 'materiaDetalle', arguments: data);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: size.wScreen(80),
            // color: Colors.red,
            // alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  this.infomateria.notSeccion,
                  // 'Noctuna',
                  style: GoogleFonts.roboto(
                    fontSize: size.iScreen(1.7),
                    color: Colors.black87,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: size.iScreen(6.5)),
                  child: Text(
                    'Paralelo: ${infomateria.paralelo}',
                    style: GoogleFonts.roboto(
                      fontSize: size.iScreen(1.7),
                      color: Colors.black87,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
