import 'package:e_vpn/blocs/location_list_bloc/location_list_cubit.dart';
import 'package:e_vpn/routes/app_router.dart';
import 'package:e_vpn/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/home_bloc/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<LocationListCubit>(
          create: (context) => LocationListCubit(),
        ),
      ],
      child: MaterialApp(
        initialRoute: HomeScreen.routeName,
        debugShowCheckedModeBanner: false,
        routes: AppRouter.routes,
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        // supportedLocales: L10n.all,
      ),
    );
  }
}
