import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:yjahz_app/core/Networking/api_services.dart';
import 'package:yjahz_app/core/theming/app_colors.dart';
import 'package:yjahz_app/core/theming/assets.dart';
import 'package:yjahz_app/core/theming/spacing.dart';
import 'package:yjahz_app/core/theming/styles.dart';
import 'package:yjahz_app/core/utils/services/toast.dart';
import 'package:yjahz_app/core/widgets/custom_button.dart';
import 'package:yjahz_app/core/widgets/custom_title_text_form_field.dart';
import 'package:yjahz_app/core/widgets/custom_top_side.dart';
import 'package:yjahz_app/features/log%20in/data/repos/auth_repo_empel.dart';
import 'package:yjahz_app/features/log%20in/presentation/manager/cubit/login_cubit.dart';
import 'package:yjahz_app/features/log%20in/presentation/views/signup_view.dart';
import 'package:yjahz_app/features/log%20in/presentation/views/widgets/donot_have_account.dart';

import '../../../../core/widgets/app_text_form.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  static const String routeName = '/';
  LoginView({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Assets.background),
          fit: BoxFit.cover,
        )),
        child: BlocProvider(
          create: (context) => LoginCubit(AuthRepoImpel(ApiServices(Dio()))),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadingState) {
                const Center(child: CircularProgressIndicator());
              }
              if (state is LoginFailuerState) {
                CustomToast.errorToast(state.error);
              }
              if (state is LoginSuccessState) {
                String? msg = state.model.message;
                if (state.model.success!) {
                  CustomToast.successToast(msg);
                  GoRouter.of(context).push(SignUpview.routeName);
                } else {
                  CustomToast.errorToast(msg);
                }
              }
            },
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return Scaffold(
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
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    const CustomTopSide(text: 'LOG IN'),
                                    verticlMediaSpace(context, 120),
                                    const CustomtitleTextFormField(
                                        text: 'Email.'),
                                    AppTextForm(
                                      hintText: 'Write your email',
                                      controller: emailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'invaild email ..!';
                                        }
                                        return null;
                                      },
                                    ),
                                    const CustomtitleTextFormField(
                                        text: 'Password'),
                                    AppTextForm(
                                        hintText: 'Write 8 character at least',
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please,Enter password ..!';
                                          }
                                          return null;
                                        }),
                                    verticlMediaSpace(context, 130),
                                    CustomtitleTextFormField(
                                        text: 'Forgot the password ?',
                                        textStyle: Styles.font14W400),
                                    verticlMediaSpace(context, 50),
                                    CustomButton(
                                        text: 'login',
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            cubit.userLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
                                          }
                                        }),
                                    verticlMediaSpace(context, 90),
                                    DonotHAveAccount(onPressed: () {
                                      GoRouter.of(context)
                                          .push(SignUpview.routeName);
                                    }),
                                    verticalSpace(25)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
