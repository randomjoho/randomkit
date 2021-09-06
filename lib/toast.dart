import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:randomkit/random_res.dart';
import 'package:randomkit/utils/error_utils.dart';
import 'package:randomkit/widget/toast/icon_text.dart';
import 'package:randomkit/widget/toast/loading.dart';

import 'animation/fade.dart';
import 'const/random_const.dart';

final RandomToastInit = BotToastInit;

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

  static closeAll(){
    BotToast.closeAllLoading();
  }

  static CancelFunc showSuccess(
      String text, {
        crossPage = false,
        clickClose = false,
      }) {
    return showIconText(
      icon: RandomRes.assets_dialog_success_png,
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
      icon: RandomRes.assets_dialog_failed_png,
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
      wrapToastAnimation:
          (AnimationController controller, CancelFunc _, Widget child) {
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

  static CancelFunc showText({
    String text,
    crossPage = false,
    clickClose = false,
    duration = RandomConst.toastDuration,
  }) {
    return showWidget(
        UnconstrainedBox(child: Container(

          decoration: BoxDecoration(
              color: Color(0xBF1E1E1E),
              borderRadius: BorderRadius.circular(14)),
          alignment: Alignment.center,
          child: Text(
            '${text}',
            style: TextStyle(color: Colors.white, fontSize: 17),
            textAlign: TextAlign.center,
          ),
          width: 268,
          padding: EdgeInsets.symmetric(vertical: 19,horizontal: 20),
        ),),
        crossPage: crossPage,
        clickClose: clickClose,
        backgroundColor: Colors.transparent,
        duration: duration);
  }
}
