@echo off
set projectName=projectname.csproj
:start
set op=clear_pack_push
set /p op=请输入操作命令pack、push、delete、clear或直接回车打包并发布：
if "%op%"=="pack" (
..\nuget.exe pack "%projectName%" -Build -Properties Configuration=Release
goto start)
if "%op%"=="push" (
..\nuget.exe push *.nupkg  -Source http://mynugetserver/api/v2/package
goto start)

if "%op%"=="delete" (
set /p id=请输入包名称：
set /p version=请输入版本号：
..\nuget.exe delete "%id%" "%version%"  -Source http://mynugetserver/api/v2/package
goto start)

if "%op%"=="clear" (
del /s *.nupkg
goto start)

if "%op%"=="clear_pack_push" (
del /s *.nupkg
..\nuget.exe pack "%projectName%" -Build -Properties Configuration=Release
..\nuget.exe push *.nupkg  -Source http://mynugetserver/api/v2/package
goto start)

echo 输入命令无效
goto start
pause  