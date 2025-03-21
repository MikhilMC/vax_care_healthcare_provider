import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_history_module/model/vaccine_history_model.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_history_module/service/get_hospital_vaccine_history.dart';

part 'hospital_vaccine_history_event.dart';
part 'hospital_vaccine_history_state.dart';
part 'hospital_vaccine_history_bloc.freezed.dart';

class HospitalVaccineHistoryBloc
    extends Bloc<HospitalVaccineHistoryEvent, HospitalVaccineHistoryState> {
  HospitalVaccineHistoryBloc() : super(_Initial()) {
    on<_hospitalVaccineHistoryFetched>((event, emit) async {
      emit(HospitalVaccineHistoryState.loading());
      try {
        final hospitalVaccineHistory = await getHospitalVaccineHistory(
          date: event.date,
        );
        if (hospitalVaccineHistory.isNotEmpty) {
          emit(HospitalVaccineHistoryState.success(hospitalVaccineHistory));
        } else {
          emit(HospitalVaccineHistoryState.empty());
        }
      } catch (e) {
        emit(HospitalVaccineHistoryState.error(e.toString()));
      }
    });
  }
}
