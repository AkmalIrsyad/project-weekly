
import 'package:intl/intl.dart';

String formatTime(int timeInMillis) {
  final date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
  final now = DateTime.now();

  final isToday = DateTime(date.year, date.month, date.day) == DateTime(now.year, now.month, now.day);

  // Cek apakah date == now (hari ini)
  if (isToday) {
    return DateFormat("HH:mm").format(date);
  }
  
  return DateFormat("dd/MM/yyyy").format(date);
}
