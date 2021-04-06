import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgaapp/src/services/api.dart';

import 'package:sgaapp/src/utils/responsive.dart';

class ContrasenaPage extends StatefulWidget {
  @override
  _ContrasenaPageState createState() => _ContrasenaPageState();
}

class _ContrasenaPageState extends State<ContrasenaPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _Fondo(size: size),
            Container(
              width: size.wScreen(100),
              height: size.hScreen(100),
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _Logo(
                      size: size,
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      width: size.wScreen(100),
                      margin:
                          EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: size.iScreen(5.0),
                            // margin: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              'Recuperar Contraseña',
                              style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(2.5),
                                  color: Colors.white),
                            ),
                          ),
                          // _InfoLogo(size: size),
                          _Body(),
                          _InfoLogo(size: size),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  GlobalKey<FormState> _formKeyCorreo = new GlobalKey();
  String _correo = "";

  _submit() async {
    final isOk = _formKeyCorreo.currentState.validate();
    _formKeyCorreo.currentState.save();
    if (isOk) {
      Api.instance.sendCorreo(context, correo: _correo);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      alignment: Alignment.center,
      width: size.wScreen(100),
      // margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: size.iScreen(1.5),
                left: size.iScreen(1.5),
                right: size.iScreen(1.5)),
            child: Column(
              children: <Widget>[
                Text(
                  'Escribe la dirección de tu correo institucional o tu usuario para realizar la recuperación de tu contraseña. En pocos minutos recibirás la contraseña solicitada en tu correo institucional.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(
                    fontSize: size.iScreen(2.1),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.only(
                top: size.iScreen(2.0),
                left: size.iScreen(2.0),
                right: size.iScreen(2.0)),
            padding: EdgeInsets.symmetric(horizontal: size.iScreen(2.0)),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Form(
              key: _formKeyCorreo,
              child: TextFormField(
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (value) {
                    // _correo = value;
                  },
                  onChanged: (text) {
                    // print("user:$text");
                    _correo = text;
                  },
                  validator: (text) {
                    if (text.trim().length == 0) {
                      return 'Ingrese Usuario o Correo';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      FontAwesomeIcons.at,
                      size: size.iScreen(2.0),
                      color: Color(0xFFdddddd),
                    ),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: 'email@atlantic.edu.ec',
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                right: size.iScreen(2.0), bottom: size.iScreen(2.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MaterialButton(
                  child: Text(
                    'Enviar',
                    style: GoogleFonts.roboto(
                      fontSize: size.iScreen(2.1),
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(193, 39, 45, 1),
                    ),
                  ),
                  // onPressed: (value) => Api.instance.login(context, correo: value),
                  onPressed: _submit,
                ),
                SizedBox(width: 20),
                GestureDetector(
                  child: Text(
                    'Salir',
                    style: GoogleFonts.roboto(
                      fontSize: size.iScreen(2.1),
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(193, 39, 45, 1),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('login');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Fondo extends StatelessWidget {
  const _Fondo({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.hScreen(100),
      child: Image.asset(
        'assets/imgs/fondoApp.png',
        fit: BoxFit.cover,
        // height: size.hScreen(100),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: size.iScreen(2.0)),
      margin: EdgeInsets.symmetric(vertical: size.iScreen(5.0)),
      width: size.iScreen(100),
      child: Image.asset(
        'assets/imgs/logo-principal.png',
        height: size.iScreen(8.0),
      ),
    );
  }
}

class _InfoLogo extends StatelessWidget {
  const _InfoLogo({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: size.iScreen(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: size.iScreen(1.0),
            ),
            height: size.iScreen(7.0),
            child: Image.asset('assets/imgs/sgalogo.png'),
          ),
        ],
      ),
    );
  }
}
