@echo off
echo ========================================
echo Configuracion del Repositorio IATECI
echo Instituto Avanzado de Tecnologias en Ciencias e Innovacion
echo ========================================
echo.

REM Crear archivo de configuracion de desarrollo
echo Creando archivo de configuracion...
(
echo # Configuracion de desarrollo para Repositorio IATECI
echo # Instituto Avanzado de Tecnologias en Ciencias e Innovacion
echo.
echo debug: true
echo.
echo # Configuracion de la UI
echo ui:
echo   ssl: false
echo   host: localhost
echo   port: 4000
echo   nameSpace: /
echo.
echo # Configuracion del API REST
echo # IMPORTANTE: Actualiza estos valores con tu servidor backend de DSpace
echo rest:
echo   ssl: false
echo   host: localhost
echo   port: 8080
echo   nameSpace: /server
) > config\config.dev.yml

echo.
echo Archivo config\config.dev.yml creado exitosamente!
echo.
echo ========================================
echo Siguiente paso: Iniciar el servidor
echo ========================================
echo.
echo Ejecuta:
echo   npm install   (si aun no lo has hecho^)
echo   npm run start:dev
echo.
echo El servidor estara disponible en: http://localhost:4000
echo.
echo NOTA: Necesitas tener el backend de DSpace ejecutandose
echo para que el repositorio funcione completamente.
echo.
pause
