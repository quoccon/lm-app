import 'package:bloc/bloc.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends BaseCubit<AccountState> {
  AccountCubit() : super(AccountState());
}
