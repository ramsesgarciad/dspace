# Cómo Ver las Páginas IATECI

## ✅ CAMBIOS APLICADOS

### 1. Idioma configurado a ESPAÑOL
- El sitio ahora carga en español por defecto
- Configurado en `config/config.yml`

### 2. Páginas creadas y funcionando
- ✅ Políticas del Repositorio
- ✅ Requisitos para Publicación  
- ✅ Premio Anual "Osvaldo García de la Concha"

### 3. Traducciones completas
- ✅ Español (es.json5)
- ✅ Inglés (en.json5)

---

## 🌐 CÓMO ACCEDER A LAS PÁGINAS

### Opción 1: Acceso Directo (URLs)

Escribe directamente en tu navegador:

```
http://localhost:4000/info/policies
http://localhost:4000/info/requirements
http://localhost:4000/info/award
```

### Opción 2: Desde la Página Principal

1. Ve a `http://localhost:4000`
2. El sitio debería cargar en ESPAÑOL
3. Busca en el footer (parte inferior) los enlaces:
   - "Políticas"
   - "Requisitos"
   - "Premio Anual"

---

## 🔄 REINICIA EL SERVIDOR

**IMPORTANTE**: Para que veas el cambio de idioma, DEBES reiniciar:

```bash
# Detener el servidor (Ctrl + C)
# Luego ejecutar:
cd C:\Users\RamsesGarcia\Downloads\dspace-angular
npm run start:dev
```

---

## 📱 SI NO VES LOS CAMBIOS

### 1. Limpia la caché del navegador
- Presiona `Ctrl + Shift + Delete`
- O usa `Ctrl + F5` para refrescar sin caché

### 2. Verifica que el servidor esté corriendo
- Debe decir "√ Compiled successfully"
- Puerto: 4000

### 3. Verifica el idioma
- En la esquina superior derecha debe haber un selector de idioma
- Selecciona "Español"

---

## 🎯 PÁGINA DE INICIO (HOME)

La página de inicio YA está personalizada con:
- ✅ Logo de IATECI
- ✅ Colores institucionales
- ✅ Banner "Repositorio IATECI"
- ✅ Descripción en español sobre República Dominicana y el Caribe
- ✅ Objetivos de Ciencia Abierta
- ✅ Licencia CC BY 4.0

Ve a: `http://localhost:4000`

---

## 🔗 PARA AGREGAR LAS PÁGINAS AL MENÚ PRINCIPAL

Las páginas están funcionando, pero para que aparezcan en el menú del navbar (como en la imagen que mostraste), necesitarías:

1. **Configurar el sistema de menús de DSpace** en el backend
2. O modificar el componente navbar para agregar enlaces estáticos

### Solución Rápida: Agregar enlaces en el Footer

El footer es más fácil de modificar. Las páginas ya están accesibles directamente por URL.

---

## 📝 RESUMEN

| Elemento | Estado | URL |
|----------|--------|-----|
| Página Principal | ✅ Personalizada | http://localhost:4000 |
| Políticas | ✅ Funcionando | http://localhost:4000/info/policies |
| Requisitos | ✅ Funcionando | http://localhost:4000/info/requirements |
| Premio Anual | ✅ Funcionando | http://localhost:4000/info/award |
| Idioma Español | ✅ Configurado | Por defecto |
| Logo IATECI | ✅ Aplicado | En header |
| Colores | ✅ Aplicados | Todo el sitio |

---

## 🆘 SOLUCIÓN DE PROBLEMAS

### Problema: El sitio sigue en inglés
**Solución**: 
1. Reinicia el servidor completamente
2. Limpia caché del navegador
3. Verifica que `config/config.yml` tenga `defaultLanguage: es`

### Problema: No veo las páginas
**Solución**: 
1. Accede directamente con las URLs de arriba
2. Verifica que el servidor compiló sin errores
3. Revisa la consola del navegador (F12) por errores

### Problema: El logo no aparece
**Solución**:
1. Verifica que existe: `src/assets/images/iateci-logo.png`
2. Refresca con Ctrl + F5

---

**© 2025 IATECI - Instituto Avanzado de Tecnologías en Ciencias e Innovación**
