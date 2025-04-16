import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AppWidget<T extends Cubit> extends StatefulWidget {
  const AppWidget({
    super.key,
    required this.child,
    this.onInitState,
    this.onDispose,
    this.onBuild,
  });

  final Widget child;
  final Function(T? cubit)? onInitState;
  final Function(T? cubit)? onBuild;
  final Function(T? cubit)? onDispose;

  @override
  State<AppWidget<T>> createState() => _AppWidgetState<T>();
}

class _AppWidgetState<T extends Cubit> extends State<AppWidget<T>> {
  T? cubit;

  @override
  void initState() {
    super.initState();
    cubit = GetIt.instance.get<T>();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.onInitState?.call(cubit));
  }

  @override
  void dispose() {
    widget.onDispose?.call(cubit);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cubit == null) return const SizedBox();
    widget.onBuild?.call(cubit);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit!),
      ],
      child: widget.child,
    );
  }
}
