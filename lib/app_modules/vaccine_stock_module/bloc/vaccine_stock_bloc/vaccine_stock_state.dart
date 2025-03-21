part of 'vaccine_stock_bloc.dart';

@freezed
class VaccineStockState with _$VaccineStockState {
  const factory VaccineStockState.initial() = _Initial;
  const factory VaccineStockState.loading() = VaccineStockLoading;
  const factory VaccineStockState.success(
    List<VaccineStockModel> vaccineStock,
  ) = VaccineStockSuccess;
  const factory VaccineStockState.error(
    String errorMessage,
  ) = VaccineStockError;
  const factory VaccineStockState.empty() = VaccineStockEmpty;
}
