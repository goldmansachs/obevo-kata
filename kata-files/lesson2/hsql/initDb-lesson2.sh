#!/bin/bash
#
# Copyright 2017 Goldman Sachs.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

CURDIR=`dirname $0`
SETUP_DIR=${CURDIR}/../../setup/hsql
java -jar ${SETUP_DIR}/hsqldb-sqltool-2.3.4.jar --rcFile=${SETUP_DIR}/sqltool.rc kata ${CURDIR}/initDb-lesson2.ddl
