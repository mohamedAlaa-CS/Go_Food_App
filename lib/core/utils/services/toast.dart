import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class CustomToast {
  static ToastFuture successToast(context, String msg) {
    return showToast(
      msg,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.top,
      animDuration: const Duration(milliseconds: 350),
      duration: const Duration(seconds: 1),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      backgroundColor: Colors.green,
    );
  }

  static ToastFuture errorToast(context, String msg) {
    return showToast(
      msg,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.top,
      animDuration: const Duration(milliseconds: 350),
      duration: const Duration(seconds: 1),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      backgroundColor: Colors.red,
    );
  }
}
