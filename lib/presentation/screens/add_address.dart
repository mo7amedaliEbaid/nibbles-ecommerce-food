import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

import 'package:nibbles_ecommerce/models/address.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:nibbles_ecommerce/presentation/widgets.dart';

import '../../application/cubits/add_address/add_address_cubit.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _bloc = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _house = TextEditingController();
  final TextEditingController _floor = TextEditingController();
  final TextEditingController _apartment = TextEditingController();
  final TextEditingController _instructions = TextEditingController();
  final Validators _validators = Validators();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    _number.dispose();
    _area.dispose();
    _bloc.dispose();
    _street.dispose();
    _house.dispose();
    _floor.dispose();
    _apartment.dispose();
    _instructions.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: Space.all(1.2, .5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add new Address".toUpperCase(),
                  style: AppText.h2b,
                ),
                Space.yf(.5),
                customTextFormField(
                    label: "Address Title*",
                    controller: _title,
                    validator: _validators.validateString),
                Space.yf(1.3),
                customTextFormField(
                    label: "Address Contact Number*",
                    controller: _number,
                    validator: _validators.validatePhoneNumber),
                Space.yf(1.3),
                customTextFormField(
                    label: "Area*",
                    controller: _area,
                    validator: _validators.validateString),
                Space.yf(1.3),
                customTextFormField(
                    label: "Block*",
                    controller: _bloc,
                    validator: _validators.validateString),
                Space.yf(1.3),
                customTextFormField(
                    label: "Street*",
                    controller: _street,
                    validator: _validators.validateString),
                Space.yf(1.3),
                customTextFormField(
                    label: "Building/house number*",
                    controller: _house,
                    validator: _validators.validateNumbers),
                Space.yf(1.3),
                customTextFormField(
                    label: "Floor Number*",
                    controller: _floor,
                    validator: _validators.validateNumbers),
                Space.yf(1.3),
                customTextFormField(
                    label: "Apartment Number*",
                    controller: _apartment,
                    validator: _validators.validateNumbers),
                Space.yf(1.3),
                customTextFormField(
                    label: "Other Instructions*",
                    controller: _instructions,
                    validator: _validators.validateMessage),
                Space.yf(2.5),
                BlocBuilder<AddAddressCubit, AddAddressState>(
                  builder: (context, state) {
                    return customElevatedButton(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            context.read<AddAddressCubit>().addAddress(Address(
                                bloc: _bloc.text,
                                street: _street.text,
                                house: _house.text,
                                title: _title.text,
                                number: _number.text,
                                area: _area.text,
                                floor: _floor.text,
                                apartment: _apartment.text,
                                instructions: _instructions.text));
                            // if (state is AddressAddedSuccessfully) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRouter.addresses,
                              (route) => route.isFirst,
                            );
                          }
                          //   }
                        },
                        text: (state is AddAddressLoading)
                            ? AppStrings.wait
                            : "Add Address".toUpperCase(),
                        heightFraction: 20,
                        width: double.infinity,
                        color: AppColors.commonAmber);
                  },
                ),
                Space.yf(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
