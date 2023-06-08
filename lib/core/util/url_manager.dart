import 'package:url_launcher/url_launcher.dart';

Future<void> launch(String uri) async {
  await launchUrl(Uri.parse(uri));
}