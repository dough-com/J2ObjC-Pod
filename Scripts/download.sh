#!/bin/bash
set -ev

J2OBJC_VERSION=1.1
SHA1_CHECKSUM=e9d2ae81dfbed6610af3ae744dd0636140e3c928

if [[ -d dist ]]; then
  exit
fi

echo "Fetching J2ObjC v${J2OBJC_VERSION}"
curl -OL https://github.com/google/j2objc/releases/download/${J2OBJC_VERSION}/j2objc-${J2OBJC_VERSION}.zip
echo "${SHA1_CHECKSUM}  j2objc-${J2OBJC_VERSION}.zip" | shasum -c
unzip -o -q j2objc-${J2OBJC_VERSION}.zip

J2OBJC_PATH=j2objc-${J2OBJC_VERSION}

mv $J2OBJC_PATH/frameworks dist
mv $J2OBJC_PATH/include dist
rm j2objc-${J2OBJC_VERSION}.zip
