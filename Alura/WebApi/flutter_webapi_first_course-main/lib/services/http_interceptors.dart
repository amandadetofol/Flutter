import 'dart:async';

import 'package:http_interceptor/http_interceptor.dart';

class MyLoggingInterceptor implements InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    print(request.toString());
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    print(response.toString());
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() {
    Completer<bool> completer = Completer<bool>();
    completer.complete(true);
    return completer.future;
  }

  @override
  Future<bool> shouldInterceptResponse() {
    Completer<bool> completer = Completer<bool>();
    completer.complete(true);
    return completer.future;
  }

}
