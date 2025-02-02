import 'package:intl/intl.dart'; // استيراد الحزمة

String formatTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('h:mm a'); // تنسيق الوقت
  return formatter.format(dateTime); // إرجاع الوقت المنسق
}