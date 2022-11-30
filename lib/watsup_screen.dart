import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenWatsupScreen extends StatefulWidget {
  @override
  _OpenWatsupScreenState createState() => _OpenWatsupScreenState();
}

class _OpenWatsupScreenState extends State<OpenWatsupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Center(child: Text("Share on WhatsApp")),
      ),
      body: MaterialButton(
        height: 300,
        minWidth: 300,
        child: Center(child: Text("Send")),
        onPressed: () {
          _launchWhatsapp();
        },
      ),
    );
  }

  _launchWhatsapp() async {
    var whatsapp = "+919498803089";
    var whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
// for iOS phone
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
// for android , web
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }
}
