import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isLoading = false;

class Loader extends StatefulWidget {
  final Widget child;

  Loader({ required this.child});

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Platform.isAndroid ? CircularProgressIndicator() : CupertinoActivityIndicator(),
          )
        : widget.child;
  }
}
