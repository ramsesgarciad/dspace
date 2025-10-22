@echo off
echo ========================================
echo VERIFICACION DE CAMBIOS IATECI
echo ========================================
echo.

echo Verificando archivos modificados y creados...
echo.

echo [1] Logo IATECI:
if exist "src\assets\images\iateci-logo.png" (
    echo    [OK] src\assets\images\iateci-logo.png
) else (
    echo    [X] FALTA: src\assets\images\iateci-logo.png
)
echo.

echo [2] Colores personalizados:
if exist "src\themes\dspace\styles\_theme_sass_variable_overrides.scss" (
    echo    [OK] src\themes\dspace\styles\_theme_sass_variable_overrides.scss
    findstr /C:"#045484" "src\themes\dspace\styles\_theme_sass_variable_overrides.scss" >nul
    if %errorlevel%==0 (
        echo    [OK] Colores IATECI aplicados
    ) else (
        echo    [X] Colores IATECI NO aplicados
    )
) else (
    echo    [X] FALTA archivo de colores
)
echo.

echo [3] Header con logo:
if exist "src\themes\dspace\app\header\header.component.html" (
    echo    [OK] src\themes\dspace\app\header\header.component.html
    findstr /C:"iateci-logo.png" "src\themes\dspace\app\header\header.component.html" >nul
    if %errorlevel%==0 (
        echo    [OK] Logo IATECI en header
    ) else (
        echo    [X] Logo IATECI NO en header
    )
) else (
    echo    [X] FALTA archivo header
)
echo.

echo [4] Pagina de inicio:
if exist "src\app\home-page\home-news\home-news.component.html" (
    echo    [OK] src\app\home-page\home-news\home-news.component.html
    findstr /C:"Repositorio IATECI" "src\app\home-page\home-news\home-news.component.html" >nul
    if %errorlevel%==0 (
        echo    [OK] Contenido IATECI en home
    ) else (
        echo    [X] Contenido IATECI NO en home
    )
) else (
    echo    [X] FALTA archivo home
)
echo.

echo [5] Traducciones en español:
if exist "src\assets\i18n\es.json5" (
    echo    [OK] src\assets\i18n\es.json5
    findstr /C:"Repositorio IATECI" "src\assets\i18n\es.json5" >nul
    if %errorlevel%==0 (
        echo    [OK] Traducciones IATECI aplicadas
    ) else (
        echo    [X] Traducciones IATECI NO aplicadas
    )
) else (
    echo    [X] FALTA archivo de traducciones
)
echo.

echo [6] Nuevas paginas informativas:
if exist "src\app\info\policies\policies.component.html" (
    echo    [OK] src\app\info\policies\policies.component.html
) else (
    echo    [X] FALTA: Politicas
)

if exist "src\app\info\requirements\requirements.component.html" (
    echo    [OK] src\app\info\requirements\requirements.component.html
) else (
    echo    [X] FALTA: Requisitos
)

if exist "src\app\info\award\award.component.html" (
    echo    [OK] src\app\info\award\award.component.html
) else (
    echo    [X] FALTA: Premio Anual
)
echo.

echo [7] Archivos de configuracion:
if exist "src\config\app-config.interface.ts" (
    echo    [OK] src\config\app-config.interface.ts
) else (
    echo    [X] FALTA: app-config.interface.ts
)
echo.

echo [8] Documentacion:
if exist "IATECI_README.md" (
    echo    [OK] IATECI_README.md
) else (
    echo    [X] FALTA: IATECI_README.md
)

if exist "CAMBIOS_IATECI.md" (
    echo    [OK] CAMBIOS_IATECI.md
) else (
    echo    [X] FALTA: CAMBIOS_IATECI.md
)

if exist "INTEGRACION_PAGINAS_IATECI.md" (
    echo    [OK] INTEGRACION_PAGINAS_IATECI.md
) else (
    echo    [X] FALTA: INTEGRACION_PAGINAS_IATECI.md
)
echo.

echo ========================================
echo RESUMEN
echo ========================================
echo.
echo Si ves [OK] en todos los items, los cambios estan aplicados.
echo.
echo Para EJECUTAR el proyecto:
echo   1. npm install
echo   2. npm run start:dev
echo   3. Abre http://localhost:4000
echo.
echo Si hay items con [X], verifica que estas en el directorio correcto:
echo   C:\Users\RamsesGarcia\Downloads\dspace-angular
echo.
pause
