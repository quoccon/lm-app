import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/datasource/model/sport_preferences_model.dart';
import 'package:lifemap/application/datasource/remote/auth_remote.dart';

part 'suggestion_state.dart';

class SuggestionCubit extends BaseCubit<SuggestionState> {
  SuggestionCubit(this._authRemote) : super(SuggestionState());

  final AuthRemote _authRemote;

  Future listSuggestion() async {
    emit(state.copyWith(loading: true));

    final result = await _authRemote.listSuggestion();
    result.fold(
      (error) {
        emit(state.copyWith(error: error.message, loading: false));
      },
      (success) {
        print('success: $success');

        emit(state.copyWith(suggestion: success, loading: false));
      },
    );
  }
}
