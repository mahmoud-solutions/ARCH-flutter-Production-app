class SubscriptionDetails {
  dynamic title;
  dynamic startAt;
  dynamic endAt;

  SubscriptionDetails({this.title, this.startAt, this.endAt});

  factory SubscriptionDetails.fromJson(Map<String, dynamic> json) {
    return SubscriptionDetails(
      title: json['title'] as dynamic,
      startAt: json['start_at'] as dynamic,
      endAt: json['end_at'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'start_at': startAt,
    'end_at': endAt,
  };
}
