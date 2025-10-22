# Resumen de Cambios - Personalización IATECI

## Cambios Realizados en el Repositorio DSpace

### 🎨 **1. Identidad Visual**

#### Logo
- ✅ **Archivo**: `src/assets/images/iateci-logo.png`
- ✅ **Componente actualizado**: `src/themes/dspace/app/header/header.component.html`
- El logo de IATECI ahora aparece en el header de todas las páginas

#### Colores de Marca
- ✅ **Archivo modificado**: `src/themes/dspace/styles/_theme_sass_variable_overrides.scss`
- **Paleta aplicada**:
  - Azul principal: `#045484`
  - Verde principal: `#3c9c44`
  - Verde azulado: `#539385`
  - Azul claro: `#3c7c9c`
  - Azul celeste: `#76a4bc`
  - Verde lima: `#67b36d`
  - Verde claro: `#88c189`
  - Gris claro: `#d9e4e4`

### 📄 **2. Páginas Informativas Creadas**

#### Nuevas Páginas HTML
- ✅ **Políticas del Repositorio**: `src/app/info/policies/policies.component.html`
  - 9 políticas completas del repositorio
  - Navegación rápida entre secciones
  - Contacto editorial

- ✅ **Requisitos para Publicación**: `src/app/info/requirements/requirements.component.html`
  - Plantilla de formato
  - Carta de declaración de originalidad
  - Proceso de envío paso a paso
  - Lista de verificación interactiva

- ✅ **Premio Anual "Osvaldo García de la Concha"**: `src/app/info/award/award.component.html`
  - 3 categorías de reconocimiento
  - Proceso de selección
  - Información de ceremonia
  - Requisitos de participación

### 📝 **3. Textos y Contenido**

#### Archivo de Traducción Español
- ✅ **Archivo modificado**: `src/assets/i18n/es.json5`
- **Cambios principales**:
  - Título del home: "Repositorio IATECI"
  - Placeholder de búsqueda: "Buscar en el Repositorio IATECI..."
  - Comunidades: "Categorías Académicas en IATECI"
  - Copyright: "© {year} Instituto Avanzado de Tecnologías en Ciencias e Innovación (IATECI) | Licencia CC BY 4.0"
  - País: "República Dominicana"

#### Página de Inicio
- ✅ **Archivo modificado**: `src/app/home-page/home-news/home-news.component.html`
- **Contenido nuevo**:
  - Descripción completa de IATECI
  - Misión y visión del repositorio
  - Objetivos institucionales
  - Información sobre Ciencia Abierta
  - Mención de la licencia CC BY 4.0

#### Metadatos HTML
- ✅ **Archivo modificado**: `src/index.html`
- **Cambios**:
  - Título: "Repositorio IATECI - Instituto Avanzado de Tecnologías en Ciencias e Innovación"
  - Descripción para SEO
  - Keywords relevantes
  - Idioma principal: español (lang="es")

### ⚙️ **3. Configuración**

#### Archivos Creados
1. **IATECI_README.md** - Documentación completa del repositorio IATECI
2. **CAMBIOS_IATECI.md** - Este archivo con el resumen de cambios
3. **setup-iateci.bat** - Script de Windows para configuración rápida
4. **src/config/** (archivos de configuración TypeScript para desarrollo)

### 🚀 **4. Próximos Pasos**

Para ejecutar el repositorio personalizado:

1. **Ejecutar el script de configuración**:
   ```bash
   setup-iateci.bat
   ```

2. **O manualmente crear** `config/config.dev.yml`:
   ```yaml
   debug: true
   ui:
     ssl: false
     host: localhost
     port: 4000
     nameSpace: /
   rest:
     ssl: false
     host: localhost
     port: 8080
     nameSpace: /server
   ```

3. **Instalar dependencias**:
   ```bash
   npm install
   ```

4. **Iniciar el servidor**:
   ```bash
   npm run start:dev
   ```

5. **Acceder a**: http://localhost:4000

### 📋 **5. Categorías Académicas a Configurar**

Una vez que el backend esté funcionando, deberás crear las siguientes comunidades/colecciones:

1. Ingeniería Electrónica y Sistemas Embebidos
2. Ciencias de la Computación e Inteligencia Artificial
3. Energías Renovables y Eficiencia Energética
4. Robótica y Automatización
5. Telecomunicaciones y Redes
6. Materiales Avanzados y Nanotecnología
7. Biotecnología y Tecnologías Médicas
8. Diseño 3D, Prototipado y Manufactura Digital
9. Innovación y Emprendimiento Tecnológico
10. Ciencia de Datos y Computación Cuántica
11. Educación STEM y Didáctica Tecnológica
12. Proyectos Interdisciplinarios
13. Publicaciones Institucionales y Tesis
14. Desarrollo de Políticas Industriales y Tecnológicas
15. Tecnología, Sociedad y Sostenibilidad
16. Matemáticas Puras y Aplicadas
17. Ciencias Físicas y del Espacio
18. Ciencias Químicas y Moleculares
19. Movilidad Eléctrica

### ⚠️ **Requisitos Importantes**

#### Backend de DSpace
Este es **SOLO el frontend** (interfaz de usuario). Para que funcione completamente necesitas:

1. **Servidor backend de DSpace 9.x** ejecutándose
2. **Base de datos PostgreSQL** configurada
3. **Servidor de archivos** (assetstore) configurado

**Documentación del backend**:
- https://wiki.lyrasis.org/display/DSDOC9x/Installing+DSpace
- https://github.com/DSpace/DSpace

### 📞 **Soporte**

Para dudas sobre:
- **DSpace en general**: https://wiki.lyrasis.org/display/DSPACE/
- **Configuración del backend**: Consulta la documentación oficial de DSpace
- **Personalización adicional**: Revisa el código fuente en GitHub

---

## Archivos Modificados y Creados (Lista Completa)

```
src/
├── index.html (título y metadatos) ✅ MODIFICADO
├── assets/
│   ├── images/
│   │   └── iateci-logo.png ✅ NUEVO
│   └── i18n/
│       └── es.json5 (textos personalizados + traducciones de menú) ✅ MODIFICADO
├── themes/dspace/
│   ├── app/
│   │   └── header/
│   │       └── header.component.html (logo) ✅ MODIFICADO
│   └── styles/
│       └── _theme_sass_variable_overrides.scss (colores) ✅ MODIFICADO
├── app/
│   ├── home-page/
│   │   └── home-news/
│   │       └── home-news.component.html (contenido principal) ✅ MODIFICADO
│   └── info/ ✅ DIRECTORIO NUEVO
│       ├── policies/
│       │   └── policies.component.html ✅ NUEVO
│       ├── requirements/
│       │   └── requirements.component.html ✅ NUEVO
│       └── award/
│           └── award.component.html ✅ NUEVO
└── config/
    ├── app-config.interface.ts ✅ NUEVO
    ├── config.server.ts ✅ NUEVO
    └── config.util.ts ✅ NUEVO

Raíz del proyecto:
├── IATECI_README.md ✅ NUEVO
├── CAMBIOS_IATECI.md ✅ ESTE ARCHIVO
├── INTEGRACION_PAGINAS_IATECI.md ✅ NUEVO
└── setup-iateci.bat ✅ NUEVO
```

---

**Fecha de personalización**: 2 de octubre de 2025
**Versión de DSpace**: 9.x (Angular 18)
**Institución**: Instituto Avanzado de Tecnologías en Ciencias e Innovación (IATECI)
**País**: República Dominicana
**Licencia del contenido**: CC BY 4.0
