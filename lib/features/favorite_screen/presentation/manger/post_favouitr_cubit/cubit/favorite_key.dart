class FavouriteKey {
  final int id;
  final String type;

  const FavouriteKey({required this.id, required this.type});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteKey && other.id == id && other.type == type;

  @override
  int get hashCode => Object.hash(id, type);
}

class FavouriteType {
  static const String ruin = 'ruin';
  static const String subPlace = 'sub_place';
}
