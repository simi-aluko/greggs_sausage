import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sausage_roll_model.g.dart';

@JsonSerializable()
class SausageRollModel extends Equatable {
  final String articleCode;
  final String shopCode;
  final String availableFrom;
  final String availableUntil;
  final double eatOutPrice;
  final double eatInPrice;
  final String articleName;
  final List<String> dayParts;
  final String internalDescription;
  final String customerDescription;
  final String imageUri;
  final String thumbnailUri;

  const SausageRollModel(
      {required this.articleCode,
      required this.shopCode,
      required this.availableFrom,
      required this.availableUntil,
      required this.eatOutPrice,
      required this.eatInPrice,
      required this.articleName,
      required this.dayParts,
      required this.internalDescription,
      required this.customerDescription,
      required this.imageUri,
      required this.thumbnailUri});

  factory SausageRollModel.fromJson(Map<String, dynamic> json) => _$SausageRollModelFromJson(json);

  @override
  List<Object?> get props => [articleCode, shopCode, availableFrom, availableUntil, eatInPrice, eatOutPrice,
    articleName, dayParts, internalDescription, customerDescription, imageUri, thumbnailUri];
}