import 'package:url_launcher/url_launcher.dart';

class DiseaseService {
  static Future<void> openDiseaseApp() async {
    final Uri url = Uri.parse(
      "https://cropapp-br9jv4qwrf3apgrpebctds.streamlit.app/",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw "Could not launch $url";
    }
  }
}