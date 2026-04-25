import 'package:agro_app/features/wheather/wheather_model.dart';
import 'package:agro_app/features/wheather/wheather_service.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class WeatherController extends GetxController {
  var isLoading = false.obs;
  var weather = Rxn<WeatherModel>();
  var error = "".obs;

  final WeatherService service = WeatherService();

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      isLoading.value = true;
      error.value = "";

      // 🔥 STEP 1: Check GPS ON hai ya nahi
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        error.value = "Please enable location services";
        return;
      }

      // 🔥 STEP 2: Permission check
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission(); // 👈 popup yaha aayega
      }

      // ❌ User ne permanently deny kar diya
      if (permission == LocationPermission.deniedForever) {
        error.value = "Permission permanently denied. Enable from settings.";
        await Geolocator.openAppSettings(); // 🔥 direct settings open
        return;
      }

      // ❌ Still denied
      if (permission == LocationPermission.denied) {
        error.value = "Location permission denied";
        return;
      }

      // 🔥 STEP 3: Location fetch
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      print("📍 LAT: ${pos.latitude}, LNG: ${pos.longitude}");

      // 🔥 STEP 4: API call
      final data = await service.fetchWeather(
        pos.latitude,
        pos.longitude,
      );

      weather.value = data;

    } catch (e) {
      print("❌ ERROR: $e");
      error.value = "Failed to load weather";
    } finally {
      isLoading.value = false;
    }
  }

  // 🔥 Manual retry button ke liye useful
  void refreshWeather() {
    fetchWeather();
  }
}