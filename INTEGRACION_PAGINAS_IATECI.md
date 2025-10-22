# Integración de Páginas IATECI - Instrucciones Finales

## Páginas HTML Creadas

He creado las siguientes páginas con todo el contenido solicitado:

1. **Políticas del Repositorio**
   - Ruta: `src/app/info/policies/policies.component.html`
   - Contenido: Las 9 políticas completas del repositorio IATECI

2. **Requisitos para Publicación**
   - Ruta: `src/app/info/requirements/requirements.component.html`
   - Contenido: Requisitos detallados, formatos, y proceso de envío

3. **Premio Anual "Osvaldo García de la Concha"**
   - Ruta: `src/app/info/award/award.component.html`
   - Contenido: Información completa del premio, categorías y ceremonia

## Pasos para Completar la Integración

### Paso 1: Crear los Componentes TypeScript

Para cada página HTML creada, necesitas crear su componente TypeScript correspondiente:

#### 1.1 Crear `policies.component.ts`:
```typescript
// src/app/info/policies/policies.component.ts
import { Component } from '@angular/core';

@Component({
  selector: 'ds-policies',
  templateUrl: './policies.component.html',
  styleUrls: ['./policies.component.scss']
})
export class PoliciesComponent {
  constructor() { }
}
```

#### 1.2 Crear `requirements.component.ts`:
```typescript
// src/app/info/requirements/requirements.component.ts
import { Component } from '@angular/core';

@Component({
  selector: 'ds-requirements',
  templateUrl: './requirements.component.html',
  styleUrls: ['./requirements.component.scss']
})
export class RequirementsComponent {
  constructor() { }
}
```

#### 1.3 Crear `award.component.ts`:
```typescript
// src/app/info/award/award.component.ts
import { Component } from '@angular/core';

@Component({
  selector: 'ds-award',
  templateUrl: './award.component.html',
  styleUrls: ['./award.component.scss']
})
export class AwardComponent {
  constructor() { }
}
```

#### 1.4 Crear archivos SCSS (vacíos por ahora):
```bash
# Crear los archivos:
touch src/app/info/policies/policies.component.scss
touch src/app/info/requirements/requirements.component.scss
touch src/app/info/award/award.component.scss
```

### Paso 2: Agregar Rutas en el Routing

Edita el archivo de routing principal (usualmente `src/app/app-routing.module.ts` o similar):

```typescript
import { PoliciesComponent } from './info/policies/policies.component';
import { RequirementsComponent } from './info/requirements/requirements.component';
import { AwardComponent } from './info/award/award.component';

// Dentro del array de routes:
const routes: Routes = [
  // ... rutas existentes
  {
    path: 'info/policies',
    component: PoliciesComponent,
    data: { title: 'Políticas del Repositorio' }
  },
  {
    path: 'info/requirements',
    component: RequirementsComponent,
    data: { title: 'Requisitos para Publicación' }
  },
  {
    path: 'info/award',
    component: AwardComponent,
    data: { title: 'Premio Anual Osvaldo García de la Concha' }
  },
  // ... resto de rutas
];
```

### Paso 3: Declarar Componentes en el Módulo

Edita `src/app/info/info.module.ts` (o crea el módulo si no existe):

```typescript
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { PoliciesComponent } from './policies/policies.component';
import { RequirementsComponent } from './requirements/requirements.component';
import { AwardComponent } from './award/award.component';

@NgModule({
  declarations: [
    PoliciesComponent,
    RequirementsComponent,
    AwardComponent
  ],
  imports: [
    CommonModule,
    RouterModule
  ],
  exports: [
    PoliciesComponent,
    RequirementsComponent,
    AwardComponent
  ]
})
export class InfoModule { }
```

### Paso 4: Actualizar el Navbar

#### Opción A: Usando configuración YAML (si DSpace lo soporta)

Busca el archivo de configuración del menú y agrega:

```yaml
navbar:
  sections:
    - id: 'iateci_policies'
      text: 'menu.section.iateci_policies'
      link: '/info/policies'
    - id: 'iateci_requirements'
      text: 'menu.section.iateci_requirements'
      link: '/info/requirements'
    - id: 'iateci_award'
      text: 'menu.section.iateci_award'
      link: '/info/award'
```

#### Opción B: Manualmente en el código

Si necesitas agregar manualmente al navbar, busca el servicio o proveedor del navbar y agrega las secciones.

### Paso 5: Verificar Traducciones

Ya agregué las traducciones en español en `src/assets/i18n/es.json5`:
- ✅ `menu.section.iateci_policies`: "Políticas"
- ✅ `menu.section.iateci_requirements`: "Requisitos"
- ✅ `menu.section.iateci_award`: "Premio Anual"

Ahora agrega las traducciones en inglés en `src/assets/i18n/en.json5`:

```json5
"menu.section.iateci_policies": "Policies",
"menu.section.iateci_requirements": "Requirements",
"menu.section.iateci_award": "Annual Award",
```

### Paso 6: Compilar y Probar

```bash
cd C:\Users\RamsesGarcia\Downloads\dspace-angular

# Asegúrate de tener las dependencias instaladas
npm install

# Inicia el servidor de desarrollo
npm run start:dev
```

Luego accede a:
- http://localhost:4000/info/policies
- http://localhost:4000/info/requirements
- http://localhost:4000/info/award

## Resumen de Archivos Creados

```
src/app/info/
├── policies/
│   └── policies.component.html ✅ CREADO
├── requirements/
│   └── requirements.component.html ✅ CREADO
└── award/
    └── award.component.html ✅ CREADO

src/assets/i18n/
└── es.json5 ✅ ACTUALIZADO (traducciones agregadas)

Documentación:
├── IATECI_README.md ✅ CREADO
├── CAMBIOS_IATECI.md ✅ CREADO
├── INTEGRACION_PAGINAS_IATECI.md ✅ ESTE ARCHIVO
└── setup-iateci.bat ✅ CREADO
```

## Archivos que Debes Crear Tú

Para completar la integración necesitas crear:

1. `policies.component.ts`
2. `policies.component.scss`
3. `requirements.component.ts`
4. `requirements.component.scss`
5. `award.component.ts`
6. `award.component.scss`
7. Actualizar el routing module
8. Actualizar el info module (o crear si no existe)
9. Configurar el navbar para mostrar los nuevos enlaces

## Comandos Rápidos (PowerShell)

```powershell
# Crear estructura de directorios
mkdir -p src/app/info/policies
mkdir -p src/app/info/requirements
mkdir -p src/app/info/award

# Crear archivos TypeScript
New-Item src/app/info/policies/policies.component.ts
New-Item src/app/info/requirements/requirements.component.ts
New-Item src/app/info/award/award.component.ts

# Crear archivos SCSS
New-Item src/app/info/policies/policies.component.scss
New-Item src/app/info/requirements/requirements.component.scss
New-Item src/app/info/award/award.component.scss
```

## Notas Importantes

1. **Font Awesome Icons**: Las páginas usan iconos de Font Awesome (fas fa-*). Asegúrate de que Font Awesome está instalado y configurado en tu proyecto.

2. **Bootstrap Styles**: Las páginas usan clases de Bootstrap. DSpace ya incluye Bootstrap, así que debería funcionar sin problemas.

3. **RouterLink**: Algunos enlaces internos usan `routerLink`. Asegúrate de que el RouterModule está importado donde sea necesario.

4. **Responsive Design**: Todas las páginas están diseñadas para ser responsive y verse bien en móviles y desktop.

## Soporte

Si tienes problemas con la integración, consulta:
- Documentación de DSpace: https://wiki.lyrasis.org/display/DSDOC/
- Angular Router: https://angular.io/guide/router

---

**© 2025 IATECI - Instituto Avanzado de Tecnologías en Ciencias e Innovación**
