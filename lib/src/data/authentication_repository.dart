import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthenticationRepository {
  Future<void> signOut();
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FlutterSecureStorage _storage;

  AuthenticationRepositoryImpl(this._storage);
  @override
  Future<void> signOut() {
    return this._storage.deleteAll();
  }
}
