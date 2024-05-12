import 'package:e_vpn/routes/app_router.dart';
import 'package:e_vpn/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /*BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),*/
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
