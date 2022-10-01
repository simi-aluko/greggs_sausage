import 'dart:io';

import 'package:greggs_susage/data/models/sausage_roll_model.dart';
import 'package:greggs_susage/domain/entities/basket_entity.dart';
import 'package:greggs_susage/domain/entities/sausage_roll_entity.dart';

String readFileToString(String name) => File(name).readAsStringSync();

const sausageRollModel = SausageRollModel(
    articleCode: "1",
    shopCode: "1",
    availableFrom: "1",
    availableUntil: "1",
    eatOutPrice: 2.0,
    eatInPrice: 1.0,
    articleName: "1",
    dayParts: ["1"],
    internalDescription: "1",
    customerDescription: "1",
    imageUri: "imageUri",
    thumbnailUri: "thumbnailUri");

SausageRollEntity sausageRollEntity1 = SausageRollEntity(
    articleName: sausageRollModel.articleName,
    availableFrom: sausageRollModel.availableFrom,
    availableUntil: sausageRollModel.availableUntil,
    eatOutPrice: sausageRollModel.eatOutPrice,
    eatInPrice: sausageRollModel.eatInPrice,
    dayParts: sausageRollModel.dayParts,
    customerDescription: sausageRollModel.customerDescription,
    imageUri: sausageRollModel.imageUri,
    thumbnailUri: sausageRollModel.thumbnailUri,);

SausageRollEntity sausageRollEntity2 = SausageRollEntity(
    articleName: sausageRollModel.articleName,
    availableFrom: sausageRollModel.availableFrom,
    availableUntil: sausageRollModel.availableUntil,
    eatOutPrice: sausageRollModel.eatOutPrice,
    eatInPrice: sausageRollModel.eatInPrice,
    dayParts: sausageRollModel.dayParts,
    customerDescription: sausageRollModel.customerDescription,
    imageUri: sausageRollModel.imageUri,
    thumbnailUri: sausageRollModel.thumbnailUri,)..isEatIn = true;

SausageRollBasketEntity sausageRollFirstItemBasketEntity =
    SausageRollBasketEntity(total: 2, basketItems: [sausageRollEntity1]);

SausageRollBasketEntity sausageRollEmptyBasketEntity = SausageRollBasketEntity(total: 0, basketItems: []);

SausageRollBasketEntity sausageRollMultipleItemsBasketEntity =
    SausageRollBasketEntity(total: 3, basketItems: [sausageRollEntity1, sausageRollEntity2]);
