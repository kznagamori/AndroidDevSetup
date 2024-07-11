@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

SET JDK_NAME="Eclipse Adoptium_17.0.9_9"
SET JDK_URL="https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.11%%2B9/OpenJDK17U-jdk_x64_windows_hotspot_17.0.11_9.zip"
SET JDK_FILE_NAME=OpenJDK17U-jdk_x64_windows_hotspot_17.0.11_9.zip

SET ANDROID_SDK_NAME="Android Studio SDK �c�[�� �p�b�P�[�W"
SET ANDROID_SDK_URL="https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip?hl=ja"
SET ANDROID_SDK_FILE_NAME=commandlinetools-win-11076708_latest.zip


SET GRADLE_NAME="gradle-8.8"
SET GRADLE_URL="https://github.com/gradle/gradle-distributions/releases/download/v8.8.0/gradle-8.8-bin.zip"
SET GRADLE_FILE_NAME=gradle-8.8-bin.zip



@REM ���s�f�B���N�g�����C���X�g�[���f�B���N�g���Ƃ���
SET CURRENT_DIR=%~dp0

@REM ===========================================================================
@REM JDK�C���X�g�[�������J�n
@REM ===========================================================================
SET /P SELECTED="%JDK_NAME% �� %CURRENT_DIR% �ɍ\�z���܂��B(Y=YES / N=NO): "
IF /i {%SELECTED%}=={y} (GOTO :INSTALL_JDK)
IF /i {%SELECTED%}=={yes} (GOTO :INSTALL_JDK)

@REM JDK�C���X�g�[���I��
GOTO :END_INSTALL_JDK

@REM JDK�C���X�g�[������
:INSTALL_JDK

SET DOWNLOAD_PATH="%CURRENT_DIR%%JDK_FILE_NAME%"
SET EXPAND_PATH="%CURRENT_DIR%"

ECHO %JDK_URL% �� %DOWNLOAD_PATH% �Ƀ_�E�����[�h���܂��B

@REM JDK�̃_�E�����[�h���������s
powershell -ExecutionPolicy Bypass -command Invoke-WebRequest ""%JDK_URL%"" -OutFile ""%DOWNLOAD_PATH%""

ECHO %DOWNLOAD_PATH% �� %EXTRACT_PATH%�ɓW�J���܂��B

@REM �_�E�����[�h����JDK��W�J
powershell -ExecutionPolicy Bypass -command Expand-Archive -Path ""%DOWNLOAD_PATH%"" -DestinationPath ""%EXPAND_PATH%""

ECHO %DOWNLOAD_PATH% ���폜���܂��B

@REM �_�E�����[�h����JDK���폜
DEL ""%DOWNLOAD_PATH%""

@REM JDK�C���X�g�[���I��
:END_INSTALL_JDK



@REM ===========================================================================
@REM ANDROID_SDK�C���X�g�[�������J�n
@REM ===========================================================================
SET /P SELECTED="%ANDROID_SDK_NAME% �� %CURRENT_DIR% �ɍ\�z���܂��B(Y=YES / N=NO): "
IF /i {%SELECTED%}=={y} (GOTO :INSTALL_ANDROID_SDK)
IF /i {%SELECTED%}=={yes} (GOTO :INSTALL_ANDROID_SDK)

@REM ANDROID_SDK�C���X�g�[���I��
GOTO :END_INSTALL_ANDROID_SDK

@REM ANDROID_SDK�C���X�g�[������
:INSTALL_ANDROID_SDK

SET DOWNLOAD_PATH="%CURRENT_DIR%%ANDROID_SDK_FILE_NAME%"
SET EXPAND_PATH="%CURRENT_DIR%cmdline-tools"
SET OLD_TOOL_PATH="%CURRENT_DIR%cmdline-tools\cmdline-tools"
SET NEW_TOOL_PATH="%CURRENT_DIR%cmdline-tools\latest"

ECHO %ANDROID_SDK_URL% �� %DOWNLOAD_PATH% �Ƀ_�E�����[�h���܂��B

@REM ANDROID_SDK�̃_�E�����[�h���������s
powershell -ExecutionPolicy Bypass -command Invoke-WebRequest ""%ANDROID_SDK_URL%"" -OutFile ""%DOWNLOAD_PATH%""

ECHO %DOWNLOAD_PATH% �� %EXPAND_PATH%�ɓW�J���܂��B

@REM �_�E�����[�h����ANDROID_SDK��W�J
powershell -ExecutionPolicy Bypass -command Expand-Archive -Path ""%DOWNLOAD_PATH%"" -DestinationPath ""%EXPAND_PATH%""

ECHO %OLD_TOOL_PATH% �� %NEW_TOOL_PATH%�Ƀ��l�[�����܂��B
MOVE %OLD_TOOL_PATH% %NEW_TOOL_PATH%

ECHO %DOWNLOAD_PATH% ���폜���܂��B

@REM �_�E�����[�h����ANDROID_SDK���폜
DEL ""%DOWNLOAD_PATH%""

@REM ANDROID_SDK�C���X�g�[���I��
:END_INSTALL_ANDROID_SDK


@REM ===========================================================================
@REM GRADLE�C���X�g�[�������J�n
@REM ===========================================================================
SET /P SELECTED="%GRADLE_NAME% �� %CURRENT_DIR% �ɍ\�z���܂��B(Y=YES / N=NO): "
IF /i {%SELECTED%}=={y} (GOTO :INSTALL_GRADLE)
IF /i {%SELECTED%}=={yes} (GOTO :INSTALL_GRADLE)

@REM GRADLE�C���X�g�[���I��
GOTO :END_INSTALL_GRADLE

@REM GRADLE�C���X�g�[������
:INSTALL_GRADLE

SET DOWNLOAD_PATH="%CURRENT_DIR%%GRADLE_FILE_NAME%"
SET EXPAND_PATH="%CURRENT_DIR%"

ECHO %GRADLE_URL% �� %DOWNLOAD_PATH% �Ƀ_�E�����[�h���܂��B

@REM GRADLE�̃_�E�����[�h���������s
powershell -ExecutionPolicy Bypass -command Invoke-WebRequest ""%GRADLE_URL%"" -OutFile ""%DOWNLOAD_PATH%""

ECHO %DOWNLOAD_PATH% �� %EXTRACT_PATH%�ɓW�J���܂��B

@REM �_�E�����[�h����GRADLE��W�J
powershell -ExecutionPolicy Bypass -command Expand-Archive -Path ""%DOWNLOAD_PATH%"" -DestinationPath ""%EXPAND_PATH%""

ECHO %DOWNLOAD_PATH% ���폜���܂��B

@REM �_�E�����[�h����GRADLE���폜
DEL ""%DOWNLOAD_PATH%""

@REM GRADLE�C���X�g�[���I��
:END_INSTALL_GRADLE


:END_INSTALL
