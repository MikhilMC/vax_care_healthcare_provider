import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vax_care_healthcare_provider/app_modules/login_module/model/login_response_model.dart';
import 'package:vax_care_healthcare_provider/app_modules/login_module/service/login.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) {
    on<_loggedIn>((event, emit) async {
      emit(LoginState.loading());
      try {
        final response = await login(
          email: event.email,
          password: event.password,
        );
        emit(LoginState.success(response));
      } catch (e) {
        emit(LoginState.failure(e.toString()));
      }
    });
  }
}
