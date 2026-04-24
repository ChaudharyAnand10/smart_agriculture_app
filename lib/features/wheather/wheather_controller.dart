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

      // Permission
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        error.value = "No weather found";
        isLoading.value = false;
        return;
      }

      // Location
      Position pos = await Geolocator.getCurrentPosition();

      // API call
      final data = await service.fetchWeather(
        pos.latitude,
        pos.longitude,
      );

      weather.value = data;
      isLoading.value = false;
    } catch (e) {
      error.value = "Error loading weather";
      isLoading.value = false;
    }
  }
}