import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/blocs/categories/categories_bloc.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoriesLoaded) {
            return SizedBox(
              height: 500,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    margin: const EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://raw.githubusercontent.com/mo7amedaliEbaid/furniture-app-riverpod/master/screenshots/details1.jpg?token=GHSAT0AAAAAACHHWU7LPMXPPHDQRP4IZM7SZLKNS7Q"
                                /*state.categories[index].categoryimage*/),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20.0)),

                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
