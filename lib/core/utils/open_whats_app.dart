import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class OpenWhatsApp{
  openWhatsapp(String whatsapp) async{

    var whatsAppURlAndroid = "whatsapp://send?phone=$whatsapp&text=How can we help You 🌹";
    var whatAppURLIos ="https://wa.me/$whatsapp?text=${Uri.parse("How can we help You")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatAppURLIos)){
        await launch(whatAppURLIos, forceSafariVC: false);
      }else{
        var url = 'https://wa.me/$whatsapp';
        openBrowserURL(url: url);
      }
    }else{
      // android , web
      if( await canLaunch(whatsAppURlAndroid)){
        await launch(whatsAppURlAndroid);
      }else{
        var url = 'https://wa.me/$whatsapp';
        openBrowserURL(url: url);
      }
    }
  }

  Future openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: inApp, // iOS
        forceWebView: inApp, // Android
        enableJavaScript: true, // Android
      );
    }
  }

}