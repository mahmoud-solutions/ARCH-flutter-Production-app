import 'package:intl/intl.dart';

String formatNotificationTime(String isoString) {
  final dateTime = DateTime.parse(isoString).toLocal(); // التوقيت المحلي
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  const separator = "        "; // ده الفاصل اللي هيظهر بين التاريخ والوقت

  if (difference.inDays == 0) {
    return "اليوم$separator${DateFormat.Hm().format(dateTime)}";
  } else if (difference.inDays == 1) {
    return "أمس$separator${DateFormat.Hm().format(dateTime)}";
  } else if (difference.inDays < 7) {
    return "${DateFormat.EEEE('ar_EG').format(dateTime)}$separator${DateFormat.Hm().format(dateTime)}";
  } else {
    return "${DateFormat("yyyy/MM/dd").format(dateTime)}$separator${DateFormat.Hm().format(dateTime)}";
  }
}
