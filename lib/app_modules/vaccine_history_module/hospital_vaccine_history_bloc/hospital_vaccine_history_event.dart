part of 'hospital_vaccine_history_bloc.dart';

@freezed
class HospitalVaccineHistoryEvent with _$HospitalVaccineHistoryEvent {
  const factory HospitalVaccineHistoryEvent.started() = _Started;
  const factory HospitalVaccineHistoryEvent.hospitalVaccineHistoryFetched(
    DateTime date,
  ) = _hospitalVaccineHistoryFetched;
}
