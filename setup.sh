#!/bin/sh
#
#   Copyright 2018  SenX S.A.S.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#


if [ $# != 3 ]
then
  echo "Usage: $0 plugin-name version \"Description\""
  exit 1
fi

NAME=$1
VERSION=$2
DESC=$3

sed -e "s/@PLUGIN_NAME@/${NAME}/g" settings.gradle > settings.gradle.new
mv -f settings.gradle.new settings.gradle

sed -e "s/@PLUGIN_VERSION@/${VERSION}/g" -e "s/@PLUGIN_DESCRIPTION@/${DESC}/g" build.gradle > build.gradle.new
mv -f build.gradle.new build.gradle
