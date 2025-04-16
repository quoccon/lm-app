import 'package:flutter/material.dart';
import '../../flutter_core.dart';
import '../core/base_cubit.dart';

class AppScaffold<T extends BaseCubit> extends StatefulWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.isBack = true,
    this.onInit,
    this.onReceiveArguments,
    this.onWillPop,
    this.onLoadData,
    this.floatingActionButton,
    this.bottomAppBar,
    this.actions,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.isTouchDissmissKeyboard = true,
    this.onDispose,
    this.backgroundColor,
    this.isShowHeaderLine = true,
    this.onSubmitSuccess,
  });

  final Widget body;
  final Widget? title;
  final Function(Object? params, T? cubit)? onReceiveArguments;
  final Future<bool> Function(BuildContext context, T?)? onWillPop;
  final Function(T? cubit)? onLoadData;
  final Function(T? cubit)? onInit;
  final Function(T? cubit)? onDispose;
  final Function(T? cubit, BaseState? state)? onSubmitSuccess;
  final bool isBack;
  final Widget? floatingActionButton;
  final Widget? bottomAppBar;
  final List<Widget>? actions;
  final EdgeInsetsGeometry padding;
  final bool isTouchDissmissKeyboard;
  final Color? backgroundColor;
  final bool isShowHeaderLine;

  @override
  State<AppScaffold<T>> createState() => _AppScaffoldState<T>();
}

class _AppScaffoldState<T extends BaseCubit> extends State<AppScaffold<T>> {
  T? cubit;

  bool isReceivedParams = false;

  @override
  void initState() {
    super.initState();
    cubit = GetIt.instance.get<T>();
    widget.onInit?.call(cubit);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.onLoadData?.call(cubit));
  }

  @override
  void didChangeDependencies() {
    if (!isReceivedParams) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && widget.onReceiveArguments != null) {
        widget.onReceiveArguments?.call(args, cubit);
      }
      isReceivedParams = true;
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.onDispose?.call(cubit);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cubit == null) return const SizedBox();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit!),
      ],
      child: WillPopScope(
        onWillPop: () async {
          if (widget.onWillPop == null) {
            return true;
          }
          final isBack = await widget.onWillPop?.call(context, cubit);
          return isBack ?? true;
        },
        child: Scaffold(
          backgroundColor: widget.backgroundColor ?? Colors.white,
          appBar: widget.title == null
              ? null
              : AppBar(
              title: widget.title!,
              actions: widget.actions,
              leading: ModalRoute.of(context)?.isFirst ?? false
                  ? null
                  : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (widget.onWillPop == null) {
                    Navigator.of(context).pop();
                  } else {
                    widget.onWillPop?.call(context, cubit);
                  }
                },
              )),
          body: widget.isTouchDissmissKeyboard
              ? InkWell(
            splashColor: Colors.transparent,
            onTap: null,
            child: _buildContent(),
          )
              : _buildContent(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: widget.floatingActionButton,
          bottomNavigationBar: widget.bottomAppBar,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return BlocListener<T, BaseState>(
      listener: (context, state) {
        if (state.isLoading) {
          UIUtils.showLoading();
        } else {
          UIUtils.hideLoading();
        }
        if ((state.error ?? '').isNotEmpty) {
          UIUtils.showTopSnackbar(context,
              message: state.error, type: SnackBarType.warning);
        }
        if (state.isSuccess == true) {
          widget.onSubmitSuccess?.call(cubit, state);
        }
      },
      child: Column(
        children: [
          if (widget.title != null && widget.isShowHeaderLine)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: Color(0xFFEBEBF0),
                height: 1,
                thickness: 1,
              ),
            ),
          Expanded(
            child: Padding(
              padding: widget.padding,
              child: widget.body,
            ),
          ),
        ],
      ),
    );
  }
}
