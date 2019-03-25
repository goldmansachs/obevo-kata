@REM
@REM Copyright 2017 Goldman Sachs.
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM     http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing,
@REM software distributed under the License is distributed on an
@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
@REM KIND, either express or implied.  See the License for the
@REM specific language governing permissions and limitations
@REM under the License.
@REM

SET CURDIR=%~dp0

echo "TODO not tested in Windows"

docker cp %CURDIR%/initDb.ddl %CONTAINER_NAME%:/tmp/initDb.ddl
docker exec %CONTAINER_NAME% psql -d postgres -U katadeployer -f /tmp/initDb.ddl

SET CONTAINER_NAME=obevo-postgresql-instance

SET RUNNING_CONTAINER_ID=$(docker ps -aqf "name=$CONTAINER_NAME")
if [[ ! -z "$RUNNING_CONTAINER_ID" ]]
then
    echo "Shutting down old container"
    docker stop %RUNNING_CONTAINER_ID%
    docker rm %RUNNING_CONTAINER_ID%
fi
