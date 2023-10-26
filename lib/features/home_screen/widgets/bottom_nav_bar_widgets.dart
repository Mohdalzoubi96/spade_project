import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spade_project/features/home_screen/widgets/stock_item_widget.dart';

import '../../../utils/utils.export.dart';
import '../home.export.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int index;

  const BottomNavBarWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getCurrentWidget(context);
  }

  Widget _getCurrentWidget(BuildContext context) {
    switch (index) {
      case 0:
        return _getHome(context);
      case 1:
        return const Center(child: Text('Coming Soon'));
      case 2:
        return const Center(child: Text('Coming Soon'));
      case 3:
        return const Center(child: Text('Coming Soon'));

      default:
        return const Center(child: Text('Coming Soon'));
    }
  }

  Widget _getHome(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 30.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: LightTheme.of(context).secondaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.sale_ends),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: BlocBuilder<SocketBloc, SocketState>(
                          builder: (context, state) {
                            if (state is SocketUpdatedTimeState) {
                              if(state.socketUpdatedTime.isBetween ?? false){
                                return Text(
                                  millisecondsToHMS(
                                    int.parse(
                                      state.socketUpdatedTime.timeLeft.toString(),
                                    ),
                                  ),
                                );
                              }
                              return const Text("00:00:00");
                            }

                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is GetAllAvailableStocks) {
                    return StockItemWidget(availableStocks: state);
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String millisecondsToHMS(int milliseconds) {
    // Calculate hours, minutes, and seconds from milliseconds
    int seconds = (milliseconds / 1000).round();
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    seconds = seconds % 60;

    // Create a formatted string
    String result = '';
    if (hours >= 0) {
      result += hours == 0 ? '00:' : hours < 10 ? '0$hours:' : '$hours:';
    }
    if (minutes >= 0) {
      result += minutes == 0 ? '00:' : minutes < 10 ? '0$minutes:' : '$minutes:';
    }
    if (seconds >= 0 || (hours == 0 && minutes == 0)) {
      result += seconds == 0 ? '00' : seconds < 10 ? '0$seconds' : '$seconds';
    }

    return result;
  }
}
