import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_localstorage.dart';

part 'hospital_name_event.dart';
part 'hospital_name_state.dart';
part 'hospital_name_bloc.freezed.dart';

class HospitalNameBloc extends Bloc<HospitalNameEvent, HospitalNameState> {
  HospitalNameBloc() : super(_Initial()) {
    on<_hospitalNameFetched>((event, emit) async {
      emit(HospitalNameState.loading());
      try {
        final hospitalName = await AppLocalstorage.getHospitalName();
        emit(HospitalNameState.success(hospitalName));
      } catch (e) {
        emit(HospitalNameState.error(e.toString()));
      }
    });
  }
}
