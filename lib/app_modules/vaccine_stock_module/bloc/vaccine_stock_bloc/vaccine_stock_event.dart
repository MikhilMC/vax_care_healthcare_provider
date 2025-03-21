part of 'vaccine_stock_bloc.dart';

@freezed
class VaccineStockEvent with _$VaccineStockEvent {
  const factory VaccineStockEvent.started() = _Started;
  const factory VaccineStockEvent.vaccineStockFetched() = _vaccineStockFetched;
}
