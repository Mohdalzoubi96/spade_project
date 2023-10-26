import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:spade_project/utils/theme/light_theme.dart';

import '../home.export.dart';

class StockItemWidget extends StatelessWidget {
  final GetAllAvailableStocks availableStocks;
  const StockItemWidget({Key? key, required this.availableStocks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: availableStocks.availableStocks.rows!.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (ctx, index){
        return const SizedBox(height: 10);
      },
      itemBuilder: (cyx, index){
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: LightTheme.of(context).secondaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Part No: '),
                  Text(availableStocks.availableStocks.rows![index].partNumber ?? ''),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text('Product: '),
                    Flexible(child: Text(availableStocks.availableStocks.rows![index].title ?? '',maxLines: 3,)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text('Color: '),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor(availableStocks.availableStocks.rows![index].attributesGroups!.last.attribute!.hex ?? '#000000')
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text('Model No: '),
                    Flexible(child: Text(availableStocks.availableStocks.rows![index].modelNumber ?? '',maxLines: 3,)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text('Total Available QTY: '),
                    Flexible(child: Text(availableStocks.availableStocks.rows![index].totalQuantity ?? '',maxLines: 3,)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text('Lowest Price: '),
                    Flexible(child: Text(availableStocks.availableStocks.rows![index].lowestPriceVariant ?? '',maxLines: 3,)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 40.w,
                  height: 6.h,
                  child: const ElevatedButton(
                    onPressed: null,
                    child:
                    Text('Confirm order'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
