import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yjahz_app/core/theming/app_colors.dart';
import 'package:yjahz_app/core/theming/assets.dart';
import 'package:yjahz_app/core/theming/spacing.dart';
import 'package:yjahz_app/core/theming/styles.dart';
import 'package:yjahz_app/core/widgets/custom_button.dart';
import 'package:yjahz_app/core/widgets/custom_title_text_form_field.dart';
import 'package:yjahz_app/core/widgets/custom_top_side.dart';
import 'package:yjahz_app/features/log%20in/presentation/views/widgets/donot_have_account.dart';

import '../../../../core/widgets/app_text_form.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Assets.background),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SizedBox(
              height: media.height,
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  const Image(
                    image: AssetImage(Assets.logo),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            const CustomTopSide(text: 'LOG IN'),
                            verticlMediaSpace(context, 120),
                            const CustomtitleTextFormField(text: 'Email.'),
                            const AppTextForm(hintText: 'Write your email'),
                            const CustomtitleTextFormField(text: 'Password'),
                            const AppTextForm(
                                hintText: 'Write 8 character at least'),
                            verticlMediaSpace(context, 130),
                            CustomtitleTextFormField(
                                text: 'Forgot the password ?',
                                textStyle: Styles.font14W400),
                            verticlMediaSpace(context, 50),
                            const CustomButton(text: 'login'),
                            verticlMediaSpace(context, 90),
                            const DonotHAveAccount(),
                            verticalSpace(25)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
