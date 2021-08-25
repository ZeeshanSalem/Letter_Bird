import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  Utils._();

  static const int http_status_OK = 200;

 
  static push(var destination, var context) {
    Platform.isAndroid
        ? Navigator.push(context, MaterialPageRoute(builder: (context) => destination))
        : Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => destination),
          );
  }

  static pushAndRemoveUntil(var destination, var context) {
    Platform.isAndroid
        ? Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => destination), (Route<dynamic> route) => false)
        : Navigator.of(context)
            .pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => destination), (Route<dynamic> route) => false);
  }

  static setStatusBarColor(color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
    ));
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static hideKeypad(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static launchBrowser(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchWhatsApp(phone) async {
    var url = "whatsapp://send?phone=$phone";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchDialer(phone) async {
    var url = "tel://$phone";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchMailBox(email) async {
    final params = Uri(
      scheme: 'mailto',
      path: email,
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
