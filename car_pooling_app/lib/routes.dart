import 'package:car_pooling_app/feature/auth/binding/auth_bindings.dart';
import 'package:car_pooling_app/feature/driver/view/driver_app.dart';
import 'package:car_pooling_app/feature/driver/view/driver_profile_form_page.dart';
import 'package:car_pooling_app/feature/history/binding/history_binding.dart';
import 'package:car_pooling_app/feature/history/view/driver_history_page.dart';
import 'package:car_pooling_app/feature/home/binding/home_bindings.dart';
import 'package:car_pooling_app/feature/map_feature/bindings/driver_map_binding.dart';
import 'package:car_pooling_app/feature/notifications/binding/notification_bindings.dart';
import 'package:car_pooling_app/feature/notifications/view/notificaiton_page.dart';
import 'package:car_pooling_app/feature/profile/bindings/profile_binding.dart';
import 'package:car_pooling_app/feature/profile/views/driver_info_page.dart';
import 'package:car_pooling_app/feature/profile/views/update_profile_page.dart';
import 'package:car_pooling_app/feature/splash/bindings/get_driver_bindings.dart';
import 'package:car_pooling_app/feature/splash/view/driver_to_passenger.dart';
import 'package:car_pooling_app/feature/splash/view/passenger_to_driver.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'feature/auth/view/login_page.dart';
import 'feature/auth/view/passneger_info_page.dart';
import 'feature/history/view/passenger_history_page.dart';
import 'feature/home/view/home_page.dart';
import 'feature/map_feature/view/driver_map_page.dart';
import 'feature/profile/views/passenger_info_page.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
  ),
  GetPage(
    name: '/passenger/form',
    page: () => PassengerInfoFormPage(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: '/home/notification',
    page: () => const NotificationPage(),
    binding: NotificationBinding(),
  ),
  GetPage(
    name: '/passengers',
    page: () => const PassengersInfo(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: '/passengers/update',
    page: () => UpdateProfilePage(),
  ),
  GetPage(
    name: '/passengers/history',
    page: () => const PassengerHistoryPage(),
    binding: HistoryBinding(),
  ),

  // * Drivers
  GetPage(
    name: '/drivers/form',
    page: () => DriverProfileForm(),
  ),
  GetPage(
    name: '/drivers/home',
    page: () => const DriverApp(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: '/drivers/profile',
    page: () => DriverInfoPage(),
    binding: ProfileBinding(),
  ),
  
  GetPage(
    name: "/drivers/route",
    page: () => DriverMapPage(),
    binding: DriverMapBinding(),
  ),
  GetPage(
    name: '/drivers/history',
    page: () => DriverHistoryPage(),
    binding: HistoryBinding(),
  ),

  // * Splash
  GetPage(
      name: '/PtoD',
      page: () => const PassengerToDriver(),
      binding: GetDriverBindings()),
  GetPage(
    name: '/DtoP',
    page: () => const DriverToPassenger(),
  ),
];
