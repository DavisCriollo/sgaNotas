import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sgaapp/src/services/api.dart';
import 'package:sgaapp/src/utils/autenticacion.dart';
import 'package:sgaapp/src/utils/responsive.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.instance.infoSave(),
      // future: null,
      // future: Api.instance.infoSave(),
      builder: (BuildContext context, AsyncSnapshot<Session> snapshot) {
        // builder: (BuildContext context, AsyncSnapshot<SaveSession> snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data;
          String alias;
          final List<String> tmp = user.info.nombre.split(" ");
          if (tmp.length > 0) {
            alias = tmp[0][0];
            if (tmp.length >= 2) {
              alias += tmp[2][0];
            }
          }

          return Drawer(
            child: Container(
              child: Column(
                children: [
                  SafeArea(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: size.iScreen(2.0)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            // border: Border.all(color: Colors.blue),
                            ),
                        width: size.wScreen(100),
                        // height: size.wScreen(46.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(size.iScreen(0.5)),
                              decoration: BoxDecoration(
                                // color: Color(0xFF0070EC),
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: Color(0xFF04559D), width: 5.0),
                              ),
                              width: size.iScreen(13),
                              height: size.iScreen(13),
                              child: Text(
                                '$alias',
                                // '${user.info.estado}',
                                // '',
                                style: GoogleFonts.roboto(
                                  fontSize: size.iScreen(5.0),
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF0000),
                                ),
                              ),
                            ),

                            //*******************************************/
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  // color:Colors .red,
                                  margin:
                                      EdgeInsets.only(top: size.iScreen(2.0)),
                                  child: Text('${user.info.nombre}',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.6),
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.white,
                                          color: Color(0xFF18459C))),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  // color:Colors .red,
                                  margin:
                                      EdgeInsets.only(top: size.iScreen(0.5)),
                                  child: Text('${user.info.usuario} ',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          fontSize: size.iScreen(1.5),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          letterSpacing: 1)),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: _ListaOpciones(),
                  ),
                  Divider(
                    color: Color(0xFF18459C),
                  ),
                  ListTile(
                    title: Text('Cerrar Sesión',
                        style: GoogleFonts.roboto(
                            fontSize: size.iScreen(2.0),
                            fontWeight: FontWeight.bold
                            // color: Colors.white,
                            )),
                    leading: Icon(FontAwesomeIcons.signOutAlt,
                        color: Color(0xFF18459C)),
                    onTap: () {
                      Auth.instance.logOut(context);
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  Future<void> compartir() async {
    await FlutterShare.share(
        title: 'My App',
        text: 'Sga App',
        linkUrl:
            'https://play.google.com/store/apps/details?id=com.neitor.sgaapp',
        chooserTitle: 'Sistema de Gestión Académica');
  }

  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _ItemsMenu(
            icon: FontAwesomeIcons.userAlt,
            title: 'Mi Perfil',
            page: 'miperfil',
            size: size),
        //======== COMPARTIR APP =======//
        ListTile(
          dense: true,
          leading: Icon(
            FontAwesomeIcons.shareAlt,
            color: Color(0xFF18459C),
          ),
          title: Text('Compartir',
              style: GoogleFonts.roboto(
                fontSize: size.iScreen(2.2),
                // color: Colors.white,
              )),
          trailing: FaIcon(
            FontAwesomeIcons.chevronRight,
            size: size.iScreen(2.2),
          ),
          onTap: () {
            compartir();
          },
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        // ======================================//
        _ItemsMenu(
            icon: FontAwesomeIcons.headset,
            title: 'Contáctenos',
            page: 'contactos',
            size: size),
        _ItemsMenu(
            icon: FontAwesomeIcons.laptopCode,
            title: 'Acerca de',
            page: 'acercade',
            size: size),
      ],
    );
  }
}

class _ItemsMenu extends StatelessWidget {
  final Responsive size;

  final String title;
  final IconData icon;
  final String page;
  _ItemsMenu({
    @required this.title,
    @required this.icon,
    this.page,
    @required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: Icon(
            this.icon,
            color: Color(0xFF18459C),
          ),
          title: Text(this.title,
              style: GoogleFonts.roboto(
                fontSize: size.iScreen(2.2),
                // color: Colors.white,
              )),
          trailing: FaIcon(
            FontAwesomeIcons.chevronRight,
            size: size.iScreen(2.2),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, this.page);
            // share();
          },
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
