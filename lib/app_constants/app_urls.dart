class AppUrls {
  static const String baseUrl = "https://vqp6fbbv-8001.inc1.devtunnels.ms";
  static const String healthcareProviderUrl = "$baseUrl/health_provider";

  static const String healthcareProviderLoginUrl =
      "$healthcareProviderUrl/login/";
  static const String getProfileDetailsUrl =
      "$healthcareProviderUrl/health_provider_profile/";
  static const String getBookingTodayUrl =
      "$healthcareProviderUrl/bookings_for_today/";
  static const String getBookingDetailsUrl =
      "$healthcareProviderUrl/view_booking_details/";
  static const String getHospitalVaccineHistoryUrl =
      "$healthcareProviderUrl/list_vaccination_history/";
  static const String getVaccineStockUrl = "$healthcareProviderUrl/stock_list/";
}
