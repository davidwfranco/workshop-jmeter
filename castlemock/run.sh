#!/bin/sh
networkName="$1"
port=58080

echo "INFO iniciando o container do castlemock"
docker run -d --name castlemock --net ${networkName} -p ${port}:8080 castlemock/castlemock

sleep 60

curl -X POST "http://localhost:${port}/castlemock/api/rest/core/project/rest/import" \
	-H "accept: */*" \
	-u "admin:admin" \
	-H "Content-Type: multipart/form-data" \
	-F "file=@castlemock_Generic-Test-Responses.xml;type=text/xml"