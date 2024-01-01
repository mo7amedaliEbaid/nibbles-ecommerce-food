import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';

import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/constants/strings.dart';
import 'package:nibbles_ecommerce/models/contact_message.dart';

import '../../configs/configs.dart';
import '../../core/validator/validator.dart';

class ContactMessageForm extends StatefulWidget {
  const ContactMessageForm({super.key});

  @override
  State<ContactMessageForm> createState() => _ContactMessageFormState();
}

class _ContactMessageFormState extends State<ContactMessageForm> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Validators _validators = Validators();

  // bool _isSubmitting = false;

  @override
  void dispose() {
    _messageController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.hf(1.3),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send Us a message".toUpperCase(),
              style: AppText.h3b,
            ),
            Space.yf(.3),
            customTextFormField(
                label: "Name",
                controller: _nameController,
                validator: _validators.validateFirstName),
            Space.yf(1.3),
            customTextFormField(
                label: "Email",
                controller: _emailController,
                validator: _validators.validateEmail),
            Space.yf(1.3),
            customTextFormField(
                label: "Phone Number",
                controller: _phoneController,
                validator: _validators.validatePhoneNumber),
            Space.yf(1.3),
            customTextFormField(
                label: "Message",
                controller: _messageController,
                validator: _validators.validateMessage),
            Space.yf(2.5),
            BlocBuilder<ContactUsCubit, ContactUsState>(
              builder: (context, state) {
                return customElevatedButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        context.read<ContactUsCubit>().sendMessage(
                            ContactMessage(
                                message: _messageController.text,
                                phone: _phoneController.text,
                                email: _emailController.text,
                                name: _nameController.text));

                        if (state is ContactUsSuccess) {
                          _nameController.clear();
                          _phoneController.clear();
                          _emailController.clear();
                          _messageController.clear();
                          await showThanksBottomSheet(context);
                        }
                      }
                    },
                    text: (state is ContactUsLoading)
                        ? AppStrings.wait
                        : "Send".toUpperCase(),
                    heightFraction: 20,
                    width: double.infinity,
                    color: AppColors.commonAmber,
                    radiusFraction: 6);
              },
            ),
            Space.yf(1.5),
          ],
        ),
      ),
    );
  }
}
