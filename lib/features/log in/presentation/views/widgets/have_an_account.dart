import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/styles.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'have an account ? ',
          style: Styles.font12W400,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Log in',
            style: Styles.font12W600.copyWith(
              color: AppColors.brown,
            ),
          ),
        )
      ],
    );
  }
}
