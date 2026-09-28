#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
ROOT=$(pwd)
cd "$ROOT/upstream/zmk-studio-ts-client"
"$ROOT/build-tools/node_modules/.bin/grpc_tools_node_protoc" --plugin="protoc-gen-ts_proto=$ROOT/build-tools/node_modules/.bin/protoc-gen-ts_proto" --ts_proto_out=./src/ --ts_proto_opt=env=browser --proto_path=./zmk-studio-messages/proto/zmk/ ./zmk-studio-messages/proto/zmk/*.proto
cd "$ROOT/upstream/zmks-studio"
"$ROOT/build-tools/node_modules/.bin/vite" build --config vite.demo.config.mjs
cp LICENSE "$ROOT/dist/config/zmks/LICENSE"
cp NOTICE "$ROOT/dist/config/zmks/NOTICE"
cp ../zmk-studio-ts-client/LICENSE "$ROOT/dist/config/zmks/CLIENT-LICENSE"
