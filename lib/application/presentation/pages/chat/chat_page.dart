import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/presentation/widgets/app_textfield.dart';

import '../../../cubit/chat/chat_cubit.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<ChatCubit>(
      body: ChatBody(),
      title: Text("Tin nhắn"),
      actions: [],
    );
  }
}

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(hintText: 'Tìm kiếm...', onChanged: (p0) {}),
          ],
        ),
      ),
    );
  }
}
