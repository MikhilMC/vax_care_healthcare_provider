import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/model/vaccination_response_model.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/service/vaccinate_child.dart';

part 'vaccinate_child_event.dart';
part 'vaccinate_child_state.dart';
part 'vaccinate_child_bloc.freezed.dart';

class VaccinateChildBloc
    extends Bloc<VaccinateChildEvent, VaccinateChildState> {
  VaccinateChildBloc() : super(_Initial()) {
    on<_childVaccinated>((event, emit) async {
      emit(VaccinateChildState.loading());
      try {
        final response = await vaccinateChild(
          bookingId: event.bookingId,
          height: event.height,
          weight: event.weight,
        );
        emit(VaccinateChildState.success(response));
      } catch (e) {
        emit(VaccinateChildState.failed(e.toString()));
      }
    });
  }
}
