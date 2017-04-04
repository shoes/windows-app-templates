@echo off

java -version /?  2> NUL

if %ERRORLEVEL%==9009 (
  if not exist "%USERPROFILE%\.shoes\jdk" (
    echo No system Java found. Downloading and installing a Shoes copy.
    md "%USERPROFILE%\.shoes"

    helpers\wget --no-check-certificate https://github.com/jasonrclark/windows-app-templates/releases/download/jdk1.8.0_121/jdk.zip -O %USERPROFILE%\.shoes\jdk.zip
  	helpers\unzip %USERPROFILE%\.shoes\jdk.zip -d %USERPROFILE%\.shoes
  )

  set PATH=%USERPROFILE%\.shoes\jdk\bin;%PATH%
  set JAVA_HOME=%USERPROFILE%\.shoes\jdk
)

java -jar app.jar