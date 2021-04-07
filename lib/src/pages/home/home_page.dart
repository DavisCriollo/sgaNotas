import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:sgaapp/src/data/account_repository.dart';
import 'package:sgaapp/src/data/authentication_repository.dart';
import 'package:sgaapp/src/data/curriculum_repositor.dart';
import 'package:sgaapp/src/pages/home/home_controller.dart';
import 'package:sgaapp/src/pages/home/widgets/app_bar.dart';
import 'package:sgaapp/src/pages/home/widgets/cursos_dropdown.dart';
import 'package:sgaapp/src/pages/home/widgets/drawer.dart';
import 'package:sgaapp/src/pages/home/widgets/especialidades_dropdown.dart';
import 'package:sgaapp/src/pages/home/widgets/materias.dart';
import 'package:sgaapp/src/pages/home/widgets/periodos_dropdown.dart';

import '../../utils/responsive.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController(
        accountRepository: AccountRepositoryImpl(),
        curriculumRepository: CurriculumRepositoryImpl(),
        authenticationRepository: AuthenticationRepositoryImpl(
          FlutterSecureStorage(),
        ),
      ),
      builder: (context, _) {
        final HomeController controller = context.watch<HomeController>();

        if (controller.session == null) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: HomeAppBar(),
          drawer: MenuDrawer(
            size: responsive,
          ),
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  EspecialidadesDropdown(),
                  PeriodosDropdown(),
                  CursosDropdown(),
                  Expanded(
                    child: Materias(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
