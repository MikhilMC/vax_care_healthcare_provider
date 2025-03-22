part of 'request_stock_bloc.dart';

@freezed
class RequestStockState with _$RequestStockState {
  const factory RequestStockState.initial() = _Initial;
  const factory RequestStockState.loading() = _Loading;
  const factory RequestStockState.success(
    StockRequestResponseModel response,
  ) = _success;
  const factory RequestStockState.failure(
    String errorMessage,
  ) = _failure;
}
