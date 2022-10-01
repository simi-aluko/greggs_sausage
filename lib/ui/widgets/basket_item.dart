import 'package:flutter/material.dart';
import 'package:greggs_susage/core/strings.dart';
import 'package:greggs_susage/ui/widgets/components.dart';

import '../../domain/entities/sausage_roll_entity.dart';

class WidgetBasketItem extends StatelessWidget {
  final SausageRollEntity sausageRollEntity;
  const WidgetBasketItem({super.key, required this.sausageRollEntity});

  @override
  Widget build(BuildContext context) {
    double price = sausageRollEntity.isEatIn ? sausageRollEntity.eatInPrice : sausageRollEntity.eatOutPrice;
    String servingChoice = sausageRollEntity.isEatIn ? strEatIn : strEatOut;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildItemListTitleBlack(title: sausageRollEntity.articleName),
            buildItemListTextDescription(text: servingChoice),
          ],
        ),
        const Spacer(),
        buildItemListTitleBlack(title: "£$price"),
      ],
    );
  }
}
