import 'package:bloc/bloc.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:meta/meta.dart';

part 'noti_state.dart';

class NotiCubit extends BaseCubit<NotiState> {
  NotiCubit() : super(NotiState());
}
