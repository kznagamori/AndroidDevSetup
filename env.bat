@ECHO OFF
SET JAVA_HOME=%~dp0jdk-17.0.11+9
SET ANDROID_SDK_ROOT=%~dp0
SET GRADLE_HOME=%~dp0gradle-8.8
SET PATH=%GRADLE_HOME%\bin;%ANDROID_SDK_ROOT%\emulator;%ANDROID_SDK_ROOT%\platform-tools;%ANDROID_SDK_ROOT%\cmdline-tools\latest\bin;%JAVA_HOME%bin;%PATH%
