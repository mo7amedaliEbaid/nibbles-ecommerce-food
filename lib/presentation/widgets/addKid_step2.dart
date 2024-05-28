import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/add_kids/add_kids_cubit.dart';
import '../../core/core.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

import 'custom_elevated_button.dart';
import 'custom_textformfield.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final Validators _validators = Validators();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.all(1, 1.2),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            customTextFormField(
                label: "Diet Goal (optional)",
                controller: _nameController,
               /* validator: _validators.validateFirstName*/),
            Space.yf(1.3),
            customTextFormField(
                label: "Goal Weight (optional)",
                controller: _genderController,
               /* validator: _validators.validateGender*/),

            Space.yf(1.3),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Health Problems*',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 3,
            ),
            Space.yf(3.3),
            BlocConsumer<AddKidsCubit, AddKidsState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Padding(
                  padding: Space.h!,
                  child: customElevatedButton(
                      onTap: () {
                        /*     if (_formKey.currentState!.validate()) {
                          context.read<AddKidsCubit>().addKid(Kid(
                              gender: _genderController.text,
                              name: _nameController.text,
                              age: _ageController.text,
                              height: _heightController.text,
                              weight: _weightController.text));
                          context
                              .read<GetKidsCubit>()
                              .getKids(FirebaseAuth.instance.currentUser!.uid);
                          Navigator.pop(context);*/

                        /*     if (state is KidsAddedSuccessfully) {
                            _genderController.clear();
                            _nameController.clear();
                            _ageController.clear();
                            _heightController.clear();
                            _weightController.clear();
                          }*/
                        //  }
                      },
                      text: (state is! AddKidsLoading)
                          ? "Next".toUpperCase()
                          : AppStrings.wait,
                      heightFraction: 20,
                      width: double.infinity,
                      color: AppColors.commonAmber),
                );
              },
            ),
            Space.yf(1.3),
          ],
        ),
      ),
    );
  }
}
