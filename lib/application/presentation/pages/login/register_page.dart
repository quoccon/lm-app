import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/utils.dart';
import '../../../cubit/cubit.dart';
import '../../../datasource/model/model.dart';
import '../../widgets/widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<RegisterCubit>(
      padding: EdgeInsets.all(0),
      onSubmitSuccess: (cubit, state) {
        UIUtils.showTopSnackbar(
          context,
          message: "Đăng ký người dùng thành công",
        );
        Navigator.pushNamed(context, AppRoute.verifyOtp);
      },
      isShowHeaderLine: true,
      body: RegisterBody(),
    );
  }
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Đăng ký tài khoản',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppSpaces.space28.vertical,
                      AppTextField(
                        hintText: 'Nhập username',
                        onChanged: (p0) {
                          cubit.changeUsername(p0);
                        },
                      ),
                      AppSpaces.space20.vertical,
                      AppTextField(
                        hintText: 'Nhập email của bạn',
                        onChanged: (p0) {
                          cubit.changeEmail(p0);
                        },
                      ),
                      AppSpaces.space20.vertical,
                      AppDropDown(
                        hint: 'Chọn giới tính',
                        text: state.gender?.genderString,
                        onTap: () async {
                          SingleSelectSheet.show(
                            context,
                            title: 'Chọn giới tính',
                            items:
                                GenderEnum.values
                                    .map(
                                      (e) => DropdownModel(
                                        key: e,
                                        text: e.genderString,
                                      ),
                                    )
                                    .toList(),
                            selectedItem:
                                state.gender == null
                                    ? null
                                    : DropdownModel(
                                      key: state.gender,
                                      text: state.gender?.genderString ?? '',
                                    ),
                            onSelected: (item) {
                              cubit.changeGender(item.key);
                            },
                          );
                        },
                      ),
                      AppSpaces.space20.vertical,
                      AppTextField(
                        hintText: 'Nhập password của bạn',
                        onChanged: (p0) {
                          cubit.changePassword(p0);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          cubit.register();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: BackgroundColor.colorButton,
                          foregroundColor: BackgroundColor.inverse,
                        ),
                        child: const Text(
                          'Đăng ký',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      AppSpaces.space20.vertical,
                      const Text('Hoặc'),
                      AppSpaces.space12.vertical,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppBgContainer(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            border: Border.all(
                              width: 1,
                              color: BackgroundColor.secondary,
                            ),
                            child: Image.asset(
                              AssetsUrl.image('ic_google.png'),
                            ),
                          ),
                          AppSpaces.space32.horizontal,
                          AppBgContainer(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            border: Border.all(
                              width: 1,
                              color: BackgroundColor.secondary,
                            ),
                            child: Image.asset(
                              AssetsUrl.image('ic_facbook.png'),
                            ),
                          ),
                        ],
                      ),
                      AppSpaces.space20.vertical,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bạn đã có tài khoản?',
                            style: AppTextStyle.regular,
                            textAlign: TextAlign.center,
                          ),
                          AppSpaces.space4.horizontal,
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoute.login);
                            },
                            child: Text(
                              "Đăng nhập",
                              style: AppTextStyle.regular.semibold.copyWith(
                                color: TextColor.colorText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppSpaces.space20.vertical,
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
