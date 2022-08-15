import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


extension StringExtension on String {
  String get upperCaseFirst {
    if (length == 0) return this;
    return replaceFirst(substring(0, 1), substring(0, 1).toUpperCase());
  }
}

extension DateTimeExtension on DateTime{

  String get nameOfDay {
    // ignore: unnecessary_null_comparison
    if(this == null){
      throw StateError("element is null");
    }
    return DateFormat('EEEE').format(this);
  }

  String get toDisplayJapanType{
    if(this == null){
      throw StateError("element is null");
    }

    final onlyDate = DateTime(year, month, day);
    final onlyTime = TimeOfDay(hour: hour, minute: minute);

    return '${DateFormat.yMMMMEEEEd('ja').format(onlyDate)} ${onlyTime.hour.toString().padLeft(2, '0')} : ${onlyTime.minute.toString().padLeft(2, '0')}';
  }
}