import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: AccountBody(),title: const Text(""),);
  }
}


class AccountBody extends StatefulWidget {
  const AccountBody({super.key});

  @override
  State<AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    return Text("account");
  }
}
