

// import 'package:sgaNeitor/src/urls/urls.dart' as urls;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgaapp/src/Models/loginModel.dart';
import 'package:sgaapp/src/services/api.dart';
import 'package:sgaapp/src/urls/urls.dart' as urls;
import 'package:sgaapp/src/utils/responsive.dart';
import 'package:sgaapp/src/widgets/inputs_login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            // height: size.hScreen(100),
            // width: size.wScreen(100),
            child: Stack(
              // alignment: Alignment.center,
              children: [
                _Fondo(size: size),
                Container(
                  width: size.wScreen(100),
                  height: size.height,
                  child: Column(
                    children: [
                      SafeArea(
                        child: Container(
                          child: _Logo(size: size),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: _Form(size: size),
                        ),
                      ),
                      SafeArea(
                        top: false,
                        child: Container(
                          child: _InfoLogo(size: size),
                        ),
                      ),
                    ],
                  ),
                ),
                // _Logo(size: size),
                // _Form(size: size),
                // _InfoLogo(size: size),
              ],
            ),
          ),
        ),
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

class _InfoLogo extends StatelessWidget {
  const _InfoLogo({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.iScreen(15.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: size.iScreen(1.0),
            ),
            height: size.iScreen(7.0),
            child: Image.asset('assets/imgs/sgalogo.png'),
          ),
          Container(
            color: Color(0xFF51C1E1),
            height: size.iScreen(7.0),
            padding: EdgeInsets.all(size.iScreen(1.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Contáctanos',
                        style: GoogleFonts.roboto(
                          fontSize: size.iScreen(1.8),
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: size.iScreen(3.0),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    urls.abrirPagina2Jl();
                  },
                  child: Text('https://2jl.ec',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.8),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    urls.abrirPaginaNeitor();
                  },
                  child: Text('https://neitor.com',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(1.8),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  GlobalKey<FormState> _formKey = new GlobalKey();

  LoginModel login = new LoginModel();
  _submit() async {
    final isOk = _formKey.currentState.validate();
    _formKey.currentState.save();

    if (isOk) {
      Api.instance.login(context, login: login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.wScreen(100),
      padding: EdgeInsets.symmetric(
          horizontal: widget.size.iScreen(5.0),
          vertical: widget.size.iScreen(5.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputsLogin(
                    initialValue: login.usuario,
                    keyboardType: TextInputType.text,
                    size: widget.size,
                    icon: FontAwesomeIcons.userAlt,
                    hinText: 'Usuario',
                    isPassword: false,
                    onSaved: (value) => login.usuario = value,
                    // onSaved: (value)=>_email= value,
                    onChanged: (text) {
                      // print("user:$text");
                      // _email = text;
                    },
                    validator: (text) {
                      if (text.trim().length == 0) {
                        return 'Ingrese Usuario o Correo';
                      }
                      return null;
                    },
                  ),
                  InputsLogin(
                    initialValue: login.password,
                    size: widget.size,
                    icon: FontAwesomeIcons.lock,
                    hinText: 'Contraseña',
                    isPassword: true,
                    onSaved: (text) => login.password = text,
                    //  onSaved: (text)=> _password = text,
                    onChanged: (text) {
                      // print("pas:$text");
                      // _password = text;
                    },
                    validator: (text) {
                      if (text.trim().length == 0) {
                        return 'Agregar contraseña';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: widget.size.iScreen(2.0)),
                width: widget.size.iScreen(100),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.blueAccent),
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FlatButton(
                  color: Color(0xFFFF0000),
                    child: Text('Ingresar',
                        style: GoogleFonts.roboto(
                            fontSize: widget.size.iScreen(2.5),
                            color: Colors.white)),
                    onPressed: _submit),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: widget.size.iScreen(1.5)),
                width: widget.size.wScreen(100),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'restaurarPass');
                  },
                  child: Text(
                    'Olvidé mi contraseña',
                    style: GoogleFonts.roboto(
                        fontSize: widget.size.iScreen(1.8),
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        ],
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
      width: size.iScreen(100),
      child: Image.asset(
        'assets/imgs/logo-capa.png',
        height: size.iScreen(15.0),
      ),
    );
  }
}



