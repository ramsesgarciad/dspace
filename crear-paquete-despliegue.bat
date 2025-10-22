@echo off
REM Script para compilar y crear paquete completo de despliegue IATECI
REM Ejecutar desde la raíz del proyecto

echo ===================================================
echo    CREACION DE PAQUETE DE DESPLIEGUE IATECI
echo ===================================================
echo.

REM Limpiar compilaciones anteriores
if exist dist rmdir /s /q dist
if exist iateci-despliegue rmdir /s /q iateci-despliegue
if exist iateci-despliegue.zip del /f iateci-despliegue.zip

echo [1/5] Compilando proyecto para produccion...
echo.
call npm run build:prod

if %errorlevel% neq 0 (
    echo.
    echo ERROR: La compilacion fallo
    echo Verifica que no haya errores en el codigo
    pause
    exit /b 1
)

echo.
echo [2/5] Creando estructura de carpetas...
mkdir iateci-despliegue
mkdir iateci-despliegue\app
mkdir iateci-despliegue\scripts
mkdir iateci-despliegue\config

echo.
echo [3/5] Copiando archivos compilados...
xcopy dist\browser iateci-despliegue\app\ /E /I /Y

echo.
echo [4/5] Copiando scripts y configuraciones...
copy desplegar-servidor.sh iateci-despliegue\scripts\
copy nginx-iateci.conf iateci-despliegue\config\
copy GUIA_DESPLIEGUE_SERVIDOR.md iateci-despliegue\
copy configurar-webmin-ufw.sh iateci-despliegue\scripts\ 2>nul

REM Crear archivo README para el paquete
echo # Paquete de Despliegue - Repositorio IATECI > iateci-despliegue\README.txt
echo. >> iateci-despliegue\README.txt
echo Este paquete contiene todo lo necesario para desplegar el Repositorio IATECI. >> iateci-despliegue\README.txt
echo. >> iateci-despliegue\README.txt
echo CONTENIDO: >> iateci-despliegue\README.txt
echo   - app/           : Aplicacion compilada >> iateci-despliegue\README.txt
echo   - scripts/       : Scripts de instalacion >> iateci-despliegue\README.txt
echo   - config/        : Archivos de configuracion >> iateci-despliegue\README.txt
echo   - GUIA_DESPLIEGUE_SERVIDOR.md : Guia completa >> iateci-despliegue\README.txt
echo. >> iateci-despliegue\README.txt
echo INSTRUCCIONES RAPIDAS: >> iateci-despliegue\README.txt
echo. >> iateci-despliegue\README.txt
echo 1. Subir este archivo ZIP al servidor Ubuntu >> iateci-despliegue\README.txt
echo 2. Descomprimir: unzip iateci-despliegue.zip >> iateci-despliegue\README.txt
echo 3. Ir a la carpeta: cd iateci-despliegue >> iateci-despliegue\README.txt
echo 4. Ejecutar: chmod +x scripts/desplegar-servidor.sh >> iateci-despliegue\README.txt
echo 5. Ejecutar: sudo ./scripts/desplegar-servidor.sh >> iateci-despliegue\README.txt
echo. >> iateci-despliegue\README.txt
echo Para mas detalles, consulta GUIA_DESPLIEGUE_SERVIDOR.md >> iateci-despliegue\README.txt

REM Crear script de instalación simplificado para el servidor
echo #!/bin/bash > iateci-despliegue\instalar.sh
echo # Script de instalacion rapida - Repositorio IATECI >> iateci-despliegue\instalar.sh
echo. >> iateci-despliegue\instalar.sh
echo echo "=======================================" >> iateci-despliegue\instalar.sh
echo echo "  INSTALACION REPOSITORIO IATECI" >> iateci-despliegue\instalar.sh
echo echo "=======================================" >> iateci-despliegue\instalar.sh
echo echo "" >> iateci-despliegue\instalar.sh
echo. >> iateci-despliegue\instalar.sh
echo # Instalar Nginx >> iateci-despliegue\instalar.sh
echo echo "Instalando Nginx..." >> iateci-despliegue\instalar.sh
echo sudo apt update >> iateci-despliegue\instalar.sh
echo sudo apt install -y nginx >> iateci-despliegue\instalar.sh
echo. >> iateci-despliegue\instalar.sh
echo # Copiar archivos >> iateci-despliegue\instalar.sh
echo echo "Copiando archivos de la aplicacion..." >> iateci-despliegue\instalar.sh
echo sudo mkdir -p /var/www/dspace-angular >> iateci-despliegue\instalar.sh
echo sudo cp -r app/* /var/www/dspace-angular/ >> iateci-despliegue\instalar.sh
echo sudo chown -R www-data:www-data /var/www/dspace-angular >> iateci-despliegue\instalar.sh
echo. >> iateci-despliegue\instalar.sh
echo # Configurar Nginx >> iateci-despliegue\instalar.sh
echo echo "Configurando Nginx..." >> iateci-despliegue\instalar.sh
echo sudo cp config/nginx-iateci.conf /etc/nginx/sites-available/iateci >> iateci-despliegue\instalar.sh
echo sudo ln -sf /etc/nginx/sites-available/iateci /etc/nginx/sites-enabled/iateci >> iateci-despliegue\instalar.sh
echo sudo rm -f /etc/nginx/sites-enabled/default >> iateci-despliegue\instalar.sh
echo. >> iateci-despliegue\instalar.sh
echo # Verificar y reiniciar Nginx >> iateci-despliegue\instalar.sh
echo echo "Reiniciando Nginx..." >> iateci-despliegue\instalar.sh
echo sudo nginx -t ^&^& sudo systemctl restart nginx >> iateci-despliegue\instalar.sh
echo. >> iateci-despliegue\instalar.sh
echo echo "" >> iateci-despliegue\instalar.sh
echo echo "=======================================" >> iateci-despliegue\instalar.sh
echo echo "  INSTALACION COMPLETADA" >> iateci-despliegue\instalar.sh
echo echo "=======================================" >> iateci-despliegue\instalar.sh
echo echo "Accede a: http://iateci.org.do" >> iateci-despliegue\instalar.sh

echo.
echo [5/5] Creando archivo ZIP...
tar -czf iateci-despliegue.zip iateci-despliegue

if %errorlevel% equ 0 (
    echo.
    echo ===================================================
    echo    PAQUETE CREADO EXITOSAMENTE
    echo ===================================================
    echo.
    echo Archivo: iateci-despliegue.zip
    echo Tamano: 
    for %%A in (iateci-despliegue.zip) do echo   %%~zA bytes
    echo.
    echo CONTENIDO DEL PAQUETE:
    echo   - Aplicacion compilada (carpeta app/)
    echo   - Scripts de instalacion (carpeta scripts/)
    echo   - Configuracion de Nginx (carpeta config/)
    echo   - Guia de despliegue completa
    echo   - Script de instalacion rapida (instalar.sh)
    echo.
    echo PROXIMOS PASOS:
    echo   1. Sube iateci-despliegue.zip a tu servidor Ubuntu
    echo   2. En el servidor ejecuta:
    echo      unzip iateci-despliegue.zip
    echo      cd iateci-despliegue
    echo      chmod +x instalar.sh
    echo      sudo ./instalar.sh
    echo.
    echo ===================================================
) else (
    echo.
    echo ERROR: No se pudo crear el archivo ZIP
    echo Verifica que tar este instalado
)

echo.
pause
