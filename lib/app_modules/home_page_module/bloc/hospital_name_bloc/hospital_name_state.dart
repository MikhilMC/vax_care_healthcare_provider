part of 'hospital_name_bloc.dart';

@freezed
class HospitalNameState with _$HospitalNameState {
  const factory HospitalNameState.initial() = _Initial;
  const factory HospitalNameState.loading() = HospitalNameLoading;
  const factory HospitalNameState.success(
    String hospitalName,
  ) = HospitalNameSuccess;
  const factory HospitalNameState.error(
    String errorMessage,
  ) = HospitalNameError;
}
