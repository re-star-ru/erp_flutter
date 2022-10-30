///
//  Generated code. Do not modify.
//  source: diagnostic.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'diagnostic.pb.dart' as $1;
export 'diagnostic.pb.dart';

class DiagnosticServiceClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$0.Empty, $1.Diagnostic>(
      '/DiagnosticService/Create',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Diagnostic.fromBuffer(value));
  static final _$read = $grpc.ClientMethod<$1.ID, $1.Diagnostic>(
      '/DiagnosticService/Read',
      ($1.ID value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Diagnostic.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$1.Diagnostic, $1.Diagnostic>(
      '/DiagnosticService/Update',
      ($1.Diagnostic value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Diagnostic.fromBuffer(value));
  static final _$list = $grpc.ClientMethod<$0.Empty, $1.DiagnosticList>(
      '/DiagnosticService/List',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DiagnosticList.fromBuffer(value));

  DiagnosticServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Diagnostic> create($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$1.Diagnostic> read($1.ID request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$read, request, options: options);
  }

  $grpc.ResponseFuture<$1.Diagnostic> update($1.Diagnostic request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$1.DiagnosticList> list($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$list, request, options: options);
  }
}

abstract class DiagnosticServiceBase extends $grpc.Service {
  $core.String get $name => 'DiagnosticService';

  DiagnosticServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Diagnostic>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Diagnostic value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ID, $1.Diagnostic>(
        'Read',
        read_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ID.fromBuffer(value),
        ($1.Diagnostic value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Diagnostic, $1.Diagnostic>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Diagnostic.fromBuffer(value),
        ($1.Diagnostic value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.DiagnosticList>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.DiagnosticList value) => value.writeToBuffer()));
  }

  $async.Future<$1.Diagnostic> create_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return create(call, await request);
  }

  $async.Future<$1.Diagnostic> read_Pre(
      $grpc.ServiceCall call, $async.Future<$1.ID> request) async {
    return read(call, await request);
  }

  $async.Future<$1.Diagnostic> update_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Diagnostic> request) async {
    return update(call, await request);
  }

  $async.Future<$1.DiagnosticList> list_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return list(call, await request);
  }

  $async.Future<$1.Diagnostic> create($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.Diagnostic> read($grpc.ServiceCall call, $1.ID request);
  $async.Future<$1.Diagnostic> update(
      $grpc.ServiceCall call, $1.Diagnostic request);
  $async.Future<$1.DiagnosticList> list(
      $grpc.ServiceCall call, $0.Empty request);
}
