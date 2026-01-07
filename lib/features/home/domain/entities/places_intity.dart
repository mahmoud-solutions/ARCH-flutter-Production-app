class PlaceEntity {
  final int id;
  final String name;
  final String description;
  final String image;
  final String mapPhoto;
  final String governorateName;
  final String regionName;
  final double rate;
  final int totalReviews;
  final bool isFavorite;
  final String type;

  PlaceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.mapPhoto,
    required this.governorateName,
    required this.regionName,
    required this.rate,
    required this.totalReviews,
    required this.isFavorite,
    required this.type,
  });
}
