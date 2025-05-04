import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/cubit/verify_otp/verify_otp_cubit.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<VerifyOtpCubit>(
      body: VerifyOtpBody(),
      title: const Text("Xác nhận OTP"),
    );
  }
}

class VerifyOtpBody extends StatefulWidget {
  const VerifyOtpBody({super.key});

  @override
  State<VerifyOtpBody> createState() => _VerifyOtpBodyState();
}

class _VerifyOtpBodyState extends State<VerifyOtpBody> {
  final List<TextEditingController> _controllerOtp = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNode = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllerOtp) {
      controller.dispose();
    }
    for (var focusNode in _focusNode) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 50,
          child: TextField(
            controller: _controllerOtp[index],
            focusNode: _focusNode[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                _focusNode[index].unfocus();
                FocusScope.of(context).requestFocus(_focusNode[index + 1]);
              }
              if (value.isEmpty && index > 0) {
                _focusNode[index].unfocus();
                FocusScope.of(context).requestFocus(_focusNode[index - 1]);
              }
            },
          ),
        );
      }),
    );
  }
}
