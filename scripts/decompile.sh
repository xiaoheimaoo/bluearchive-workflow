#!/bin/bash
set -euo pipefail

./.tools/Il2CppInspector.Redux.CLI -i ./libil2cpp.so -m global-metadata.dat \
  -l tree \
  -p ida.py \
  -c DiffableCs \
  -o script.json \
  -d DummyDll \
  --select-outputs

echo "Extracting protocolConverter VA offset value..."
offset=$(rg "^\s+public int TypeConversion\(uint crc, Protocol protocol\);.*// (0x[0-9A-F]+)-" -o --no-filename -r '$1' ./DiffableCs/BlueArchive/MX/NetworkProtocol/ProtocolConverter.cs)
echo "::notice title=VA Offset::$offset"
echo "offset=$offset" >> $GITHUB_OUTPUT
echo "Offset extracted."
