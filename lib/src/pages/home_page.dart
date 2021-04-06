import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:google_fonts/google_fonts.dart';
// import 'package:path/path.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:sgaapp/src/Models/materiasSelect.dart';
import 'package:sgaapp/src/providers/selectoresProvider.dart';
import 'package:sgaapp/src/utils/autenticacion.dart';
import 'package:sgaapp/src/utils/calculos.dart';
import 'package:sgaapp/src/utils/responsive.dart';
import 'package:sgaapp/src/widgets/Menu_Drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
// class _HomePageState extends State<HomePage> {
  final cursosProvider = new SelectProvider();

  _check() async {
    final Session session = await Auth.instance.getSession();
    // final SaveSession session = await Auth.instance.getSession();

    if (session != null) {
      print('FUE LOGUEADO');
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      print('CERRO SESION ');
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

// COMPARTIR INFO CON FLUTTER-SHARE

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  void _cerrarServicio() {
    print('CERRAR LOS SERVICIOS');
    // Auth.instance.logOut(context);
  }

  void _activarServicio() {
    print('ABRIR LOS SERVICIOS');

    _check();
  }

  @override
  void initState() {
    // Auth.instance.logOut(context);

//************** INSTANCIO EL OBSERVABLE PARA VER EL ESTADO DE LA APLICACION ***************//
    WidgetsBinding.instance.addObserver(this);
    super.initState();
//************** CONTADOR PARA CERRAR SESION ***************//
    Timer(Duration(minutes: 15), () {
      Auth.instance.logOut(context);
    });
// *******************************************************************//
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        //  CERRAR LOS SERVICIOS ACTIVOS
        _cerrarServicio();

        break;
      case AppLifecycleState.resumed:
        //  ABRIR LOS SERVICIOS
        _activarServicio();
        break;
      case AppLifecycleState.inactive:
        //  CERRAR TODOS LOS SERVICIOS ACTIVOS
        _cerrarServicio();
        break;
      default:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: cursosProvider,
        builder: (_, __) {
// COLORES PARA LAS CALIFICACIONES
          final Color colorReprobado = Color(0xFFD9544F);
          final Color colorRecuperacion = Color(0xFFEFAD4D);
          final Color colorBueno = Color(0xFF1DA1F2);
          final Color colorMuyBueno = Color(0xFF0075D8);
          final Color colorExelente = Color(0xFF5BB85D);
          Color color;
          final Responsive size = Responsive.of(context);

          return Scaffold(
              appBar: AppBar(
                  title: Container(
                alignment: Alignment.center,
                width: size.wScreen(70),
                // color: Colors.red,
                child: Text(
                  'Mis Asignaturas',
                  style: GoogleFonts.roboto(
                    fontSize: size.iScreen(3.0),
                  ),
                ),
              )),
              // ========================================
              drawer: MenuDrawer(size: size),
              //========================================
              body: SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      //****************************** ESPECIALIDAD  ********************************//
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
                        width: size.wScreen(100),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          // border: Border(
                          //   bottom: BorderSide(
                          //     // color: Color(0xFFFF0000),
                          //     // width: 3.0,
                          //   ),
                          // ),
                        ),
                        child: Consumer<SelectProvider>(
                            builder: (_, snapshot, __) {
                          if (snapshot == null ||
                              snapshot.especialidades == null) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return DropdownButton<String>(
                            value: snapshot.especialidadesSeleccionado,
                            isExpanded: true,
                            iconSize: size.iScreen(3.5),
                            hint: Text(
                              'Seleccione Especialidad',
                              style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(2.0),
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal),
                            ),
                            items: snapshot.especialidades.map((especialidad) {
                              return DropdownMenuItem<String>(
                                child: Center(
                                  child: Text(especialidad.notEspecialidad,
                                      style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.9),
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal)),
                                ),
                                value: especialidad.notEspecialidad,
                              );
                            })?.toList(),
                            onChanged: (String values) {
                              // print('-->$values');
                              snapshot.setespecialiadad = values;
                            },
                          );
                        }),
                      ),
                      //****************************** PERIODO  ********************************//
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
                        width: size.wScreen(100),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          // border: Border(
                          //   bottom: BorderSide(
                          //     // color: Color(0xFFFF0000),
                          //     // width: 3.0,
                          //   ),
                          // ),
                        ),
                        child: Consumer<SelectProvider>(
                          builder: (_, snapshot, __) {
                            if (snapshot == null && snapshot.periodos == null) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.periodos == null ||
                                snapshot.periodos.isEmpty) {
                              return Container(
                                  child: Text('No hay informacion'));
                            }
                            return DropdownButton<String>(
                              value: snapshot.periodoSeleccionado,
                              isExpanded: true,
                              iconSize: size.iScreen(3.5),
                              hint: Text(
                                'Seleccione Periodo',
                                style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.0),
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal),
                              ),
                              items: snapshot.periodos.map((periodo) {
                                return DropdownMenuItem<String>(
                                  child: Center(
                                    child: Text(periodo.notPeriodo,
                                        style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.9),
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  value: periodo.notPeriodo,
                                );
                              }).toList(),
                              onChanged: (String values) {
                                // print('-->$values');
                                snapshot.setPeriodo = values;
                              },
                            );
                          },
                        ),
                      ),
                      //****************************** CURSO ********************************//
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
                        width: size.wScreen(100),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          border: Border(
                            bottom: BorderSide(
                              // color: Color(0xFFFF0000),
                              color: Color(0xFFc6c6c6),
                              width: 3.0,
                            ),
                          ),
                        ),
                        child: Consumer<SelectProvider>(
                          builder: (_, snapshot, __) {
                            if (snapshot == null && snapshot.cursos == null) {
                              return CircularProgressIndicator();
                            }
                            if (snapshot.cursos == null ||
                                snapshot.cursos.isEmpty) {
                              return Container(
                                  child: Text('No hay informacion'));
                            }
                           
                            return DropdownButton<String>(
                              value: snapshot.cursoSeleccionado,
                              isExpanded: true,
                              iconSize: size.iScreen(3.5),
                              hint: Text(
                                'Seleccione Curso',
                                style: GoogleFonts.roboto(
                                    fontSize: size.iScreen(2.0),
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal),
                              ),
                              items: snapshot.cursos.map((curso) {
                                return DropdownMenuItem<String>(
                                  child: Center(
                                    child: Text(curso.notCurso,
                                        style: GoogleFonts.roboto(
                                            fontSize: size.iScreen(1.9),
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  value: curso.notCurso,
                                );
                              }).toList(),
                              onChanged: (String values) {
                                // print('-->$values');
                                snapshot.setCurso = values;
                              },
                            );
                          },
                        ),
                      ),

                      //******************************************************/
                      Expanded(
                        child: Consumer<SelectProvider>(
                            builder: (_, provider, __) {
                          if (provider == null &&
                              provider.materiaObtenida == null) {
                            return CircularProgressIndicator();
                          }
                          if (provider.materiaObtenida.isEmpty) {
                            return Container(
                              padding: EdgeInsets.all(size.iScreen(5.0)),
                              // color: Colors.red,
                              width: size.iScreen(100.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                      'Seleccione la información solicitada para mostrar las materias',
                                      style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(2.0),
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold)),
                                  Center(
                                    child: Image.asset(
                                      'assets/imgs/logo-capa.png',
                                      width: size.iScreen(30.0),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          if (provider.materiaObtenida.isEmpty) {
                            return Container(
                              child: Text('No hay dados'),
                            );
                          }
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: provider.materiaObtenida.length,
                            itemBuilder: (BuildContext context, int index) {
                              final materia = provider.materiaObtenida[index];

                              final materias = materia;
                              // SEPARO LOS PROMEDIOS PARCIALES
                              final List<String> tmpParcial =
                                  materia.parciales.split(',');
                              final parcial1 = tmpParcial[0];
                              final parcial2 = tmpParcial[1];
                              // SUMO LOS PROMEDIOS PROMEDIOS
                              final List<String> tmpPromedio =
                                  materia.promedios.split(',');
                              final promedio1 = double.parse(tmpPromedio[0]);
                              final promedio2 = double.parse(tmpPromedio[1]);
                              final promResult = promedio1 + promedio2;
                              // REDONDEO EL PROMEDIO OBTENIDO
                              final resuladoPromedio = Calculos.instance
                                  .redondeaDouble(promResult, 2);
                              // SUMO LAS ASISTENCIAS
                              final List<String> tmpasistencia =
                                  materia.asistencias.split(',');
                              final asistencia1 =
                                  double.parse(tmpasistencia[0]);
                              final asistencia2 =
                                  double.parse(tmpasistencia[1]);
                              final asistResult = asistencia1 + asistencia2;
                              // REDONDEO EL PROMEDIO OBTENIDO
                              final resuladoAsistencia = Calculos.instance
                                  .redondeaDouble(asistResult, 2);
                              if (resuladoPromedio >= 0 &&
                                  resuladoPromedio <= 4.99) {
                                color = colorReprobado;
                              } else if (resuladoPromedio >= 5 &&
                                  resuladoPromedio <= 6.99) {
                                color = colorRecuperacion;
                              } else if (resuladoPromedio >= 7.00 &&
                                  resuladoPromedio <= 7.99) {
                                color = colorBueno;
                              } else if (resuladoPromedio >= 8.00 &&
                                  resuladoPromedio <= 8.99) {
                                color = colorMuyBueno;
                              } else if (resuladoPromedio >= 9.00 &&
                                  resuladoPromedio <= 10.00) {
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
                        }),
                      ),
                      //*************************************************************** */
                    ],
                  ),
                ),
              ));
        });
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
      padding:
          EdgeInsets.only(top: size.iScreen(1.0), bottom: size.iScreen(1.0)),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: size.iScreen(0.5),
                        vertical: size.iScreen(0.5)),
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.5)),
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.5)),
                              color: Colors.grey,
                              width: size.iScreen(0.12),
                              height: size.iScreen(3.0),
                            ),
                            // ***********************/
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.5)),
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.5)),
                              color: Colors.grey,
                              width: size.iScreen(0.12),
                              height: size.iScreen(3.0),
                            ),
                            // ***********************/
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.5)),
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.iScreen(0.5)),
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
                      margin:
                          EdgeInsets.symmetric(horizontal: size.iScreen(0.5)),
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

                        Navigator.pushNamed(context, 'materiaDetalle',
                            arguments: data);
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
