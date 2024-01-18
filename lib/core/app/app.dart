import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';

import '../core.dart';

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
                CategoriesBloc(categoriesRepos: CategoriesRepo())
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
          BlocProvider(
              lazy: false,
              create: (context) => NibblesInfoCubit()..fetchAboutInfo()),
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
          BlocProvider(create: (context) => SelectKidCubit()),
          BlocProvider(
              create: (context) =>
                  AddAddressCubit(addressRepository: AddressRepository())),
          BlocProvider(
              create: (context) =>
                  GetAddressCubit(addressRepository: AddressRepository())),
          BlocProvider(create: (context) => ConnectivityCubit()),
          BlocProvider(
            lazy: false,
            create: (context) => ProductsBloc(productsRepo: ProductsRepo())
              ..add(
                LoadProducts(),
              ),
          ),
          BlocProvider(
              create: (context) =>
                  PlaceOrderCubit(ordersRepository: OrdersRepository())),
          BlocProvider(
              create: (context) =>
                  GetOrdersCubit(ordersRepository: OrdersRepository())),
        ],
        child: MaterialApp(
          title: 'Nibbles',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.splash,
          theme: ThemeData(
            fontFamily: AppStrings.fontFamily,
            scaffoldBackgroundColor: AppColors.scaffoldBackground,
            checkboxTheme: CheckboxThemeData(
              fillColor: MaterialStateColor.resolveWith(
                (states) => AppColors.lightGrey,
              ),
            ),
            datePickerTheme: const DatePickerThemeData(
              backgroundColor: AppColors.commonAmber,
              headerBackgroundColor: AppColors.deepTeal,
            ),
          ),
        ),
      ),
    );
  }
}
