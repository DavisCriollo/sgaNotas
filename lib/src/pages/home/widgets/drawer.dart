import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sgaapp/src/pages/home/home_controller.dart';
import 'package:sgaapp/src/pages/home/widgets/user_info.dart';
import '../../../utils/responsive.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Responsive size;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              UserInfo(),
              Expanded(
                child: _ListaOpciones(),
              ),
              Divider(
                color: Color(0xFF18459C),
              ),
              ListTile(
                title: Text(
                  'Cerrar Sesión',
                  style: GoogleFonts.roboto(
                    fontSize: size.iScreen(2.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: Color(0xFF18459C),
                ),
                onTap: () async {
                  await context.read<HomeController>().signOut();
                  Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _ItemsMenu(icon: FontAwesomeIcons.userAlt, title: 'Mi Perfil', page: 'miperfil', size: size),
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
            context.read<HomeController>().shareApp();
          },
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        // ======================================//
        _ItemsMenu(icon: FontAwesomeIcons.headset, title: 'Contáctenos', page: 'contactos', size: size),
        _ItemsMenu(icon: FontAwesomeIcons.laptopCode, title: 'Acerca de', page: 'acercade', size: size),
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
          title: Text(
            this.title,
            style: GoogleFonts.roboto(
              fontSize: size.iScreen(2.2),
              // color: Colors.white,
            ),
          ),
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
