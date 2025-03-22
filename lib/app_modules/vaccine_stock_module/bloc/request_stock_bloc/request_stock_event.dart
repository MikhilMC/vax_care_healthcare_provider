part of 'request_stock_bloc.dart';

@freezed
class RequestStockEvent with _$RequestStockEvent {
  const factory RequestStockEvent.started() = _Started;
  const factory RequestStockEvent.stockRequested(
    String ageGroup,
    int quantity,
  ) = _stockRequested;
}
