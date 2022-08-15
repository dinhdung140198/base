import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tgs/generated/l10n.dart';
import 'package:tgs/internal/app_controller.dart';
import 'package:tgs/internal/utils/style.dart';
import 'package:tgs/model/schedule_item.dart';
import 'package:tgs/pages/common_widget/info_item.dart';
import 'package:tgs/pages/setting/info/info_viewmodel.dart';
import 'package:tgs/viewmodel/info_vm.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            S.of(context).back,
            style: AppTextStyle.normal.copyWith(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
        ),
        title: Text(
          '休憩アラーム',
          style: AppTextStyle.bold.copyWith(fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Consumer(builder: (context, ref, _) {
          final scheduleData = ref.watch(infoViewModel);
          final stateNotifier = ref.watch(infoViewModel.notifier);

          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              _buildListData(scheduleData, true),
              InfoItem(
                title: '繰り返し',
                onTap: () {
                  stateNotifier.addNewSchedule(ScheduleItem(
                      title: 'New item',
                      timeOfDay: const TimeOfDay(hour: 22, minute: 0),
                      offTime: 0));
                },
              ),
              _buildListData(scheduleData, false),
              const InfoItem(
                title: '休憩アラーム通知方法',
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildListData(AsyncValue<InfoDataState> scheduleData, bool schedule) {
    return scheduleData.when(
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
      data: (infoState) {
        final listSchedule = infoState.scheduleList;
        final listRelax = infoState.relaxList;

        if (schedule) {
          return ListView.separated(
            itemCount: listSchedule.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              if (index == listSchedule.length - 1) {
                return Column(
                  children: [
                    _buildItem(listSchedule[index], true),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 18,
                      ),
                      child: Divider(
                        color: AppColors.grey102,
                        height: 1,
                      ),
                    ),
                  ],
                );
              }

              return _buildItem(listSchedule[index], true);
            },
            separatorBuilder: (_, index) {
              return const Padding(
                padding: EdgeInsets.only(
                  top: 18,
                  bottom: 18,
                ),
                child: Divider(
                  color: AppColors.grey102,
                  height: 1,
                ),
              );
            },
          );
        } else {
          return ListView.separated(
            itemCount: listRelax.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              if (index == listRelax.length - 1) {
                return Column(
                  children: [
                    _buildItem(listRelax[index], false),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 18,
                      ),
                      child: Divider(
                        color: AppColors.grey102,
                        height: 1,
                      ),
                    ),
                  ],
                );
              }

              return _buildItem(listRelax[index], false);
            },
            separatorBuilder: (_, index) {
              return const Padding(
                padding: EdgeInsets.only(
                  top: 18,
                  bottom: 18,
                ),
                child: Divider(
                  color: AppColors.grey102,
                  height: 1,
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildItem(ScheduleItem item, bool schedule) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item.title,
          style: AppTextStyle.normal.copyWith(fontSize: 16),
        ),
        Container(
          color: AppColors.grey217,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              schedule
                  ? '${item.timeOfDay.hour.toString().padLeft(2, '0')}:${item.timeOfDay.minute.toString().padLeft(2, '0')}'
                  : "${item.offTime}",
              style: AppTextStyle.bold.copyWith(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
