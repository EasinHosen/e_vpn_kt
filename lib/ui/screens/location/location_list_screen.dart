import 'dart:math';

import 'package:e_vpn/blocs/location_list_bloc/location_list_cubit.dart';
import 'package:e_vpn/data/helpers/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/location_list_bloc/location_list_state.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen({super.key});
  static const routeName = '/location_list_screen';

  @override
  Widget build(BuildContext context) {
    context.read<LocationListCubit>().fetchLocations();
    return Scaffold(
      appBar: AppBar(
        title: Text('Location List Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<LocationListCubit, LocationListState>(
              builder: (context, state) {
                if (state is LocationListDataLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LocationListDataLoadedState) {
                  return RefreshIndicator(
                    onRefresh: () =>
                        context.read<LocationListCubit>().fetchLocations(),
                    child: ListView.builder(
                      itemCount: state.locationList.length,
                      itemBuilder: (context, index) {
                        final vpn = state.locationList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Card(
                            color: Color(0xD3EEFCFF),
                            elevation: 3,
                            // margin: const EdgeInsets.symmetric(
                            //     horizontal: 4, vertical: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: Text(vpn.countryLong),
                              subtitle: Row(
                                children: [
                                  const Icon(Icons.speed_rounded,
                                      color: Colors.blue, size: 20),
                                  const SizedBox(width: 4),
                                  Text(_formatBytes(int.parse(vpn.speed), 1),
                                      style: const TextStyle(fontSize: 13))
                                ],
                              ),
                              leading: Container(
                                padding: const EdgeInsets.all(.5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(5)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                      'assets/images/flags/${vpn.countryShort.toLowerCase()}.png',
                                      height: 30,
                                      width: MediaQuery.of(context).size.width *
                                          .10,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(vpn.numVpnSessions.toString(),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight
                                            .w500, /*color: Theme.of(context).lightText*/
                                      )),
                                  SizedBox(width: 4),
                                  Icon(Icons.people_outline,
                                      color: Colors.blue),
                                ],
                              ),
                              onTap: () => loggerDebug('item', vpn.toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is LocationListDataLoadErrorState) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ['Bps', "Kbps", "Mbps", "Gbps", "Tbps"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
