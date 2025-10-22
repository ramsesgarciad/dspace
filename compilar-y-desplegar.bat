@echo off
REM Script para compilar y preparar el despliegue de IATECI
REM Ejecutar desde Windows

echo ===================================================
echo    COMPILACION DE REPOSITORIO IATECI
echo ===================================================
echo.

REM Variables - CONFIGURA ESTAS SEGÚN TU SERVIDOR
set SERVER_USER=tu_usuario
set SERVER_IP=iateci.org.do
set SERVER_PATH=/home/%SERVER_USER%/

echo [1/4] Compilando proyecto para produccion...
call npm run build:prod

if %errorlevel% neq 0 (
    echo ERROR: La compilacion fallo
    pause
    exit /b 1
)

echo.
echo [2/4] Creando archivo comprimido...
cd dist
tar -czf ..\dspace-angular-build.tar.gz .
cd ..

echo.
echo [3/4] Archivo compilado creado: dspace-angular-build.tar.gz
echo.
echo ===================================================
echo    INSTRUCCIONES DE DESPLIEGUE
echo ===================================================
echo.
echo OPCION A - Transferencia manual:
echo   1. Usa WinSCP o FileZilla para conectarte a %SERVER_IP%
echo   2. Sube el archivo: dspace-angular-build.tar.gz
echo   3. Sube el script: desplegar-servidor.sh
echo.
echo OPCION B - Transferencia automatica con SCP:
echo   Ejecuta estos comandos en PowerShell:
echo.
echo   scp dspace-angular-build.tar.gz %SERVER_USER%@%SERVER_IP%:%SERVER_PATH%
echo   scp desplegar-servidor.sh %SERVER_USER%@%SERVER_IP%:%SERVER_PATH%
echo.
echo [4/4] En el servidor Ubuntu ejecuta:
echo.
echo   ssh %SERVER_USER%@%SERVER_IP%
echo   chmod +x desplegar-servidor.sh
echo   ./desplegar-servidor.sh
echo.
echo ===================================================
pause
