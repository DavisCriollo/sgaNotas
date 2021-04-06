import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:sgaapp/src/utils/autenticacion.dart';

// import 'package:sgaapp/src/utils/autenticacion.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    this._check();
  }

  _check() async {
    final Session session = await Auth.instance.getSession();
    // final SaveSession session = await Auth.instance.getSession();

    if (session != null) {
      print('FUE LOGUEADO');
      Navigator.pushReplacementNamed(context, 'home');
      // Navigator.pushReplacementNamed(context, 'prueba');
    } else {
      print('CERRO SESION ');
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
