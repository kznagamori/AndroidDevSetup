@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

SET JDK_NAME="Eclipse Adoptium_17.0.9_9"
SET JDK_URL="https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.11%%2B9/OpenJDK17U-jdk_x64_windows_hotspot_17.0.11_9.zip"
SET JDK_FILE_NAME=OpenJDK17U-jdk_x64_windows_hotspot_17.0.11_9.zip

SET ANDROID_SDK_NAME="Android Studio SDK ツール パッケージ"
SET ANDROID_SDK_URL="https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip?hl=ja"
SET ANDROID_SDK_FILE_NAME=commandlinetools-win-11076708_latest.zip


SET GRADLE_NAME="gradle-8.8"
SET GRADLE_URL="https://github.com/gradle/gradle-distributions/releases/download/v8.8.0/gradle-8.8-bin.zip"
SET GRADLE_FILE_NAME=gradle-8.8-bin.zip



@REM 実行ディレクトリをインストールディレクトリとする
SET CURRENT_DIR=%~dp0

@REM ===========================================================================
@REM JDKインストール処理開始
@REM ===========================================================================
SET /P SELECTED="%JDK_NAME% を %CURRENT_DIR% に構築します。(Y=YES / N=NO): "
IF /i {%SELECTED%}=={y} (GOTO :INSTALL_JDK)
IF /i {%SELECTED%}=={yes} (GOTO :INSTALL_JDK)

@REM JDKインストール終了
GOTO :END_INSTALL_JDK

@REM JDKインストール処理
:INSTALL_JDK

SET DOWNLOAD_PATH="%CURRENT_DIR%%JDK_FILE_NAME%"
SET EXPAND_PATH="%CURRENT_DIR%"

ECHO %JDK_URL% を %DOWNLOAD_PATH% にダウンロードします。

@REM JDKのダウンロード処理を実行
powershell -ExecutionPolicy Bypass -command Invoke-WebRequest ""%JDK_URL%"" -OutFile ""%DOWNLOAD_PATH%""

ECHO %DOWNLOAD_PATH% を %EXTRACT_PATH%に展開します。

@REM ダウンロードしたJDKを展開
powershell -ExecutionPolicy Bypass -command Expand-Archive -Path ""%DOWNLOAD_PATH%"" -DestinationPath ""%EXPAND_PATH%""

ECHO %DOWNLOAD_PATH% を削除します。

@REM ダウンロードしたJDKを削除
DEL ""%DOWNLOAD_PATH%""

@REM JDKインストール終了
:END_INSTALL_JDK



@REM ===========================================================================
@REM ANDROID_SDKインストール処理開始
@REM ===========================================================================
SET /P SELECTED="%ANDROID_SDK_NAME% を %CURRENT_DIR% に構築します。(Y=YES / N=NO): "
IF /i {%SELECTED%}=={y} (GOTO :INSTALL_ANDROID_SDK)
IF /i {%SELECTED%}=={yes} (GOTO :INSTALL_ANDROID_SDK)

@REM ANDROID_SDKインストール終了
GOTO :END_INSTALL_ANDROID_SDK

@REM ANDROID_SDKインストール処理
:INSTALL_ANDROID_SDK

SET DOWNLOAD_PATH="%CURRENT_DIR%%ANDROID_SDK_FILE_NAME%"
SET EXPAND_PATH="%CURRENT_DIR%cmdline-tools"
SET OLD_TOOL_PATH="%CURRENT_DIR%cmdline-tools\cmdline-tools"
SET NEW_TOOL_PATH="%CURRENT_DIR%cmdline-tools\latest"

ECHO %ANDROID_SDK_URL% を %DOWNLOAD_PATH% にダウンロードします。

@REM ANDROID_SDKのダウンロード処理を実行
powershell -ExecutionPolicy Bypass -command Invoke-WebRequest ""%ANDROID_SDK_URL%"" -OutFile ""%DOWNLOAD_PATH%""

ECHO %DOWNLOAD_PATH% を %EXPAND_PATH%に展開します。

@REM ダウンロードしたANDROID_SDKを展開
powershell -ExecutionPolicy Bypass -command Expand-Archive -Path ""%DOWNLOAD_PATH%"" -DestinationPath ""%EXPAND_PATH%""

ECHO %OLD_TOOL_PATH% を %NEW_TOOL_PATH%にリネームします。
MOVE %OLD_TOOL_PATH% %NEW_TOOL_PATH%

ECHO %DOWNLOAD_PATH% を削除します。

@REM ダウンロードしたANDROID_SDKを削除
DEL ""%DOWNLOAD_PATH%""

@REM ANDROID_SDKインストール終了
:END_INSTALL_ANDROID_SDK


@REM ===========================================================================
@REM GRADLEインストール処理開始
@REM ===========================================================================
SET /P SELECTED="%GRADLE_NAME% を %CURRENT_DIR% に構築します。(Y=YES / N=NO): "
IF /i {%SELECTED%}=={y} (GOTO :INSTALL_GRADLE)
IF /i {%SELECTED%}=={yes} (GOTO :INSTALL_GRADLE)

@REM GRADLEインストール終了
GOTO :END_INSTALL_GRADLE

@REM GRADLEインストール処理
:INSTALL_GRADLE

SET DOWNLOAD_PATH="%CURRENT_DIR%%GRADLE_FILE_NAME%"
SET EXPAND_PATH="%CURRENT_DIR%"

ECHO %GRADLE_URL% を %DOWNLOAD_PATH% にダウンロードします。

@REM GRADLEのダウンロード処理を実行
powershell -ExecutionPolicy Bypass -command Invoke-WebRequest ""%GRADLE_URL%"" -OutFile ""%DOWNLOAD_PATH%""

ECHO %DOWNLOAD_PATH% を %EXTRACT_PATH%に展開します。

@REM ダウンロードしたGRADLEを展開
powershell -ExecutionPolicy Bypass -command Expand-Archive -Path ""%DOWNLOAD_PATH%"" -DestinationPath ""%EXPAND_PATH%""

ECHO %DOWNLOAD_PATH% を削除します。

@REM ダウンロードしたGRADLEを削除
DEL ""%DOWNLOAD_PATH%""

@REM GRADLEインストール終了
:END_INSTALL_GRADLE


:END_INSTALL
