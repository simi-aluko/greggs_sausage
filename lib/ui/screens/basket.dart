import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_susage/core/dimens.dart';
import 'package:greggs_susage/ui/widgets/basket_item.dart';
import 'package:greggs_susage/ui/widgets/components.dart';
import 'package:greggs_susage/ui/widgets/message_display.dart';
import '../../core/strings.dart';
import '../../domain/entities/sausage_roll_entity.dart';
import '../bloc/sausage_roll_bloc.dart';

class ScreenBasket extends StatefulWidget {
  const ScreenBasket({Key? key}) : super(key: key);

  @override
  State<ScreenBasket> createState() => _ScreenBasketState();
}

class _ScreenBasketState extends State<ScreenBasket> {
  int itemCount = 0;
  List<SausageRollEntity> basketItems = [];
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(dimenDefaultScreenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBackArrow(context),
            const SizedBox(height: 20),
            buildTitleRow(),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<SausageRollBloc, SausageRollState>(
                builder: (context, state) {
                  if (state is GetBasketLoadedState) {
                    itemCount = state.sausageRollBasketEntity.basketItems.length;
                    basketItems = state.sausageRollBasketEntity.basketItems;
                  }
                  if (basketItems.isEmpty) {
                    return const WidgetMessageDisplay(message: strBasketIsEmpty);
                  } else {
                    return ListView.separated(
                        itemBuilder: (context, position) {
                          return Dismissible(
                            key: UniqueKey(),
                            child: WidgetBasketItem(sausageRollEntity: basketItems[position]),
                            onDismissed: (DismissDirection direction) {
                              BlocProvider.of<SausageRollBloc>(context)
                                  .add(RemoveSausageFromBasketEvent(sausageRollEntity: basketItems[position]));
                            },
                          );
                          // return WidgetBasketItem(sausageRollEntity: basketItems[position]);
                        },
                        separatorBuilder: (context, index) => buildSeparatorBuilder(),
                        itemCount: itemCount);
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            buildSeparatorBuilder(),
            buildSubTotalRow()
          ],
        ),
      ),
    ));
  }

  buildTitleRow() {
    return Row(
      children: [
        buildShoppingBag(),
        const SizedBox(height: 10),
        buildItemDetailTitle(title: strBasket),
      ],
    );
  }

  buildSubTotalRow() {
    return BlocBuilder<SausageRollBloc, SausageRollState>(
      builder: (context, state) {
        if (state is GetBasketLoadedState) {
          total = state.sausageRollBasketEntity.total;
        }
        return ListTile(
          horizontalTitleGap: 0,
          contentPadding: const EdgeInsets.all(0),
          leading: buildXLTitleBlack(title: strSubTotal),
          trailing: buildXLTitleBlack(title: "£${total.toStringAsFixed(2)}"),
        );
      },
    );
  }
}
