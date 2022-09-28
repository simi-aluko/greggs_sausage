class SausageRollEntity {
  final String articleName;
  final String availableFrom; // date format suitable for ui
  final String availableUntil; // date format suitable for ui
  final double eatOutPrice;
  final double eatInPrice;
  final List<String> dayParts;
  final String customerDescription;
  final String imageUri;
  final String thumbnailUri;

  SausageRollEntity(
      {required this.articleName,
      required this.availableFrom,
      required this.availableUntil,
      required this.eatOutPrice,
      required this.eatInPrice,
      required this.dayParts,
      required this.customerDescription,
      required this.imageUri,
      required this.thumbnailUri});
}






