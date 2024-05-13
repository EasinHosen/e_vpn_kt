import 'package:e_vpn/ui/screens/location/location_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(
          child: Text('Home Screen'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, LocationListScreen.routeName);
            /*final data = await ApiServices.instance.getVpnList();
            for (var i = 0; i < data.length; i++) {
              print(data[i]);
            }*/
          },
          child: const Icon(Icons.add),
        ));
  }
}
