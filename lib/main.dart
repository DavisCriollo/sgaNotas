// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sgaapp/src/routes/routes.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//      SystemChrome.setPreferredOrientations([
//         DeviceOrientation.portraitUp,
//         DeviceOrientation.portraitDown,
//       ]);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'SGA',
//        theme: ThemeData(
//           primaryColor: Color(0xFF18459C),
//         ),
//       initialRoute: 'login',
//       routes: appRoutes,
//     );
//   }
// }

// *********************************************** PRUEBA  **********************************************************//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sgaapp/src/providers/DropDownProvider.dart';
import 'package:sgaapp/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>DropDownProvider() ,),
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SGA',
         theme: ThemeData(
            primaryColor: Color(0xFF18459C),
          ),
        initialRoute: 'login',
        routes: appRoutes,
      ),
    );
  }
}
// *********************************************** PRUEBA  **********************************************************////