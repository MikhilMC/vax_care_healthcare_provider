part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _loading;
  const factory LoginState.success(
    LoginResponseModel response,
  ) = _success;
  const factory LoginState.failure(
    String errorMessage,
  ) = _failure;
}
