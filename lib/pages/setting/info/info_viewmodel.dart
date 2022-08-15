import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tgs/model/schedule_item.dart';

class InfoDataState{
  final List<ScheduleItem> scheduleList;
  final List<ScheduleItem> relaxList;
  InfoDataState({required this.scheduleList, required this.relaxList});

  InfoDataState copyWith({List<ScheduleItem>? schedules, List<ScheduleItem>? relax,}) => InfoDataState(scheduleList: schedules ?? scheduleList, relaxList: relax ?? relaxList);
}


class InfoViewModel extends StateNotifier<AsyncValue<InfoDataState>>{
  InfoViewModel() : super(const AsyncLoading());

  InfoDataState? infoDataState;
  List<ScheduleItem> items = [];

  void init(){
    items.addAll(
      [
        ScheduleItem(title: '休憩アラームをオンにする時間', timeOfDay: const TimeOfDay(hour: 9, minute: 0), offTime: 0),
        ScheduleItem(title: '休憩アラームをオフにする時間', timeOfDay: const TimeOfDay(hour: 17, minute: 30), offTime: 0),
      ]
    );
    infoDataState = InfoDataState(scheduleList: items, relaxList: [ScheduleItem(title: '休憩アラームをオフにする時間', timeOfDay: const TimeOfDay(hour: 17, minute: 30), offTime: 60)]);
    state = AsyncData(infoDataState!);
  }

  void addNewSchedule(ScheduleItem item){
    items.add(item);
    infoDataState!.copyWith(schedules: items, relax: []);
    state = AsyncData(infoDataState!);
  }
}