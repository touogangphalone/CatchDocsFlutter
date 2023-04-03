import 'package:flutter/cupertino.dart';

navigateTo(BuildContext context, Widget widget,
    {replace = false, replaceAll = false}) {
  if (replace) {
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (BuildContext context) => widget));
  } else if (replaceAll) {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        CupertinoPageRoute(
            fullscreenDialog: true, builder: (BuildContext context) => widget),
        (route) => false);
  } else {
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (BuildContext context) => widget));
  }
}

int timestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}
