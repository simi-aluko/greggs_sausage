

import 'package:flutter/material.dart';
import 'package:greggs_susage/core/dimens.dart';

import '../../core/colors.dart';
import '../../core/images.dart';

Image buildIcon({required String icon}) {
  return Image.asset(icon, height: 25, color: lighten(colorPrimary, 20));
}

Text buildIconText({required String text}){
  return Text(text, style: TextStyle(fontSize: dimenMText, fontWeight: FontWeight.bold),);
}

Text buildItemListTextDescription({required String text}){
  return Text(text, style: TextStyle(fontSize: dimenSText, color: colorDarkBlue, fontWeight: FontWeight.w400),
    maxLines: 4,
    overflow:
  TextOverflow
      .ellipsis,);
}

Text buildItemListTitle({required String title}){
  return Text(title, style: TextStyle(fontSize: dimenLText, color: colorPrimary, fontWeight: FontWeight.bold),);
}

Text buildItemListTitleBlack({required String title}){
  return Text(title, style: TextStyle(fontSize: dimenLText, color: colorBlack, fontWeight: FontWeight.bold),);
}

Text buildItemDetailTitle({required String title}){
  return Text(title, style: TextStyle(fontSize: dimenXXLText, color: colorPrimary, fontWeight: FontWeight.bold),);
}

Text buildXLTitleBlack({required String title}){
  return Text(title, style: TextStyle(fontSize: dimenXLText, color: colorBlack, fontWeight: FontWeight.bold),);
}

Text buildItemDetailValueText({required String text}){
  return Text(text, style: TextStyle(fontSize: dimenSText, color: colorGrey, fontWeight: FontWeight.w400),);
}

Text buildItemDetailKeyText({required String text}){
  return Text(text, style: TextStyle(fontSize: dimenSText, fontWeight: FontWeight.bold),);
}

SizedBox buildDefaultBottomBtn(String title, onPressed) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        primary: colorPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      child: Text(title, style: TextStyle(fontSize: dimenMText, color: Colors.white,
          fontWeight: FontWeight.bold),),
    ),
  );
}

buildBackArrow(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: const Icon(
      Icons.arrow_back,
      size: 40,
    ),
  );
}

buildShoppingBag(){
  return Icon(
    Icons.shopping_bag_outlined,
    color: colorPrimary,
    size: 35,
  );
}

buildSeparatorBuilder(){
  return Divider(
    color: colorDarkBlue,
  );
}