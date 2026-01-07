import 'headers.data.dart';
import 'original.data.dart';

class PopularPlaces {
  Headers? headers;
  Original? original;
  dynamic exception;

  PopularPlaces({this.headers, this.original, this.exception});

  factory PopularPlaces.fromJson(Map<String, dynamic> json) => PopularPlaces(
    headers: json['headers'] == null
        ? null
        : Headers.fromJson(json['headers'] as Map<String, dynamic>),
    original: json['original'] == null
        ? null
        : Original.fromJson(json['original'] as Map<String, dynamic>),
    exception: json['exception'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'headers': headers?.toJson(),
    'original': original?.toJson(),
    'exception': exception,
  };
}
