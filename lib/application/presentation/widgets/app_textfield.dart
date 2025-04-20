import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/constants.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.error,
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.readOnly,
    this.autofocus,
    this.obscuringCharacter,
    this.obscureText,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.ignorePointers,
    this.onTap,
    this.onTapOutside,
    this.minLines,
    this.onValidate,
    this.initText,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? error;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextStyle? style;
  final bool? readOnly;
  final bool? autofocus;
  final String? obscuringCharacter;
  final bool? obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? ignorePointers;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String)? onValidate;

  final String? initText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController controller;
  late FocusNode focusNode;
  String? error;

  late bool _isFocus;
  bool isShowClear = false;

  @override
  void initState() {
    super.initState();
    error = widget.error;
    controller = widget.controller ?? TextEditingController();
    if (widget.initText != null) {
      controller.text = widget.initText ?? '';
    }
    isShowClear = controller.text.isNotEmpty;
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(_onFocusChange);
    _isFocus = widget.autofocus ?? focusNode.hasFocus;

    controller.addListener(() {
      if (isShowClear != controller.text.isNotEmpty) {
        isShowClear = controller.text.isNotEmpty;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    if (widget.focusNode == null) {
      focusNode.removeListener(_onFocusChange);
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    _isFocus = focusNode.hasFocus;
    if (!_isFocus && controller.text.isNotEmpty) {
      error = widget.onValidate?.call(controller.text);
    } else {
      error = null;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final haveError = (error?.trim() ?? '').isNotEmpty;
    final borderColor = haveError
        ? BorderColor.negative
        : (_isFocus ? BorderColor.brand : BorderColor.solid);
    final fillColor = (widget.enabled ?? true)
        ? (haveError
            ? BackgroundColor.negativePrimary
            : BackgroundColor.default1)
        : BackgroundColor.primary;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: AppRadius.radius8,
            border: Border.all(color: borderColor),
            color: fillColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                  ),
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  textCapitalization:
                      widget.textCapitalization ?? TextCapitalization.none,
                  style: widget.style,
                  readOnly: widget.readOnly ?? false,
                  autofocus: widget.autofocus ?? false,
                  obscuringCharacter: widget.obscuringCharacter ?? '•',
                  obscureText: widget.obscureText ?? false,
                  maxLines: widget.maxLines ?? 1,
                  minLines: widget.minLines,
                  maxLength: widget.maxLength,
                  onChanged: (text) {
                    error = null;
                    setState(() {});
                    widget.onChanged?.call(text);
                  },
                  onEditingComplete: widget.onEditingComplete,
                  onSubmitted: widget.onSubmitted,
                  inputFormatters: widget.inputFormatters,
                  enabled: widget.enabled,
                  ignorePointers: widget.ignorePointers,
                  onTap: widget.onTap,
                  onTapOutside: widget.onTapOutside,
                ),
              ),
              if (isShowClear && widget.enabled != false)
                InkWell(
                  splashColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppIcon.size14("ic_clear.svg",
                        color: BackgroundColor.disabled),
                  ),
                  onTap: () {
                    controller.clear();
                    widget.onChanged?.call("");
                    error = null;
                    focusNode.requestFocus();
                    setState(() {});
                  },
                )
            ],
          ),
        ),
        if (haveError) ...[
          AppSpaces.space6.vertical,
          Row(
            children: [
              AppIcon.size14(
                'ic_textfield_error.svg',
                color: TextColor.negative,
              ),
              AppSpaces.space4.horizontal,
              Expanded(
                child: Text(
                  error ?? '',
                  style: AppTextStyle.small.copyWith(
                    color: TextColor.negative,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
