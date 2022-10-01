import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_susage/core/colors.dart';
import 'package:greggs_susage/core/dimens.dart';
import 'package:greggs_susage/core/images.dart';
import 'package:greggs_susage/core/strings.dart';
import 'package:greggs_susage/ui/screens/basket.dart';
import 'package:greggs_susage/ui/screens/item_detail.dart';
import 'package:greggs_susage/ui/widgets/components.dart';
import 'package:greggs_susage/ui/widgets/sausage_item.dart';
import 'package:greggs_susage/ui/widgets/loading_widget.dart';

import '../../core/service_locator.dart';
import '../../domain/entities/sausage_roll_entity.dart';
import '../bloc/sausage_roll_bloc.dart';

class ScreenItemsList extends StatefulWidget {
  const ScreenItemsList({Key? key}) : super(key: key);

  @override
  State<ScreenItemsList> createState() => _ScreenItemsListState();
}

class _ScreenItemsListState extends State<ScreenItemsList> {
  List<SausageRollEntity> sausageRollEntities = [];
  int basketSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(dimenDefaultScreenPadding),
        child: Column(
          children: [
            buildTitle(),
            const SizedBox(height: 30,),
            BlocBuilder<SausageRollBloc, SausageRollState>(
                builder: (context, state){
              if(state is SausageRollListLoadedState){
                sausageRollEntities = state.sausageRollEntities;
              }
              return Expanded(
                child: ListView.separated(
                  itemCount: sausageRollEntities.length,
                  itemBuilder: (context, position){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenItemDetail(sausageRollEntity: sausageRollEntities[position])));
                      },
                      child: WidgetSausageItem(sausageRollEntity: sausageRollEntities[position]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(color: colorDarkBlue,);
                  },),
              );
            }),
            buildDefaultBottomBtn(strViewBasket, (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenBasket()));
            })
          ],
        ),
      ),
    ));
  }

  Row buildTitle() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8), // Image border
          child: SizedBox.fromSize(
            size: Size.fromRadius(dimenMText), // Image radius
            child: Image.asset(imgGreggsLogo),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          strGreggs,
          style: TextStyle(fontSize: dimenXXLText, color: colorPrimary, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        buildShoppingBag(),
        const SizedBox(width: 5,),
        BlocBuilder<SausageRollBloc, SausageRollState>(
          builder: (context, state) {
            if(state is GetBasketLoadedState){
              basketSize = state.sausageRollBasketEntity.basketItems.length;
            }
            return buildItemDetailTitle(title: basketSize.toString());
          },
        )
      ],
    );
  }
}
