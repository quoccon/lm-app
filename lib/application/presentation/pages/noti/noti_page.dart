import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

class NotiPage extends StatelessWidget {
  const NotiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: NotiBody(),title: const Text(""),);
  }
}

class NotiBody extends StatefulWidget {
  const NotiBody({super.key});

  @override
  State<NotiBody> createState() => _NotiBodyState();
}

class _NotiBodyState extends State<NotiBody> {
  @override
  Widget build(BuildContext context) {
    return Text("noti");
  }
}
