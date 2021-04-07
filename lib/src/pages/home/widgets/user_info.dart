import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../utils/responsive.dart';
import '../home_controller.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Provider.of<HomeController>(context, listen: false);
    final user = controller.session;
    String alias;
    final List<String> tmp = user.info.nombre.split(" ");
    if (tmp.length > 0) {
      alias = tmp[0][0];
      if (tmp.length >= 2) {
        alias += tmp[2][0];
      }
    }
    final size = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.iScreen(2.0),
      ),
      alignment: Alignment.center,

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
              border: Border.all(color: Color(0xFF04559D), width: 5.0),
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
                margin: EdgeInsets.only(top: size.iScreen(2.0)),
                child: Text(
                  '${user.info.nombre}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: size.iScreen(1.6),
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                    color: Color(0xFF18459C),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                // color:Colors .red,
                margin: EdgeInsets.only(
                  top: size.iScreen(0.5),
                ),
                child: Text(
                  '${user.info.usuario} ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: size.iScreen(1.5),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 1,
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
