import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/meals/meals_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/packages/packages_bloc.dart';
import 'package:nibbles_ecommerce/application/cubits/contact/contact_cubit.dart';
import 'package:nibbles_ecommerce/application/cubits/favourite_meals/fav_meals_cubit.dart';
import 'package:nibbles_ecommerce/application/cubits/favourite_packages/fav_packages_cubit.dart';
import 'package:nibbles_ecommerce/application/cubits/get_address/get_address_cubit.dart';
import 'package:nibbles_ecommerce/application/cubits/add_kids/add_kids_cubit.dart';
import 'package:nibbles_ecommerce/application/cubits/get_kids/get_kids_cubit.dart';
import 'package:nibbles_ecommerce/application/cubits/kids_steps/kids_steps_cubit.dart';
import 'package:nibbles_ecommerce/application/cubits/search/search_cubit.dart';
import 'package:nibbles_ecommerce/repositories/address_repo/address_repo.dart';
import 'package:nibbles_ecommerce/repositories/categories_repos/categories_repos.dart';
import 'package:nibbles_ecommerce/repositories/favourite_meals_repo/fav_meals_repo.dart';
import 'package:nibbles_ecommerce/repositories/favourite_packages_repo/fav_packages_repo.dart';
import 'package:nibbles_ecommerce/repositories/kid_repos/kid_repo.dart';
import 'package:nibbles_ecommerce/repositories/meals_repos/meal_repo.dart';
import 'package:nibbles_ecommerce/repositories/packages_repos/package_repo.dart';

import '../../application/blocs/auth_bloc/auth_bloc.dart';
import '../../application/blocs/categories/categories_bloc.dart';
import '../../application/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../application/blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../application/blocs/user_bloc/user_bloc.dart';
import '../../application/cubits/add_address/add_address_cubit.dart';
import '../../application/cubits/connectivity/connectivity_cubit.dart';
import '../../application/cubits/filter/filter_cubit.dart';
import '../../application/cubits/navigation/navigation_cubit.dart';
import '../../application/cubits/nibbles_info/nibbles_info_cubit.dart';
import '../../repositories/auth_repos/auth_repos.dart';
import '../../repositories/user_repos/user_repos.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../functions/fcm.dart';
import '../router/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initFcm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(
              firebaseAuth: FirebaseAuth.instance,
              firestore: FirebaseFirestore.instance),
        ),
        RepositoryProvider(
          create: (context) =>
              UserRepository(firebaseFirestore: FirebaseFirestore.instance),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            )..add(InitializeAuthEvent()),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => UserBloc(
              authBloc: context.read<AuthBloc>(),
              userRepository: context.read<UserRepository>(),
            )..add(StartUserEvent()),
          ),
          BlocProvider(
            create: (context) =>
                SignUpBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                SignInBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                CategoriesBloc(categoriesRepos: CategoriesRepos())
                  ..add(
                    LoadCategories(),
                  ),
          ),
          BlocProvider(
            create: (context) => PackagesBloc(packagesRepos: PackagesRepos())
              ..add(
                LoadPackages(),
              ),
          ),
          BlocProvider(
            create: (context) => MealsBloc(mealsRepo: MealsRepo()),
          ),
          BlocProvider(create: (context) => NavigationCubit()),
          BlocProvider(create: (context) => NibblesInfoCubit()),
          BlocProvider(
            create: (context) => SearchCubit(
                mealsRepo: MealsRepo(), packagesRepos: PackagesRepos()),
          ),
          BlocProvider(
            create: (context) => FavoriteMealsCubit(FavoriteMealsRepository())
              ..loadFavorites(FirebaseAuth.instance.currentUser!.uid),
          ),
          BlocProvider(
            create: (context) =>
                FavouritePackagesCubit(FavoritePackagesRepository())
                  ..loadFavorites(FirebaseAuth.instance.currentUser!.uid),
          ),
          BlocProvider(
            create: (context) => FilterCubit(mealsRepo: MealsRepo()),
          ),
          BlocProvider(
            create: (context) => ContactUsCubit(),
          ),
          BlocProvider(
            create: (context) => KidsStepsCubit(),
          ),
          BlocProvider(
              create: (context) =>
                  GetKidsCubit(kidsRepository: KidsRepository())),
          BlocProvider(
              create: (context) =>
                  AddKidsCubit(kidsRepository: KidsRepository())),
          BlocProvider(
              create: (context) =>
                  AddAddressCubit(addressRepository: AddressRepository())),
          BlocProvider(
              create: (context) =>
                  GetAddressCubit(addressRepository: AddressRepository())),
          BlocProvider(create: (context) => ConnectivityCubit())
        ],
        child: MaterialApp(
          title: 'Nibbles',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.splash,
          theme: ThemeData(
            fontFamily: AppStrings.fontFamily,
            scaffoldBackgroundColor: AppColors.scafoldBackground,
            checkboxTheme: CheckboxThemeData(
              fillColor: MaterialStateColor.resolveWith(
                (states) => AppColors.lightGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
