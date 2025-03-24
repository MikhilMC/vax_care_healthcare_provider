part of 'vaccinate_child_bloc.dart';

@freezed
class VaccinateChildState with _$VaccinateChildState {
  const factory VaccinateChildState.initial() = _Initial;
  const factory VaccinateChildState.loading() = _Loading;
  const factory VaccinateChildState.success(
    VaccinationResponseModel response,
  ) = _success;
  const factory VaccinateChildState.failed(
    String errorMessage,
  ) = _failed;
}
