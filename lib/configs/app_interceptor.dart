import 'package:flutter_cors/flutter_core.dart';

import '../application/cubit/auth/auth_cubit.dart';

// import '../application/cubit/cubits.dart';

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authState = GetIt.I.get<AuthCubit>().state;

    if (authState.isLogined) {
      options.headers['Authorization'] = authState.token;
      // options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODBjZjBkOGE0ZjI3MjE0OTkyZmNiNGIiLCJpYXQiOjE3NDYwOTIzOTEsImV4cCI6MTc0NjA5NTk5MX0.3OfE5oL8xPVf5Q7r5tOIB3WB6G3Tj57p4BnnmCkOCbs';
    }

    return super.onRequest(options, handler);
  }
}
