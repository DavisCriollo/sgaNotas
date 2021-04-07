import '../services/api.dart';
import '../utils/autenticacion.dart';

abstract class AccountRepository {
  Future<Session> session();
}

class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<Session> session() {
    return Api.instance.infoSave();
  }
}
