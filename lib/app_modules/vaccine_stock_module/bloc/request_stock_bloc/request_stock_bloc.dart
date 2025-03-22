import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/model/stock_request_response_model.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/service/request_vaccine_stock.dart';

part 'request_stock_event.dart';
part 'request_stock_state.dart';
part 'request_stock_bloc.freezed.dart';

class RequestStockBloc extends Bloc<RequestStockEvent, RequestStockState> {
  RequestStockBloc() : super(_Initial()) {
    on<_stockRequested>((event, emit) async {
      emit(RequestStockState.loading());
      try {
        final response = await requestVaccineStock(
          ageGroup: event.ageGroup,
          quantity: event.quantity,
        );
        emit(RequestStockState.success(response));
      } catch (e) {
        emit(RequestStockState.failure(e.toString()));
      }
    });
  }
}
