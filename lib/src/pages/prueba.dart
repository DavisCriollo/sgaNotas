import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sgaapp/src/providers/DropDownProvider.dart';
import 'package:sgaapp/src/utils/autenticacion.dart';
import 'package:sgaapp/src/utils/responsive.dart';
import 'package:sgaapp/src/widgets/Menu_Drawer.dart';

class Prueba extends StatefulWidget {
  Prueba({Key key}) : super(key: key);

  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> with WidgetsBindingObserver {
  final cursosProvider = new DropDownProvider();

  _check() async {
    final Session session = await Auth.instance.getSession();

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
    // COLORES PARA LAS CALIFICACIONES
    final Color colorReprobado = Color(0xFFD9544F);
    final Color colorRecuperacion = Color(0xFFEFAD4D);
    final Color colorBueno = Color(0xFF1DA1F2);
    final Color colorMuyBueno = Color(0xFF0075D8);
    final Color colorExelente = Color(0xFF5BB85D);
    Color color;
    final Responsive size = Responsive.of(context);

// PROVIDER
    final selectProvider = Provider.of<DropDownProvider>(context);

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
                padding: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
                width: size.wScreen(100),
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                ),
                child: DropdownButton<String>(
                  value: selectProvider.especialidadSeleccionada,
                  isExpanded: true,
                  iconSize: size.iScreen(3.5),
                  hint: Text(
                    'Seleccione Especialidad',
                    style: GoogleFonts.roboto(
                        fontSize: size.iScreen(2.0),
                        color: Colors.black87,
                        fontWeight: FontWeight.normal),
                  ),
                  items: selectProvider.especialidades != null
                      ? selectProvider.especialidades.map((e) {
                          return DropdownMenuItem<String>(
                            child: Center(
                              child: Text(e.notEspecialidad,
                                  style: GoogleFonts.roboto(
                                      fontSize: size.iScreen(1.9),
                                      color: Colors.black87,
                                      fontWeight: FontWeight.normal)),
                            ),
                            value: e.notEspecialidad,
                          );
                        })?.toList()
                      : null,
                  onChanged: (String values) {
                    // print('-->$values');
                    selectProvider.setEspecialidad(values);
                  },
                ),
              ),
              //****************************** PERIODO  ********************************//
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
                width: size.wScreen(100),
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                ),
                child: DropdownButton<String>(
                  value: selectProvider.periodoSeleccionado,
                  isExpanded: true,
                  iconSize: size.iScreen(3.5),
                  hint: Text(
                    'Seleccione Periodo',
                    style: GoogleFonts.roboto(
                        fontSize: size.iScreen(2.0),
                        color: Colors.black87,
                        fontWeight: FontWeight.normal),
                  ),
                  items: selectProvider.periodos != null
                      ? selectProvider.periodos.map((e) {
                          return DropdownMenuItem<String>(
                            child: Center(
                              child: Text(e.notPeriodo,
                                  style: GoogleFonts.roboto(
                                      fontSize: size.iScreen(1.9),
                                      color: Colors.black87,
                                      fontWeight: FontWeight.normal)),
                            ),
                            value: e.notPeriodo,
                          );
                        })?.toList()
                      : null,
                  onChanged: (String values) {
                    print('-->$values');
                    selectProvider.setPeriodo = values;
                  },
                ),
              ),
              //****************************** CURSO  ********************************//
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
                width: size.wScreen(100),
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                ),
                child: DropdownButton<String>(
                  value: selectProvider.cursoSeleccionado,
                  isExpanded: true,
                  iconSize: size.iScreen(3.5),
                  hint: Text(
                    'Seleccione Curso',
                    style: GoogleFonts.roboto(
                        fontSize: size.iScreen(2.0),
                        color: Colors.black87,
                        fontWeight: FontWeight.normal),
                  ),
                  items: selectProvider.periodos == null
                      ? null
                      : selectProvider.curso != null
                          ? selectProvider.curso.map((e) {
                              return DropdownMenuItem<String>(
                                child: Center(
                                  child: Text(e.notCurso,
                                      style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.9),
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal)),
                                ),
                                value: e.notCurso,
                              );
                            })?.toList()
                          : null,
                  onChanged: (String values) {
                    print('-->$values');
                    selectProvider.setCurso = values;
                  },
                ),
              ),

              //========================= MUSTRA INFORMACION INICIAL  =======================//
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(size.iScreen(5.0)),
                  // color: Colors.red,
                  width: size.iScreen(100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ),
              )
              //=============================================================================//
            ],
          ),
        ),
      ),
    );
  }

  _verificaEspecialidad(Responsive size) {
    //****************************** PERIODO  ********************************//
    Container(
      padding: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
      width: size.wScreen(100),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
      ),
      child: DropdownButton<String>(
        value: null,
        isExpanded: true,
        iconSize: size.iScreen(3.5),
        hint: Text(
          'Seleccione Periodo',
          style: GoogleFonts.roboto(
              fontSize: size.iScreen(2.0),
              color: Colors.black87,
              fontWeight: FontWeight.normal),
        ),
        items: null,
        onChanged: (String values) {
          print('-->$values');
        },
      ),
    );
  }
}
