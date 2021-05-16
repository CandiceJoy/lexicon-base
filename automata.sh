#!/bin/bash

# Lexicon Base file automata script

# Header
echo "
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
----------------------------------       Lexicon Base File Automata      -----------------------------------------
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
"
echo ""

echo "Environment Settings:
Branch: ${GIT_BRANCH}
Build Number: ${BUILD_NUMBER}
Workspace Location: ${WORKSPACE}

Build URL: ${BUILD_URL}
"

# Processing

# Setting Varibles
FILE_NAME="Lexicon_basepack"
COMPILE_PATH='./compiler'
GAME_PATH='./pk3'

# Compile BCS Code
chmod +x $COMPILE_PATH/bcc
$COMPILE_PATH/bcc -acc-err-file -x bcs $GAME_PATH/ACS/main.c $GAME_PATH/ACS/main.o

# Pack game files
cd $GAME_PATH
7za a -r -ssw -mx9 -tzip  ../${FILE_NAME}.pk3 ./*

# Create proper Jenkins filenames
cd ..
mv ./${FILE_NAME}.pk3 ./${FILE_NAME}_beta_build_${BUILD_NUMBER}.pk3

# Copy file to the lexicon zandronum folder for server use

cp ./${FILE_NAME}_beta_build_${BUILD_NUMBER}.pk3 ~/.config/zandronum

# Export varible to use in other scripts
echo LEX_MAINFILE="${FILE_NAME}_beta_build_${BUILD_NUMBER}.pk3" >> lexmap_basefile