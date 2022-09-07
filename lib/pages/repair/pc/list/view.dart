import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter/generated/diagnostic.pbgrpc.dart';
import 'package:test_flutter/generated/google/protobuf/empty.pb.dart';

class RepairListViewPC extends StatelessWidget {
  const RepairListViewPC({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Талон ремонта'),
        MaterialButton(
          onPressed: () async {
            Logger().d("message");

            final channel = ClientChannel(
              'localhost',
              port: 8090,
              options: const ChannelOptions(
                credentials: ChannelCredentials.insecure(),
              ),
            );

            final stub = DiagnosticServiceClient(channel);
            final name = await stub.list(Empty());

            Logger().d(name.list.first.createdAt.toDateTime().toLocal());
          },
          child: Text("Message"),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                100,
                (index) => SizedBox(
                  width: double.infinity,
                  child: Text('$index'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
