import 'package:flutter/material.dart';
import 'package:sgaapp/src/pages/acercaDe_page.dart';
import 'package:sgaapp/src/pages/contactos_page.dart';
import 'package:sgaapp/src/pages/detalleMateria_page.dart';
import 'package:sgaapp/src/pages/home/home_page.dart';
import 'package:sgaapp/src/pages/login_page.dart';
import 'package:sgaapp/src/pages/perfil_page.dart';
import 'package:sgaapp/src/pages/restauraContrasena_page.dart';
import 'package:sgaapp/src/pages/splash_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomePage(),
  'login': (_) => LoginPage(),
  'restaurarPass': (_) => ContrasenaPage(),
  'contactos': (_) => CantactosPage(),
  'materiaDetalle': (_) => NotasMateriaPage(),
  'miperfil': (_) => PerfilPage(),
  'splash': (_) => SplashPage(),
  'acercade': (_) => AcercaDePage(),
};
