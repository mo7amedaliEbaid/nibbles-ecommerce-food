# Nibbles - Flutter Food App 🍔🍕🍰

Nibbles is a Flutter-based food app designed to provide users with a delightful and user-friendly experience as they explore a variety of meals and food packages📦. The app utilizes the Bloc pattern and Cubits for efficient state management, integrates Firebase Firestore for real-time data storage, and incorporates various plugins to enhance its functionality.

## Features

- **Ecommerce Experience:** Enjoy a seamless ecommerce experience, effortlessly exploring a diverse range of meals and food packages.
  
- **Complex UI Design:** Immerse yourself in a visually appealing and sophisticated user interface for an engaging experience.
  
- **Firebase Integration:** Access real-time data with Firebase Firestore, ensuring the latest information on meals and food packages.
  
- **Authentication:** Sign up and sign in securely using Firebase Authentication, providing a reliable and safe user experience.
  
- **🔍Search Functionality:** Easily find specific meals or food packages based on preferences with a robust search feature.
  
- **Qr Code Scanner:** Quickly access relevant information through the integrated Qr code scanner.

#### Note: the meals qr codes i used in this app are provided in [Here](https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/314de2ef6b9f425cee73678f3d03a96e8d35f29b/meals_qrcodes)

  
- **❤️Favourite Lists:** Manage your favourite lists, making it convenient to keep track of preferred meals and food packages.
  
- **Filter Options:** Refine your search with filter options based on specific criteria, enhancing the overall browsing experience.
  
- **📞Contact Us:** Connect with app administrators using the "Contact Us" feature.
  
- **App Info Screens:** Access essential app-related information with informative screens such as "About" and "Privacy.".
  
- **🧒Kid Accounts:** Enable users to create accounts for their kids with a dedicated `AddKidScreen`.

- **Responsive Layouts:** The UI design is responsive, adapting gracefully to various screen sizes.

- **🔔Notifications:** Stay informed about special offers, new arrivals, and more with our notification feature powered by Firebase Cloud Messaging.

- **🏠Addresses:** Easily manage your delivery addresses, making the ordering process more convenient and efficient.

- **Orders:** Place your orders and select the address and delivery date.

- **Kid Profile:** Browse and manage your kids profiles.

## Directory Structure

The project is organized into several directories:

- **application:** Contains feature Blocs, global Cubits, and logic for state management.
  
- **configs:** Includes configuration files such as spaces, app text and typography.

- **core:** Houses fundamental app components like the main app file, enums, router, extensions, constants, etc.
  
- **models:** Contains data models used throughout the app, including structures for meals and users.
  
- **presentation:** Encompasses the app's user interface, featuring screens and widgets for an enhanced visual experience.
  
- **repositories:** Includes repositories for meals, packages, and other relevant data.


```
project_root
│
├── 📁 application
│   ├── 📁 blocs
│   │   └── ...
│   ├── 📁 cubits
│   │   └── ...
│   └── ...
│
├── 📁 configs
│   ├── 📄 apptext.dart
│   ├── 📄 app_typography.dart
│   └── ...
│
├── 📁 core
│   ├── 📄 app.dart
│   ├── 📄 enums.dart
│   ├── 📄 extensions.dart
│   ├── 📄 constants.dart
│   └── ...
│
├── 📁 models
│   ├── 📄 meal.dart
│   ├── 📄 user.dart
│   └── ...
│
├── 📁 presentation
│   ├── 📁 screens
│   │   ├── 📄 home_screen.dart
│   │   ├── 📄 search_screen.dart
│   │   └── ...
│   └── 📁 widgets
│       ├── 📄 custom_button.dart
│       ├── 📄 bottom_navbar.dart
│       └── ...      
│
└── 📁 repositories
    ├── 📁 meals_repos
    ├── 📁 packages_repos
    └── ...
```

## Dependencies

- **flutter_svg:** Renders SVG files for scalable and crisp vector graphics.
  
- **firebase_core:** Essential functionality for initializing Firebase services within a Flutter app.
  
- **cloud_firestore:** Facilitates seamless integration with Cloud Firestore, a NoSQL document database.
  
- **firebase_auth:** Enables secure user authentication, supporting sign-up and sign-in processes.
  
- **smooth_page_indicator:** Creates smooth and customizable page indicators for improved navigation.
  
- **buttons_tabbar:** Provides a variety of customizable tab bar styles, enhancing visual appeal and user interaction.
  
- **equatable:** Simplifies the implementation of equality and hash code methods for easier object comparison.
  
- **flutter_bloc:** A state management library for organizing and separating business logic from UI components.
  
- **carousel_slider:** Creates carousel sliders for implementing image sliders or other sliding content.
  
- **flutter_barcode_scanner:** A plugin for scanning barcodes and QR codes using the device's camera.
  
- **url_launcher:** Opens URLs in the default web browser, facilitating external content connections.

- **connectivity_plus:** Provides a simple and efficient way to monitor the network connectivity status of a device.

- **table_calendar:** Highly customizable, feature-packed calendar widget for Flutter.

- **firebase_messaging:** Flutter plugin for Firebase Cloud Messaging, a cross-platform messaging solution that lets you reliably deliver messages on Android and iOS.

- **flutter_local_notifications** A cross platform plugin for displaying and scheduling local notifications for Flutter applications with the ability to customise for each platform.
  
These dependencies collectively contribute to the functionality, design, and user experience of the Nibbles Flutter app, ensuring a robust and feature-rich application for exploring meals and food packages.

## Blocs and Cubits

- AuthBloc
- CategoriesBloc
- UserBloc
- SignUpBloc
- SignInBloc
- PackagesBloc
- MealsBloc
- ProductsBloc
- NavigationCubit
- FavoriteMealsCubit
- SearchCubit
- FavouritePackagesCubit
- FilterCubit
- ContactUsCubit
- AddKidsCubit
- GetKidsCubit.
- KidsStepsCubit
- AddAddressCubit
- GetAddressesCubit
- ConnectivityCubit
- InfoCubit.
- SelectKidCubit.
- PlaceOrderCubit.
- GetOrdersCubit.

## Download App
<a href="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-food/releases/download/v1.0.0/nibbles.apk"><img src="https://playerzon.com/asset/download.png" width="150"></img></a>

## Screens

- AboutScreen
- AddKidScreen
- CategoriesScreen
- ContactScreen
- FavoritesScreen
- HomeScreen
- IntroScreen
- LoginScreen
- MealDetailsScreen
- MealsByCategoryScreen
- MoreScreen
- SelectKidScreen
- OffersScreen
- PackagesScreen
- PrivacyScreen
- ProfileScreen
- QrCodeScreen
- RootScreen
- SearchScreen
- SignUpScreen
- AdsScreen
- SplashScreen
- TermsScreen
- CheckoutScreen
- SuccessfulOrderScreen.
- SubscriptionsScreen.
- OrderDetailsScreen.
- KidProfileScreen.

More ScreenShots [Here](https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/314de2ef6b9f425cee73678f3d03a96e8d35f29b/screenshots)

<p float="left">
 <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/1cde5c679967f75e26e53560a374ead1a65b6ccc/screenshots/homeupd3.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/1cde5c679967f75e26e53560a374ead1a65b6ccc/screenshots/homeupd2.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/e3c1e25bc5f72b7abf378f1daebedd884cd757df/screenshots/categories.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/c6bdac5525e7ce3fd5ab2b491d22bb0efbb693fa/screenshots/profile.jpg" width="180"/>
 <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/cac9447485e531c6bd9982e36a7194a39435540e/screenshots/intro.jpg" width="180"/> 
 <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/b02c61118bd41ef9a4fb08dc7ac9a98466844903/screenshots/mealdetails2.jpg" width="180"/>
 <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/5ce0e278b1426f8b49bc51c0f75a24bcfc441c03/screenshots/more.jpg" width="180"/>
 <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/3617d16f57339b8af23d45d15a681903c08ee88e/screenshots/contactscr.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/25e1b1610d13a610deb75a3f2552d4fe31db49a0/screenshots/mealsbycat.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/6fba63ae361814d9a76491e2fe5cf3eca53abd99/screenshots/signup.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/25e1b1610d13a610deb75a3f2552d4fe31db49a0/screenshots/search.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/5ce0e278b1426f8b49bc51c0f75a24bcfc441c03/screenshots/offers.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/90fa0050dfa4fe6819ca3058c4ebc6defe1b16cf/screenshots/ads.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/1cde5c679967f75e26e53560a374ead1a65b6ccc/screenshots/packages.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/6442a79d60c09586d6ab9031a00458584971fb06/screenshots/searchnotfound.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/1cde5c679967f75e26e53560a374ead1a65b6ccc/screenshots/qrcode.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/b02c61118bd41ef9a4fb08dc7ac9a98466844903/screenshots/mealdetails1.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/a91307f937eb3237703d892d3aae71d0c8244e54/screenshots/login.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/3617d16f57339b8af23d45d15a681903c08ee88e/screenshots/favmeals.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/3617d16f57339b8af23d45d15a681903c08ee88e/screenshots/about.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/3617d16f57339b8af23d45d15a681903c08ee88e/screenshots/termsn.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/c96ede35eee2357d28f708a89f9743b91c0d9a4c/screenshots/addkid1.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/c96ede35eee2357d28f708a89f9743b91c0d9a4c/screenshots/nokids.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/a91307f937eb3237703d892d3aae71d0c8244e54/screenshots/kidProfile.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/a91307f937eb3237703d892d3aae71d0c8244e54/screenshots/kidPofile2.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/c96ede35eee2357d28f708a89f9743b91c0d9a4c/screenshots/signupfull.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/7cba9423efb343b5b86e000172cd8f5cbd6f79e5/screenshots/noconnection.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/7cba9423efb343b5b86e000172cd8f5cbd6f79e5/screenshots/add_addressem.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/7cba9423efb343b5b86e000172cd8f5cbd6f79e5/screenshots/addresses.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/314de2ef6b9f425cee73678f3d03a96e8d35f29b/screenshots/check1.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/314de2ef6b9f425cee73678f3d03a96e8d35f29b/screenshots/chech.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/314de2ef6b9f425cee73678f3d03a96e8d35f29b/screenshots/orderdetails.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/314de2ef6b9f425cee73678f3d03a96e8d35f29b/screenshots/select-date.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/314de2ef6b9f425cee73678f3d03a96e8d35f29b/screenshots/select-kid.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/314de2ef6b9f425cee73678f3d03a96e8d35f29b/screenshots/successfulorder.jpg" width="180"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/314de2ef6b9f425cee73678f3d03a96e8d35f29b/screenshots/subscriptions.jpg" width="180"/>

</p>

## Getting Started

To get started with Nibbles:

1. Clone the repository to your local machine.
2. Open the project in your preferred Flutter development environment.
3. Ensure you have the necessary dependencies installed using `flutter pub get`.
4. Run the app on your preferred emulator or physical device.

Feel free to explore and customize the app according to your needs. Share your feedback!


## License

- This project is licensed under the MIT License, allowing for flexibility and collaboration.

- Happy coding and happy nibbling with Nibbles! 🍔🍕🍰

## Firestore.

More ScreenShots [Here](https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/8611cc4b32da8006acfdddf77d52c107546b0539/firestoreScreenshots)

<p float="left">
 <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/8611cc4b32da8006acfdddf77d52c107546b0539/firestoreScreenshots/meal.png" width="880"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/8611cc4b32da8006acfdddf77d52c107546b0539/firestoreScreenshots/addresses.png" width="880"/>
  <img src="https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/blob/8611cc4b32da8006acfdddf77d52c107546b0539/firestoreScreenshots/packages.png" width="880"/>

</p>

# Demos



https://github.com/mo7amedaliEbaid/nibbles-ecommerce-food/assets/131966482/0b600127-b59e-414b-ade8-7f033fe52ea7




https://github.com/mo7amedaliEbaid/nibbles-ecommerce/assets/131966482/b61a63e2-07a8-47f0-87e1-4dd85884c4a1



https://github.com/mo7amedaliEbaid/nibbles-ecommerce-complex-ui/assets/131966482/015740aa-b53e-4abf-9de3-9a160e9a4e83



https://github.com/mo7amedaliEbaid/nibbles-ecommerce/assets/131966482/f0dcc29c-dc52-4dca-b4d3-29a84e0c7df4






