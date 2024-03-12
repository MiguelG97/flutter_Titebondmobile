import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/modules/auth/presenter/controllers/auth_bloc/auth_events.dart';
import 'package:mobile/modules/auth/presenter/controllers/auth_bloc/auth_states.dart';

class AuthBloc extends Bloc<Auth_event, Auth_states> {
  AuthBloc() : super(Auth_unknown()) {
    on<AuthStatusChanged>((
      AuthStatusChanged event,
      Emitter<Auth_states> emit,
    ) {
      if (event.status is Auth_unknown) {
      } else if (event.status is Auth_unauthenticated) {
      } else if (event.status is Auth_authenticated) {}
    });
  }
}
