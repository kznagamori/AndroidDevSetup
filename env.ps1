$env:JAVA_HOME = $PSScriptRoot + "\jdk-17.0.11+9";
$env:ANDROID_SDK_ROOT = $PSScriptRoot;
$env:GRADLE_HOME = $PSScriptRoot + "\gradle-8.8";
$env:Path = $env:GRADLE_HOME + "\bin;" + $env:ANDROID_SDK_ROOT + "\emulator;"  + $env:ANDROID_SDK_ROOT + "\platform-tools;" + $env:ANDROID_SDK_ROOT + "\cmdline-tools\latest\bin;" + $env:JAVA_HOME + "bin;" + $env:Path;

