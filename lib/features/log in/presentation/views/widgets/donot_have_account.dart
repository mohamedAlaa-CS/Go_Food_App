import 'package:flutter/material.dart';
import 'package:yjahz_app/core/theming/app_colors.dart';
import 'package:yjahz_app/core/theming/styles.dart';

class DonotHAveAccount extends StatelessWidget {
  const DonotHAveAccount({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account ? ',
          style: Styles.font12W400,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Sign up',
            style: Styles.font12W600.copyWith(
              color: AppColors.green,
            ),
          ),
        )
      ],
    );
  }
}
