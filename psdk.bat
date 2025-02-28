@@ECHO OFF
CHCP 65001
set PSDK_BINARY_PATH=C:\Users\Corentin.cottereau20\AppData\Local\Programs\pokemon-studio\resources\psdk-binaries\
"%PSDK_BINARY_PATH%ruby.exe" --disable=gems,rubyopt,did_you_mean Game.rb %*
