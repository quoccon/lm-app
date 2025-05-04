import 'package:flutter_cors/flutter_core.dart';

part 'main_tab_state.dart';

class MainTabCubit extends BaseCubit<MainTabState> {
  MainTabCubit() : super(MainTabState());


  void selected(int selectedIndex) {
    emit(state.copyWith(selectItem: selectedIndex));
  }
}
