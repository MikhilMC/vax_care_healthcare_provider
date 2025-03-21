import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/model/vaccine_stock_model.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/service/get_vaccine_stock.dart';

part 'vaccine_stock_event.dart';
part 'vaccine_stock_state.dart';
part 'vaccine_stock_bloc.freezed.dart';

class VaccineStockBloc extends Bloc<VaccineStockEvent, VaccineStockState> {
  VaccineStockBloc() : super(_Initial()) {
    on<_vaccineStockFetched>((event, emit) async {
      emit(VaccineStockState.loading());
      try {
        final vaccineStock = await getVaccineStock();
        if (vaccineStock.isNotEmpty) {
          emit(VaccineStockState.success(vaccineStock));
        } else {
          emit(VaccineStockState.empty());
        }
      } catch (e) {
        emit(VaccineStockState.error(e.toString()));
      }
    });
  }
}
