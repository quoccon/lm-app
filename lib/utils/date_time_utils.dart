import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

class AppDateTimeUtils {
  static Map<String, String> getWeekDates(DateTime now) {
    final currentDate = DateTime.now();
    DateTime startOfThisWeek =
    currentDate.subtract(Duration(days: currentDate.weekday - 1));
    DateTime fromDate = startOfThisWeek.subtract(const Duration(days: 7));
    DateTime toDate = startOfThisWeek.subtract(const Duration(days: 1));
    String formattedFromDate = DateFormat('yyyy-MM-dd').format(fromDate);
    String formattedToDate = DateFormat('yyyy-MM-dd').format(toDate);
    return {'fromDate': formattedFromDate, 'toDate': formattedToDate};
  }

  static Map<String, String> getMonthDates(DateTime now) {
    DateTime firstDayOfCurrentMonth = DateTime(now.year, now.month, 1);
    DateTime firstDayOfLastMonth = DateTime(
        firstDayOfCurrentMonth.year, firstDayOfCurrentMonth.month - 1, 1);
    DateTime lastDayOfLastMonth =
    DateTime(firstDayOfCurrentMonth.year, firstDayOfCurrentMonth.month, 0);
    String formattedFromDate =
    DateFormat('yyyy-MM-dd').format(firstDayOfLastMonth);
    String formattedToDate =
    DateFormat('yyyy-MM-dd').format(lastDayOfLastMonth);
    return {'fromDate': formattedFromDate, 'toDate': formattedToDate};
  }

  static void showDateDialog(
      BuildContext context, {
        DateTime? maxDate,
        DateTime? minDate,
        Function(String fromDate, String toDate)? onDateSelected,
      }) async {
    var dates = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.range,
        lastDate: maxDate,
        firstDate: minDate,
      ),
      dialogSize: const Size(325, 400),
      // value: _dates,
      borderRadius: BorderRadius.circular(15),
    );
    if ((dates ?? []).isNotEmpty) {
      if (dates?.length == 1) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(dates![0]!);
        onDateSelected?.call(formattedDate, formattedDate);
      }
      if (dates?.length == 2 && dates?[0] != null && dates?[1] != null) {
        String formattedFromDate = DateFormat('yyyy-MM-dd').format(dates![0]!);
        String formattedToDate = DateFormat('yyyy-MM-dd').format(dates[1]!);
        onDateSelected?.call(formattedFromDate, formattedToDate);
      }
    }
  }

  static void showSingleDateDialog(
      BuildContext context, {
        DateTime? initialDate,
        Function(String date)? onSelectedDate,
      }) async {
    initialDate ??= DateTime.now();

    var dates = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        lastDate: DateTime.now(),
        firstDate: DateTime(initialDate.year - 100),
      ),
      dialogSize: const Size(325, 400),
      borderRadius: BorderRadius.circular(15),
    );

    if ((dates ?? []).isNotEmpty && dates?[0] != null) {
      String formattedBirthday = DateFormat('yyyy-MM-dd').format(dates![0]!);
      onSelectedDate?.call(formattedBirthday);
    }
  }
}
