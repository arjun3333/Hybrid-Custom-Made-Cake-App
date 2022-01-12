class PreMadeResponseEntity {
  String? docId;
  String? name;
  String? description;
  String? cakeImage;
  int? distance;
  int? duration;
  bool? isFavourite;
  String? price;
  List<dynamic>? favouritesIds;

  PreMadeResponseEntity({
    this.docId,
    this.name,
    this.description,
    this.cakeImage,
    this.distance,
    this.duration,
    this.isFavourite,
    this.price,
    this.favouritesIds,
  });
}
