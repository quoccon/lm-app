import 'package:flutter_cors/flutter_core.dart';

// import '../application/cubit/cubits.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final authState = GetIt.I.get<AuthCubit>().state;
    //
    // if (authState.isLogined) {
    //   options.headers['Authorization'] = authState.token;
    // }

    return super.onRequest(options, handler);
  }
}
