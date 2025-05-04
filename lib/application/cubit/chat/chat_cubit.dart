import 'package:bloc/bloc.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends BaseCubit<ChatState> {
  ChatCubit() : super(ChatState());
}
