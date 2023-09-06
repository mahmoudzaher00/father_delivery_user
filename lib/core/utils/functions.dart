

import 'package:url_launcher/url_launcher.dart';

import 'snackbar_message.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,mode:LaunchMode.externalApplication,);
    } else {
      SnackBarMessage.showErrorSnackBar("Error", 'Cannot launch $url');
    }
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
    await launchUrl(launchUri,mode: LaunchMode.externalApplication,);
  }





Future<void> launchEmail(String email) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'email', // Replace with the desired email address
    queryParameters: {'subject': 'Hello', 'body': 'Hi, there!'}, // Optional email subject and body
  );

    await launchUrl(emailUri,mode: LaunchMode.externalApplication);
  }


