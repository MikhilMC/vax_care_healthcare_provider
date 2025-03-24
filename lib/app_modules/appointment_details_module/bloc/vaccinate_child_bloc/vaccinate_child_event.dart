part of 'vaccinate_child_bloc.dart';

@freezed
class VaccinateChildEvent with _$VaccinateChildEvent {
  const factory VaccinateChildEvent.started() = _Started;
  const factory VaccinateChildEvent.childVaccinated(
    int bookingId,
    double height,
    double weight,
  ) = _childVaccinated;
}
