///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user.pb.dart' as $2;
export 'user.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$userInfo = $grpc.ClientMethod<$2.UserRequest, $2.UserResponse>(
      '/UserService/UserInfo',
      ($2.UserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.UserResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.UserResponse> userInfo($2.UserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userInfo, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.UserRequest, $2.UserResponse>(
        'UserInfo',
        userInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UserRequest.fromBuffer(value),
        ($2.UserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.UserResponse> userInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UserRequest> request) async {
    return userInfo(call, await request);
  }

  $async.Future<$2.UserResponse> userInfo(
      $grpc.ServiceCall call, $2.UserRequest request);
}
