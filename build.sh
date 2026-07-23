#!/bin/bash

WORKDIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGE_DIR="${WORKDIR}/package"

if [ ! -f "${PACKAGE_DIR}/manifest" ]; then
  echo "Error: ${PACKAGE_DIR}/manifest not found!"
  exit 1
fi

APPNAME=$(grep -w '^appname' "${PACKAGE_DIR}/manifest" | awk -F= '{print $2}' | xargs)
VERSION=$(grep -w '^version' "${PACKAGE_DIR}/manifest" | awk -F= '{print $2}' | xargs)
PLATFORM=$(grep -w '^platform' "${PACKAGE_DIR}/manifest" | awk -F= '{print $2}' | xargs)

echo "Packaging: ${APPNAME} v${VERSION} [${PLATFORM}]"

cd "${WORKDIR}"

if command -v fnpack &> /dev/null; then
  echo "Using global fnpack tool..."
  fnpack build --directory "${PACKAGE_DIR}"
elif [[ -x "./fnpack" ]]; then
  echo "Using local fnpack..."
  ./fnpack build --directory "${PACKAGE_DIR}"
elif [[ -x "./fnpack.exe" ]]; then
  echo "Using local fnpack.exe..."
  ./fnpack.exe build --directory "${PACKAGE_DIR}"
else
  echo "Error: fnpack / fnpack.exe not found in PATH or root directory."
  echo "Please download fnpack from https://static2.fnnas.com/fnpack/fnpack-1.0.4-linux-amd64"
  exit 1
fi

OUTFILE="${APPNAME}_${PLATFORM}_v${VERSION}.fpk"
if [ -f "${APPNAME}.fpk" ]; then
  mv "${APPNAME}.fpk" "${OUTFILE}"
  echo "✅ Build Complete: ${OUTFILE}"
fi

exit 0
