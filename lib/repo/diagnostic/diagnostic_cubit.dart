import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter/components/network_states.dart';
import 'package:test_flutter/generated/diagnostic.pbgrpc.dart';
import 'package:test_flutter/generated/google/protobuf/empty.pb.dart';

class DiagnosticListCubit extends Cubit<DiagnosticList> {
  DiagnosticListCubit() : super(DiagnosticList(NetworkState.loading, []));

  final _channel = ClientChannel(
    'localhost',
    port: 8090,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  Future<void> list() async {
    emit(DiagnosticList(NetworkState.loading, state.diagnosticList));

    try {
      final client = DiagnosticServiceClient(_channel);
      final name = await client.list(Empty());

      // delay imitation
      await Future.delayed(const Duration(seconds: 1));

      final dl = name.list.map((e) {
        return Diagnostic(
          e.id.toInt(),
          e.version.toInt(),
          e.createdAt.toDateTime().toLocal(),
          e.updatedAt.toDateTime().toLocal(),
          e.definedNumber,
          e.sKU,
        );
      }).toList();

      emit(DiagnosticList(NetworkState.done, dl));
    } catch (e) {
      Logger().e(e);
      emit(DiagnosticList(NetworkState.error, state.diagnosticList));
    }
  }
}

class DiagnosticList {
  DiagnosticList(this.state, this.diagnosticList);

  final NetworkState state;
  final List<Diagnostic> diagnosticList;
}

class Diagnostic {
  Diagnostic(
    this.id,
    this.version,
    this.createdAt,
    this.updatedAt,
    this.definedNumber,
    this.sku,
  );

  final int id;
  final int version;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String definedNumber;
  final String sku;
}
