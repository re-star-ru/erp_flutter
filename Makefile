run:
	flutter run -d linux

generate:
	protoc \
		-I../restar/api/proto/v1 \
		--dart_out=grpc:lib/generated \
		../restar/api/proto/v1/*.proto \
		$(HOME)/go/include/google/protobuf/*.proto