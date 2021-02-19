# Extrai o caminho do arquivo
$basePath=$PSScriptRoot
$networkName=$args[0]
$hostPort=65080

write-host "INFO iniciando o container do castlemock"
docker run -d --name castlemock --net ${networkName} -p ${hostPort}:8080 castlemock/castlemock

Start-Sleep -Seconds 60

curl.exe -POST "http://localhost:${hostPort}/castlemock/api/rest/core/project/rest/import" -H "accept: */*" -u "admin:admin" -H "Content-Type: multipart/form-data" -F "file=@${basePath}\castlemock_Generic-Test-Responses.xml;type=text/xml"