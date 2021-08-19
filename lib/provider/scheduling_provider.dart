import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_cupertino_app/utils/background_service.dart';
import 'package:news_cupertino_app/utils/date_time_helper.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isSchedule = false;

  bool get isScheduled => _isSchedule;

  Future<bool> scheduledNews(bool value) async {
    _isSchedule = value;

    if (_isSchedule) {
      print('Scheduling News Activated');
      notifyListeners();

      return await AndroidAlarmManager.periodic(
          Duration(hours: 24), 1, BackgroundService.callback,
          startAt: DateTimeHelper.format(), exact: true, wakeup: true);
    } else {
      print('Scheduling News Canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
