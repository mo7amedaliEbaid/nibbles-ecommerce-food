import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';

import '../../configs/app_dimensions.dart';
import '../../configs/space.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';
import '../../core/enums/enums.dart';
import '../../core/validator/validator.dart';
import '../widgets/auth_bottom_sheets.dart';
import '../widgets/auth_screens_components.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Validators _validators = Validators();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(top: AppDimensions.normalize(20)),
          child: Padding(
            padding: Space.hf(1.3),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  authTopColumn(false),
                  customTextFormField(
                      label: "Email Address*",
                      svgUrl: AppAssets.email,
                      controller: _emailController,
                      validator: _validators.validateEmail),
                  Space.yf(1.3),
                  customTextFormField(
                      label: "Password*",
                      svgUrl: AppAssets.password,
                      controller: _passwordController,
                      validator: _validators.validatePassword),
                  Space.yf(.3),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: AppText.b2,
                    ),
                  ),
                  Space.yf(2.5),
                  BlocConsumer<SignInBloc, SignInState>(
                    listener: (context, state) {
                      if (state.status == SignInStatus.error) {
                        showErrorAuthBottomSheet(context);
                      }
                      if (state.status == SignInStatus.success) {
                        showSuccessfulAuthBottomSheet(context, false);
                      }
                    },
                    builder: (context, state) {
                      return customElevatedButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignInBloc>().add(
                                  SignInWithCredential(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                );
                          }
                        },
                        text: (state.status == SignInStatus.submitting)
                            ? AppStrings.wait
                            : "Login".toUpperCase(),
                        heightFraction: 20,
                        width: double.infinity,
                        color: AppColors.commonAmber,
                      );
                    },
                  ),
                  Space.yf(2.5),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: authBottomButton(false, () {
        Navigator.of(context).pushNamed(AppRouter.signup);
      }),
    );
  }
}
