import 'package:arch_team_power/core/utils/app_assets.dart';

class IntroPagesData {
  String title;
  String image;
  int index;
  IntroPagesData({
    required this.title,
    required this.image,
    required this.index,
  });

  static List<IntroPagesData> data = [
    IntroPagesData(
      title: "اكتشف روائع النقوش القديمة واستعد لرحلة عبر الزمن",
      image: AppAssets.kOnPordingImage1,
      index: 0,
    ),
    IntroPagesData(
      title: "استخدم الذكاء الاصطناعي لتحليل وفهم النصوص التاريخية بسهولة",
      image: AppAssets.kOnPordingImage2,
      index: 1,
    ),
    IntroPagesData(
      title: "تجول في عالم التراث باستخدام خريطة تفاعلية للمواقع الأثرية",
      image: AppAssets.kOnPordingImage3,
      index: 2,
    ),
  ];
}
