part of 'bookings_today_bloc.dart';

@freezed
class BookingsTodayState with _$BookingsTodayState {
  const factory BookingsTodayState.initial() = _Initial;
  const factory BookingsTodayState.loading() = BookingsTodayLoading;
  const factory BookingsTodayState.success(
    List<VaccineBookingModel> bookings,
  ) = BookingsTodaySuccess;
  const factory BookingsTodayState.error(
    String errorMessage,
  ) = BookingsTodayError;
  const factory BookingsTodayState.empty() = BookingsTodayEmpty;
}
