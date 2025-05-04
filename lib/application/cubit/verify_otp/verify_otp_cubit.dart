import 'package:bloc/bloc.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:meta/meta.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends BaseCubit<VerifyOtpState> {
  VerifyOtpCubit() : super(VerifyOtpState());
}
