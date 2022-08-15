import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tgs/pages/setting/info/info_viewmodel.dart';

final infoViewModel = StateNotifierProvider<InfoViewModel, AsyncValue<InfoDataState>>((ref) => InfoViewModel()..init());