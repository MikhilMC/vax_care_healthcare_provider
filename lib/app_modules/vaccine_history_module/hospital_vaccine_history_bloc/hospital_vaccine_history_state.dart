part of 'hospital_vaccine_history_bloc.dart';

@freezed
class HospitalVaccineHistoryState with _$HospitalVaccineHistoryState {
  const factory HospitalVaccineHistoryState.initial() = _Initial;
  const factory HospitalVaccineHistoryState.loading() =
      HospitalVaccineHistoryLoading;
  const factory HospitalVaccineHistoryState.success(
    List<VaccineHistoryModel> vaccineHistory,
  ) = HospitalVaccineHistorySuccess;
  const factory HospitalVaccineHistoryState.error(
    String errorMessage,
  ) = HospitalVaccineHistoryError;
  const factory HospitalVaccineHistoryState.empty() =
      HospitalVaccineHistoryEmpty;
}
