part of 'hospital_name_bloc.dart';

@freezed
class HospitalNameEvent with _$HospitalNameEvent {
  const factory HospitalNameEvent.started() = _Started;
  const factory HospitalNameEvent.hospitalNameFetched() = _hospitalNameFetched;
}
