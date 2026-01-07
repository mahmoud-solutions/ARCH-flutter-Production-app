class CountModel {
  int? count;

  CountModel({this.count});

  factory CountModel.fromJson(Map<String, dynamic> json) =>
      CountModel(count: json['count'] as int?);

  Map<String, dynamic> toJson() => {'count': count};
}
