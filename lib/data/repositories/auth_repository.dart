import '../models/user_model.dart';
import '../services/auth_remote_service.dart';

class AuthRepository {
  AuthRepository(this._remoteService);

  final AuthRemoteService _remoteService;

  Future<UserModel> login({required String email, required String password}) {
    return _remoteService.login(email: email, password: password);
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) {
    return _remoteService.register(name: name, email: email, password: password);
  }
}
