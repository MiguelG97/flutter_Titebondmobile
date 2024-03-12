import 'package:mobile/modules/auth/presenter/controllers/auth_bloc/auth_states.dart';

abstract class Auth_event {}

class AuthStatusChanged extends Auth_event {
  AuthStatusChanged({required this.status});
  final Auth_states status;
}

class AuthLogoutRequested extends Auth_event {}
