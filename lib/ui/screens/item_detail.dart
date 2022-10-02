import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_susage/core/colors.dart';
import 'package:greggs_susage/core/dimens.dart';
import 'package:greggs_susage/ui/bloc/sausage_roll_bloc.dart';
import 'package:greggs_susage/ui/widgets/components.dart';

import '../../core/images.dart';
import '../../core/service_locator.dart';
import '../../core/strings.dart';
import '../../domain/entities/sausage_roll_entity.dart';

enum ServingChoice { eatIn, eatOut }

class ScreenItemDetail extends StatefulWidget {
  final SausageRollEntity sausageRollEntity;
  ScreenItemDetail({super.key, required this.sausageRollEntity});

  @override
  State<ScreenItemDetail> createState() => _ScreenItemDetailState();
}

class _ScreenItemDetailState extends State<ScreenItemDetail> {
  ServingChoice _servingChoice = ServingChoice.eatIn;
  bool _isEatIn = false;
  int basketSize = 0;

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
            const SizedBox(height: 15),
            Expanded(
                child: ListView(
              children: [
                buildItemImage(),
                const SizedBox(height: 15),
                buildAvailableTimesOfDay(),
                const SizedBox(height: 8),
                buildFromUntilTimes(),
                const SizedBox(height: 10),
                buildItemDetailKeyText(text: strDescription),
                const SizedBox(height: 5),
                buildItemDetailValueText(text: widget.sausageRollEntity.customerDescription),
                const SizedBox(height: 10),
                buildEatInEatOutChoice(),
              ],
            )),
            const SizedBox(height: 30),
            BlocBuilder<SausageRollBloc, SausageRollState>(builder: (context, state) {
              return buildDefaultBottomBtn(buildButtonText(), () {
                addItemToBasket(context);
              });
            })
          ],
        ),
      ),
    ));
  }

  String buildButtonText() {
    if (_servingChoice == ServingChoice.eatIn) {
      _isEatIn = true;
      return "Add to Basket - £${widget.sausageRollEntity.eatInPrice}";
    } else {
      _isEatIn = false;
      return "Add to Basket - £${widget.sausageRollEntity.eatOutPrice}";
    }
  }

  addItemToBasket(BuildContext context) {
    BlocProvider.of<SausageRollBloc>(context)
        .add(AddSausageToBasketEvent(sausageRollEntity: widget.sausageRollEntity..isEatIn = _isEatIn));
  }

  buildItemImage() {
    return Image.network(
      widget.sausageRollEntity.imageUri,
      height: MediaQuery.of(context).size.height / 4,
      fit: BoxFit.contain,
    );
  }

  buildAvailableTimesOfDay() {
    return Row(
      children: [
        buildItemDetailKeyText(text: strAvailable_),
        const SizedBox(width: 10),
        buildItemDetailValueText(text: widget.sausageRollEntity.dayParts.join(', '))
      ],
    );
  }

  buildFromUntilTimes() {
    final localizations = MaterialLocalizations.of(context);
    final fromTime = DateTime.parse(widget.sausageRollEntity.availableFrom);
    final fromTimeString = localizations.formatFullDate(fromTime);
    final untilTime = DateTime.parse(widget.sausageRollEntity.availableUntil);
    final untilTimeString = localizations.formatFullDate(untilTime);
    return Column(
      children: [
        Row(
          children: [
            buildItemDetailKeyText(text: strFrom_),
            const SizedBox(width: 5),
            Expanded(child: buildItemDetailValueText(text: fromTimeString)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            buildItemDetailKeyText(text: strUntil_),
            const SizedBox(width: 5),
            Expanded(child: buildItemDetailValueText(text: untilTimeString)),
          ],
        ),
      ],
    );
  }

  buildEatInEatOutChoice() {
    return Column(
      children: [
        buildChoiceTile(ServingChoice.eatIn, widget.sausageRollEntity.eatInPrice, strEatIn),
        buildChoiceTile(ServingChoice.eatOut, widget.sausageRollEntity.eatOutPrice, strEatOut),
      ],
    );
  }

  buildChoiceTile(ServingChoice value, double price, String title) {
    return ListTile(
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.all(0),
      title: buildIconText(text: title),
      leading: Radio(
        value: value,
        groupValue: _servingChoice,
        onChanged: (ServingChoice? value) {
          if (value != null) {
            setState(() {
              _servingChoice = value;
            });
          }
        },
      ),
      trailing: buildIconText(text: "£$price"),
    );
  }

  buildTitleRow() {
    return Row(
      children: [
        buildItemDetailTitle(title: widget.sausageRollEntity.articleName),
        const Spacer(),
        buildShoppingBag(),
        const SizedBox(width: 5),
        BlocBuilder<SausageRollBloc, SausageRollState>(
          builder: (context, state) {
            if (state is GetBasketLoadedState) {
              basketSize = state.sausageRollBasketEntity.basketItems.length;
            }
            return buildItemDetailTitle(title: basketSize.toString());
          },
        )
      ],
    );
  }
}
