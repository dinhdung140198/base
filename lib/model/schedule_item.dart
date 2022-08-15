import 'package:flutter/material.dart';

class ScheduleItem {
  final String title;
  final TimeOfDay timeOfDay;
  final int offTime;

  ScheduleItem({required this.title, required this.timeOfDay,required this.offTime,});
}