import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseState extends Equatable {
  final bool isLoading;
  final String? error;
  final bool? isSuccess;

  const BaseState({this.isLoading = false, this.error, this.isSuccess});

  @override
  List<Object?> get props => [isLoading, isSuccess, error];
}

class BaseCubit<T extends BaseState> extends Cubit<T> {
  BaseCubit(super.initialState);
}
