import 'package:bloc/bloc.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit() : super(HomeState());
}
