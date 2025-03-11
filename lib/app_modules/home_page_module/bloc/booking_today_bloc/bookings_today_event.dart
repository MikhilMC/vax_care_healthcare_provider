part of 'bookings_today_bloc.dart';

@freezed
class BookingsTodayEvent with _$BookingsTodayEvent {
  const factory BookingsTodayEvent.started() = _Started;
  const factory BookingsTodayEvent.bookingsFetched() = _bookingsFetched;
}
