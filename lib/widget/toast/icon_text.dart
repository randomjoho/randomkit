import 'package:flutter/material.dart';
import 'package:randomkit/randomkit.dart';

import '../../toast.dart';

/// 图标+文字的Widget
class IconTextWidget extends StatelessWidget {
  final String icon;
  final String text;

  const IconTextWidget({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeyTeaToastContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null)
            Image(
              image: AssetImage(
                icon,
                package: RandomKit.packageName,
              ),
              width: 22,
              height: 22,
              fit: BoxFit.contain,
            ),
          if (text != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(text),
            ),
        ],
      ),
    );
  }
}
