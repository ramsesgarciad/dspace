# Repositorio IATECI - Configuración

## Instituto Avanzado de Tecnologías en Ciencias e Innovación

El Repositorio del Instituto Avanzado de Tecnologías en Ciencias e Innovación (IATECI) es una plataforma digital de acceso abierto orientada a la preservación, organización, difusión y visibilidad del conocimiento científico, académico, técnico y profesional generado en la República Dominicana y en la región del Caribe.

### Ciencia Abierta
Comprometidos con el acceso libre y la difusión del conocimiento científico en la región del Caribe.

### Licencia
Todos los documentos publicados en el repositorio están bajo la licencia **Creative Commons Atribución 4.0 Internacional (CC BY 4.0)**.

## Configuración del Repositorio

### 1. Archivo de Configuración

Crea el archivo `config/config.dev.yml` con el siguiente contenido:

```yaml
# Configuración de desarrollo para Repositorio IATECI
debug: true

# Configuración de la UI
ui:
  ssl: false
  host: localhost
  port: 4000
  nameSpace: /

# Configuración del API REST
# IMPORTANTE: Actualiza estos valores con tu servidor backend de DSpace
rest:
  ssl: false
  host: localhost  # Cambiar por tu servidor backend
  port: 8080       # Cambiar por el puerto de tu servidor backend
  nameSpace: /server
```

### 2. Personalización Aplicada

✅ **Logo**: Actualizado a `iateci-logo.png`
✅ **Colores**: Aplicada paleta de colores IATECI
  - Azul principal: #045484
  - Verde principal: #3c9c44
  - Verde azulado: #539385
  - Azul medio: #3c7c9c
  - Gris claro: #d9e4e4

✅ **Textos**: Personalizados en español con información de IATECI
✅ **Footer**: Actualizado con copyright de IATECI y licencia CC BY 4.0

### 3. Categorías Académicas

El repositorio incluye las siguientes áreas de conocimiento:

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

### 4. Iniciar el Servidor

Una vez configurado el archivo `config/config.dev.yml`:

```bash
# Instalar dependencias (si aún no lo hiciste)
npm install

# Iniciar en modo desarrollo
npm run start:dev
```

El servidor estará disponible en: **http://localhost:4000**

### 5. Backend de DSpace

**IMPORTANTE**: Este es solo el frontend (interfaz de usuario) de DSpace. Necesitas tener el backend (API REST) de DSpace ejecutándose para que el repositorio funcione completamente.

Para configurar el backend, consulta:
- https://wiki.lyrasis.org/display/DSDOC9x/Installing+DSpace
- https://github.com/DSpace/DSpace

### Soporte

Para más información sobre DSpace:
- Documentación: https://wiki.lyrasis.org/display/DSDOC/
- GitHub: https://github.com/DSpace/dspace-angular

---

**© 2025 Instituto Avanzado de Tecnologías en Ciencias e Innovación (IATECI)**
**República Dominicana**
**Licencia CC BY 4.0**
