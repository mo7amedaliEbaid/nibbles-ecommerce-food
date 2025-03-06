import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nibbles_ecommerce/presentation/widgets.dart';

import '../../application/cubits/nibbles_info/nibbles_info_cubit.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  void initState() {
    // context.read<NibblesInfoCubit>().fetchTermsInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: BlocBuilder<NibblesInfoCubit, NibblesInfoState>(
        builder: (context, state) {
          if (state is NibblesInfoLoaded) {
            return NibblesInfoBody(
                nibblesInfo: state.info, title: "Terms and conditions");
          } else {
            return const Center(child: LoadingTicker(text: "Loading"));
          }
        },
      ),
    );
  }
}
