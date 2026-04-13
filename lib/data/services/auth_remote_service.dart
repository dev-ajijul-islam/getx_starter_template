import '../models/user_model.dart';

class AuthRemoteService {
  Future<UserModel> login({required String email, required String password}) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return UserModel(name: 'Demo User', email: email);
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return UserModel(name: name, email: email);
  }
}
