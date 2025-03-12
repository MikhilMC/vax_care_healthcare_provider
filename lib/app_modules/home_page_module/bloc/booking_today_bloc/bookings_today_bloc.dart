import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vax_care_healthcare_provider/app_models/vaccine_booking_model/vaccine_booking_model.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/service/get_bookings_today.dart';

part 'bookings_today_event.dart';
part 'bookings_today_state.dart';
part 'bookings_today_bloc.freezed.dart';

class BookingsTodayBloc extends Bloc<BookingsTodayEvent, BookingsTodayState> {
  BookingsTodayBloc() : super(_Initial()) {
    on<_bookingsFetched>((event, emit) async {
      emit(BookingsTodayState.loading());
      try {
        final bookings = await getBookingsToday();
        if (bookings.isNotEmpty) {
          emit(BookingsTodayState.success(bookings));
        } else {
          emit(BookingsTodayState.empty());
        }
      } catch (e) {
        emit(BookingsTodayState.error(e.toString()));
      }
    });
  }
}
