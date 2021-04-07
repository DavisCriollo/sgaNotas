import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        alignment: Alignment.center,
        child: Text(
          'Mis Asignaturas',
          style: GoogleFonts.roboto(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
