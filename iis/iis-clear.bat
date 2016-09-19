@echo off
cd C:\Windows\System32\inetsrv
appcmd set config /section:httpProtocol /-"customHeaders.[name='X-Powered-By']"
appcmd set config /section:httpRuntime /enableVersionHeader:"false" /commit:WEBROOT
cd C:\Windows\SysWOW64\inetsrv
appcmd set config /section:httpRuntime /enableVersionHeader:"false" /commit:WEBROOT

@pause