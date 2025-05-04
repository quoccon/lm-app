import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';


import '../../../../constants/constants.dart';
import '../../../../utils/utils.dart';
import '../../../cubit/cubit.dart';
import '../../../datasource/model/model.dart';
import '../../widgets/app_image_picker.dart';
import '../../widgets/widget.dart';

class AddChallengePage extends StatelessWidget {
  const AddChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<AddChallengeCubit>(
      onInit: (cubit) {
        cubit?.listSuggestion();
      },
      body: AddChallengeBody(),
      title: Text("Thêm thử thách cho bản thân"),
    );
  }
}

class AddChallengeBody extends StatefulWidget {
  const AddChallengeBody({super.key});

  @override
  State<AddChallengeBody> createState() => _AddChallengeBodyState();
}

class _AddChallengeBodyState extends State<AddChallengeBody> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [_buildInput()]),
          ),
        ),
        _buttonAccept(),
      ],
    );
  }

  Widget _buildInput() {
    return BlocBuilder<AddChallengeCubit, AddChallengeState>(
      builder: (context, state) {
        final cubit = context.read<AddChallengeCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FieldHeader("Tên thử thách", isRequired: true),
            AppTextField(
              hintText: 'Nhập tên thử thách',
              onChanged: (p0) {
                cubit.changeName(p0);
              },
            ),
            FieldHeader("Bộ môn thể thao", isRequired: true),
            AppDropDown(
              hint: 'Chọn bộ môn thể thao',
              text: state.sportType?.suggestName,
              onTap: () async {
                SingleSelectSheet.show(
                  context,
                  title: 'Chọn bộ môn thể thao',
                  items:
                      state.suggestion
                          ?.map(
                            (e) => DropdownModel(
                              key: e,
                              text: e.suggestName ?? '',
                            ),
                          )
                          .toList() ??
                      [],
                  selectedItem:
                      state.sportType == null
                          ? null
                          : DropdownModel(
                            key: state.sportType,
                            text: state.sportType?.suggestName ?? '',
                          ),
                  onSelected: (item) {
                    cubit.changeSportType(item.key);
                  },
                );
              },
            ),
            FieldHeader("Mục tiêu thử thách",isRequired: true,),
            AppTextField(
              hintText: 'Nhập mục tiêu của thử thách',
              onChanged: (p0) {},
            ),
            FieldHeader("Ngày bắt đầu",isRequired: true,),
            AppTextField(
              controller: _startDateController,
              hintText: 'Chọn ngày bắt đầu',
              readOnly: true,
              onTap: () async {
                AppDateTimeUtils.showSingleDateDialog(
                  context,
                  onSelectedDate: (date) {
                    setState(() {
                      _startDateController.text = date;
                      cubit.changeStartDate(date);
                    });
                  },
                );
              },
            ),
            FieldHeader("Ngày kết thúc",isRequired: true,),
            AppTextField(
              controller: _endDateController,
              hintText: 'Chọn ngày kết thúc',
              readOnly: true,
              onTap: () async {
                AppDateTimeUtils.showSingleDateDialog(
                  context,
                  onSelectedDate: (date) {
                    setState(() {
                      _endDateController.text = date;
                      cubit.changeEndDate(date);
                    });
                  },
                );
              },
            ),
            FieldHeader("Thêm ảnh cho thử thách"),
            AppSpaces.space4.vertical,
            ImagePickerWidget(
              onImagesSelected: (p0) {

              },
              allowMultiple: false,
            )
          ],
        );
      },
    );
  }

  Widget _buttonAccept() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(onPressed: () {}, child: Text("Xác nhận")),
    );
  }
}
