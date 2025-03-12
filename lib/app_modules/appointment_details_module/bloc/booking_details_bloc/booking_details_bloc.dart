import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vax_care_healthcare_provider/app_models/vaccine_booking_model/vaccine_booking_model.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/service/get_vaccine_booking_details.dart';

part 'booking_details_event.dart';
part 'booking_details_state.dart';
part 'booking_details_bloc.freezed.dart';

class BookingDetailsBloc
    extends Bloc<BookingDetailsEvent, BookingDetailsState> {
  BookingDetailsBloc() : super(_Initial()) {
    on<_bookingDetailsFetched>((event, emit) async {
      emit(BookingDetailsState.loading());
      try {
        final bookingDetails = await getVaccineBookingDetails(
          bookingId: event.bookingId,
        );
        emit(BookingDetailsState.success(bookingDetails));
      } catch (e) {
        emit(BookingDetailsState.error(e.toString()));
      }
    });
  }
}
