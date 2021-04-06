import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:sgaapp/src/urls/urls.dart';
import 'package:sgaapp/src/utils/responsive.dart';

class CantactosPage extends StatefulWidget {
  @override
  _CantactosPageState createState() => _CantactosPageState();
}

class _CantactosPageState extends State<CantactosPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Contactos ATLANTIC'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              _Logo(size: size),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(size.iScreen(2.0)),
                  // padding: EdgeInsets.only(
                  //     top: size.iScreen(5.0), bottom: 20.0, left: 20.0, right: 0.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // color: Colors.green,
                      border: Border.all(color: Colors.transparent)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _ItemsInfo(
                        size: size,
                        icon: FontAwesomeIcons.phoneAlt,
                        texto: ' 022762608',
                      ),
                      _ItemsInfo(
                        size: size,
                        icon: FontAwesomeIcons.mobileAlt,
                        texto: ' 0988073226',
                      ),
                      _ItemsInfo(
                        size: size,
                        icon: FontAwesomeIcons.envelope,
                        texto: 'info@atlantic.edu.ec',
                      ),
                      _ItemsInfo(
                        size: size,
                        icon: FontAwesomeIcons.mapMarkedAlt,
                        texto: 'Av.Clemencia de Mora SN y Rio Tiputini',
                      ),
                    ],
                  ),
                ),
              ),
              _SitioWeb(size: size),
              _RedesSociales(size: size),
            ],
          ),
        ));
  }
}

class _RedesSociales extends StatelessWidget {
  _RedesSociales({
    @required this.size,
  });

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
      padding:
          EdgeInsets.only(top: size.iScreen(2.5), bottom: size.iScreen(2.0)),
      decoration: BoxDecoration(
        // color: Colors.green,
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Síguenos en:',
            style: GoogleFonts.roboto(
              fontSize: size.iScreen(2.5),
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.transparent)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //INSTAGRAM
                _ItemsSocials(
                  size: size,
                  icon: FontAwesomeIcons.instagram,
                  color: Color(0xFFD04768),
                  onTap: () => abrirEnInstagramAtlantic(),
                ),
                //FACEBOOK
                _ItemsSocials(
                  size: size,
                  icon: FontAwesomeIcons.facebookF,
                  color: Color(0xFF4064AD),
                  onTap: () => abrirEnFacebookAtlantic(),
                ),

                //TWITTER
                _ItemsSocials(
                  size: size,
                  icon: FontAwesomeIcons.twitter,
                  color: Color(0xFF00B1EA),
                  onTap: () => abrirEnTwitterAtlantic(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemsSocials extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function onTap;

  _ItemsSocials({
    @required this.size,
    @required this.icon,
    @required this.color,
    this.onTap,
  });

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.iScreen(2.0), vertical: size.iScreen(2.0)),
          padding: EdgeInsets.all(size.iScreen(1.2)),
          decoration: BoxDecoration(
              color: this.color, borderRadius: BorderRadius.circular(100.0)),
          child: Icon(
            this.icon,
            size: size.iScreen(4.0),
            color: Colors.white,
          )),
      onTap: this.onTap,
    );
  }
}

class _SitioWeb extends StatelessWidget {
  const _SitioWeb({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding:
          EdgeInsets.only(bottom: size.iScreen(0.0), left: size.iScreen(0.0)),
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        children: <Widget>[
          Text('Visita nuestra web',
              style: GoogleFonts.roboto(
                fontSize: size.iScreen(2.4),
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              )
              // style: TextStyle(fontSize: 25.0, color: Colors.grey),
              ),
          GestureDetector(
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.transparent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin:
                          EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Icon(
                        FontAwesomeIcons.globe,
                        size: 25.0,
                        color: Colors.white,
                      )),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent)),
                    child: Text(
                      'https://www.atlantic.edu.ec/',
                      style: GoogleFonts.roboto(
                        fontSize: size.iScreen(2.4),
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF027FD0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              abrirPaginaAtlantic();
            },
          ),
        ],
      ),
    );
  }
}

class _ItemsInfo extends StatelessWidget {
  final IconData icon;
  final String texto;
  _ItemsInfo({
    @required this.size,
    @required this.icon,
    @required this.texto,
  });

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: size.iScreen(0.5),
              bottom: size.iScreen(0.5),
              right: size.iScreen(0.5)),
          padding: EdgeInsets.all(6.0),
          child: Icon(
            this.icon,
            size: size.iScreen(3.0),
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          width: size.wScreen(80.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
          child: SelectableText(this.texto,
              // overflow: TextOverflow.clip,
              style: GoogleFonts.roboto(
                fontSize: size.iScreen(2.0),
                fontWeight: FontWeight.w500,
                color: Color(0xFF027FD0),
              )),
        ),
      ],
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
      width: size.wScreen(100),
      margin: EdgeInsets.only(top: size.iScreen(2.0)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      child: Column(
        children: <Widget>[
          Container(
              height: size.hScreen(9.0),
              child: Image.asset('assets/imgs/logo-principal.png')),
        ],
      ),
    );
  }
}
