import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../core/constants/assets.dart';
import '../../core/validator/validator.dart';
import 'custom_textformfield.dart';

class ContactMessageForm extends StatefulWidget {
  const ContactMessageForm({super.key});

  @override
  State<ContactMessageForm> createState() => _ContactMessageFormState();
}

class _ContactMessageFormState extends State<ContactMessageForm> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Validators _validators = Validators();

  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.hf(1.3),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
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
              child: Text("Forgot Password?",style: AppText.b2,),
            ),
            Space.yf(2.5),

            Space.yf(2.5),
          ],
        ),
      ),
    );
  }
}
