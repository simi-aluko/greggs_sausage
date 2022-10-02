import 'package:flutter/material.dart';
import 'package:greggs_susage/core/colors.dart';
import 'package:greggs_susage/core/images.dart';
import 'package:greggs_susage/domain/entities/sausage_roll_entity.dart';
import 'package:greggs_susage/ui/widgets/components.dart';

class WidgetSausageItem extends StatelessWidget {
  final SausageRollEntity sausageRollEntity;
  const WidgetSausageItem({super.key, required this.sausageRollEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildItemListTitle(title: sausageRollEntity.articleName),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildIcon(icon: imgEatIn),
                  const SizedBox(width: 5),
                  buildIconText(text: sausageRollEntity.eatInPrice.toString()),
                  const SizedBox(width: 20),
                  buildIcon(icon: imgEatOut),
                  const SizedBox(width: 5),
                  buildIconText(text: sausageRollEntity.eatOutPrice.toString()),
                ],
              ),
              const SizedBox(height: 6),
              buildItemListTextDescription(text: sausageRollEntity.customerDescription)
            ],
          ),
        ),
        const SizedBox(width: 10,),
        Image.network(sausageRollEntity.thumbnailUri, height: 100,)
      ],
    );
  }
}
