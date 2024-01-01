import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

import '../../models/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Validators _validators = Validators();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  authTopColumn(true),
                  customTextFormField(
                      label: "Name*",
                      svgUrl: AppAssets.username,
                      controller: _nameController,
                      validator: _validators.validateFirstName),
                  Space.yf(1.3),
                  customTextFormField(
                      label: "Email*",
                      svgUrl: AppAssets.email,
                      controller: _emailController,
                      validator: _validators.validateEmail),
                  Space.yf(1.3),
                  customTextFormField(
                      label: "Phone Number*",
                      svgUrl: AppAssets.phone,
                      controller: _phoneController,
                      validator: _validators.validatePhoneNumber),
                  Space.yf(1.3),
                  customTextFormField(
                      label: "Password*",
                      svgUrl: AppAssets.password,
                      controller: _passwordController,
                      validator: _validators.validatePassword),
                  Space.yf(1.3),
                  customTextFormField(
                    label: "Confirm Password*",
                    svgUrl: AppAssets.password,
                    controller: _confirmPasswordController,
                    validator: (value) => _validators.validateConfirmPassword(
                      _passwordController.text,
                      value,
                    ),
                  ),
                  Space.yf(1.5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppDimensions.normalize(10),
                        width: AppDimensions.normalize(10),
                        child: Material(
                          borderRadius:
                              BorderRadius.circular(AppDimensions.normalize(2)),
                          color: AppColors.lightGrey,
                          child: const Checkbox(
                            value: true,
                            onChanged: null,
                            checkColor: AppColors.antiqueRuby,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                      ),
                      Space.xf(),
                      Text(
                        "I accept all privacy policies and terms&\nConditions of Nibbles.",
                        style: AppText.b1
                            ?.copyWith(color: AppColors.greyText, height: 1.5),
                      ).withDifferentStyle("Nibbles",
                          AppText.h3b!.copyWith(color: AppColors.antiqueRuby))
                    ],
                  ),
                  Space.yf(1.5),
                  BlocConsumer<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      if (state.status == SignUpStatus.error) {
                        showErrorAuthBottomSheet(context);
                      }

                      if (state.status == SignUpStatus.success) {
                        showSuccessfulAuthBottomSheet(context, true);
                      }
                    },
                    builder: (context, state) {
                      return customElevatedButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              User user = User(
                                fullName: _nameController.text.trim(),
                                email: _emailController.text.trim(),
                                phoneNumber: _phoneController.text.trim(),
                              );
                              context.read<SignUpBloc>().add(
                                    SignUpWithCredential(
                                      user: user,
                                      password: _passwordController.text,
                                    ),
                                  );
                            }
                          },
                          text: (state.status == SignUpStatus.submitting)
                              ? AppStrings.wait
                              : "SIGN UP",
                          heightFraction: 20,
                          width: double.infinity,
                          color: AppColors.commonAmber);
                    },
                  ),
                  Space.yf(2.5),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: authBottomButton(
        true,
        () {
          Navigator.of(context).pushNamed(AppRouter.login);
        },
      ),
    );
  }
}
