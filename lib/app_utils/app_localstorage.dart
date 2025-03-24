import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vax_care_healthcare_provider/app_constants/app_localstorage_keys.dart';

class AppLocalstorage {
  static Future<void> disableIntroScreen() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.write(
      key: AppLocalstorageKeys.isFirstLaunch,
      value: false.toString(),
    );
  }

  static Future<void> hospitalLogin({
    required String hospitalName,
    required int hospitalId,
  }) async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.write(
      key: AppLocalstorageKeys.isLoggedIn,
      value: true.toString(),
    );
    await storage.write(
      key: AppLocalstorageKeys.hospitalId,
      value: hospitalId.toString(),
    );
    await storage.write(
      key: AppLocalstorageKeys.hospitalName,
      value: hospitalName,
    );
  }

  static Future<void> hospitalLogout() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.delete(key: AppLocalstorageKeys.hospitalId);
    await storage.delete(key: AppLocalstorageKeys.hospitalName);
    await storage.write(
      key: AppLocalstorageKeys.isLoggedIn,
      value: false.toString(),
    );
  }

  static Future<bool> getIntroScreenStatus() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    String? isFirstLaunchString =
        await storage.read(key: AppLocalstorageKeys.isFirstLaunch);
    return bool.parse(isFirstLaunchString ?? true.toString());
  }

  static Future<bool> getLoginStatus() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    String? isLoggedIn =
        await storage.read(key: AppLocalstorageKeys.isLoggedIn);
    return bool.parse(isLoggedIn ?? false.toString());
  }

  static Future<int> getHospitalId() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    String? hospitalId =
        await storage.read(key: AppLocalstorageKeys.hospitalId);
    return int.parse(hospitalId ?? 0.toString());
  }

  static Future<String> getHospitalName() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    String? hospitalName =
        await storage.read(key: AppLocalstorageKeys.hospitalName);
    return hospitalName ?? "";
  }
}
