import 'package:e_vpn/ui/screens/location/location_list_screen.dart';
import 'package:flutter/material.dart';

import '../ui/screens/home/home_screen.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    // SplashScreen.routeName: (context) => const SplashScreen(),

    HomeScreen.routeName: (context) => const HomeScreen(),
    LocationListScreen.routeName: (context) => const LocationListScreen(),
    // CreateTicketScreen.routeName: (context) => const CreateTicketScreen(),
  };
}
