import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:randomkit/random_res.dart';
import 'package:randomkit/utils/error_utils.dart';
import 'package:randomkit/widget/toast/icon_text.dart';
import 'package:randomkit/widget/toast/loading.dart';

import 'animation/fade.dart';
import 'const/random_const.dart';
 

class RandomToastNavigatorObserver extends BotToastNavigatorObserver {}

class RandomToastContainer extends StatelessWidget {
  final Widget child;

  const RandomToastContainer({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: RandomConst.toastPadding,
      decoration: const BoxDecoration(
        color: RandomConst.toastBackgroundColor,
        borderRadius: RandomConst.toastRadius,
      ),
      child: DefaultTextStyle(
        style: RandomConst.toastTextStyle,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        child: child,
      ),
    );
  }
}

class RandomToast {
  static CancelFunc showLoading(
    String text, {
    ValueListenable<String> textListenable,
    BackButtonBehavior backButtonBehavior = BackButtonBehavior.ignore,
    crossPage = false,
    clickClose = false,
  }) {
    return BotToast.showCustomLoading(
      toastBuilder: (_) => LoadingWidget(
        text,
        textListenable: textListenable,
      ),
      clickClose: clickClose,
      ignoreContentClick: true,
      crossPage: crossPage,
    );
  }

  static CancelFunc showSuccess(
    String text, {
    crossPage = false,
    clickClose = false,
  }) {
    return showIconText(
      icon: RandomRes.assets_toast_icon_done_png,
      text: text,
      crossPage: crossPage,
      clickClose: clickClose,
    );
  }

  static CancelFunc showFailure(
    String text, {
    crossPage = false,
    clickClose = false,
  }) {
    return showIconText(
      icon: RandomRes.assets_toast_icon_error_png,
      text: text,
      crossPage: crossPage,
      clickClose: clickClose,
    );
  }

  static CancelFunc showError(
    dynamic error, {
    crossPage = false,
    clickClose = false,
  }) {
    final errMessage = ErrorUtils.messageFrom(error);
    return showFailure(
      errMessage,
      crossPage: crossPage,
      clickClose: clickClose,
    );
  }

  static CancelFunc showIconText({
    String icon,
    String text,
    crossPage = false,
    clickClose = false,
    Color backgroundColor = Colors.transparent,
    duration = RandomConst.toastDuration,
  }) {
    return showWidget(
      IconTextWidget(icon: icon, text: text),
      crossPage: crossPage,
      clickClose: clickClose,
      backgroundColor: backgroundColor,
    );
  }

  static CancelFunc showWidget(
    Widget child, {
    crossPage = false,
    clickClose = false,
    Color backgroundColor = Colors.transparent,
    duration = RandomConst.toastDuration,
  }) {
    return BotToast.showAnimationWidget(
      toastBuilder: (_) => SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: child,
        ),
      ),
      animationDuration: RandomConst.toastAnimationDuration,
      wrapToastAnimation: (AnimationController controller, CancelFunc _, Widget child) {
        return FadeAnimation(
          controller: controller,
          child: child,
        );
      },
      crossPage: crossPage,
      clickClose: clickClose,
      backgroundColor: backgroundColor,
      duration: duration,
    );
  }
}
