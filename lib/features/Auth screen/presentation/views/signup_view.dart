import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:yjahz_app/core/Networking/api_services.dart';
import 'package:yjahz_app/core/theming/app_colors.dart';
import 'package:yjahz_app/core/theming/assets.dart';
import 'package:yjahz_app/core/utils/services/toast.dart';
import 'package:yjahz_app/features/Auth%20screen/data/repos/auth_repo_empel.dart';
import 'package:yjahz_app/features/Auth%20screen/presentation/manager/signup%20cubit/signup_cubit.dart';
import 'package:yjahz_app/features/Auth%20screen/presentation/views/widgets/have_an_account.dart';

import '../../../../core/theming/spacing.dart';
import '../../../../core/widgets/app_text_form.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_title_text_form_field.dart';
import '../../../../core/widgets/custom_top_side.dart';
import 'login_view.dart';

// ignore: must_be_immutable
class SignUpview extends StatelessWidget {
  static const String routeName = "/";
  SignUpview({super.key});
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
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
          create: (context) => SignupCubit(AuthRepoImpel(ApiServices(Dio()))),
          child: BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccessState) {
                if (state.model.success!) {
                  CustomToast.successToast(state.model.message);
                  CustomToast.closeToast().then((value) {
                    GoRouter.of(context).push(LoginView.routeName);
                  });
                } else {
                  CustomToast.errorToast(state.model.message);
                }
              }
            },
            builder: (context, state) {
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
                                    const CustomTopSide(text: 'SIGN UP'),
                                    verticlMediaSpace(context, 120),
                                    const CustomtitleTextFormField(
                                        text: 'Name.'),
                                    AppTextForm(
                                        hintText: 'Write 14 character',
                                        controller: nameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please, Enter your name';
                                          }
                                          if (value.trim().length < 8) {
                                            return 'Write 14 character';
                                          }
                                          return null;
                                        }),
                                    const CustomtitleTextFormField(
                                        text: 'Email.'),
                                    AppTextForm(
                                        textType: TextInputType.emailAddress,
                                        hintText: 'Write your email',
                                        controller: emailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please, Enter your Email';
                                          }

                                          return null;
                                        }),
                                    verticlMediaSpace(context, 130),
                                    const CustomtitleTextFormField(
                                        text: 'Phone Number.'),
                                    AppTextForm(
                                        textType: TextInputType.phone,
                                        hintText: 'Write 11 numbers',
                                        controller: phoneController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please, Enter your phone';
                                          }
                                          if (value.trim().length < 11) {
                                            return 'Write 11 number';
                                          }
                                          return null;
                                        }),
                                    const CustomtitleTextFormField(
                                        text: 'Password'),
                                    AppTextForm(
                                        suffixIcon:
                                            SignupCubit.get(context).suffix,
                                        suffixPressed: () {
                                          SignupCubit.get(context)
                                              .changeVisablityPassword();
                                        },
                                        isobscure:
                                            SignupCubit.get(context).isPassword,
                                        hintText: 'Write 8 character at least',
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please, Enter your Password';
                                          }
                                          if (value.trim().length < 8) {
                                            return ' password is short .. !';
                                          }
                                          if (value !=
                                              confirmPasswordController.text) {
                                            return ' Not Match';
                                          }
                                          return null;
                                        }),
                                    const CustomtitleTextFormField(
                                        text: 'Confirm Password'),
                                    AppTextForm(
                                        suffixIcon:
                                            SignupCubit.get(context).suffix,
                                        suffixPressed: () {
                                          SignupCubit.get(context)
                                              .changeVisablityPassword();
                                        },
                                        isobscure:
                                            SignupCubit.get(context).isPassword,
                                        hintText: 'Write your password again',
                                        controller: confirmPasswordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Write your password again';
                                          }
                                          if (value !=
                                              passwordController.text) {
                                            return ' Not Match';
                                          }

                                          return null;
                                        }),
                                    verticlMediaSpace(context, 40),
                                    ConditionalBuilder(
                                      condition: state is! SignupLoadingState,
                                      builder: (context) => CustomButton(
                                          text: 'Sign up',
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              SignupCubit.get(context)
                                                  .userSignup(
                                                name: nameController.text,
                                                email: emailController.text,
                                                phone: phoneController.text,
                                                password:
                                                    passwordController.text,
                                              );
                                            }
                                          }),
                                      fallback: (context) => const Center(
                                          child: CircularProgressIndicator(
                                        color: AppColors.green,
                                      )),
                                    ),
                                    verticlMediaSpace(context, 90),
                                    HaveAnAccount(onPressed: () {
                                      GoRouter.of(context)
                                          .push(LoginView.routeName);
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
