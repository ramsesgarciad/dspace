# 🚀 Guía de Despliegue - Repositorio IATECI en Ubuntu Server

## 📋 Requisitos Previos

### En tu servidor Ubuntu (iateci.org.do):
- ✅ Ubuntu Server 20.04 o superior
- ✅ Acceso SSH (root o sudo)
- ✅ DSpace Backend corriendo en puerto 8080
- ✅ Dominio apuntando al servidor (iateci.org.do)

### En tu máquina Windows:
- ✅ Node.js instalado
- ✅ Proyecto DSpace Angular personalizado
- ✅ Acceso SSH al servidor (PuTTY, PowerShell SSH, etc.)

---

## 🎯 Proceso Completo de Despliegue

### PASO 1: Compilar en Windows

```bash
cd C:\Users\RamsesGarcia\Downloads\dspace-angular

# Compilar para producción
npm run build:prod
```

Esto generará los archivos en `dist/browser/`

---

### PASO 2: Comprimir archivos compilados

```powershell
# En PowerShell
cd C:\Users\RamsesGarcia\Downloads\dspace-angular
tar -czf dspace-angular-build.tar.gz -C dist\browser .
```

---

### PASO 3: Transferir al servidor

#### Opción A - Usando SCP desde PowerShell:

```powershell
# Transferir archivo compilado
scp dspace-angular-build.tar.gz usuario@iateci.org.do:/home/usuario/

# Transferir script de despliegue
scp desplegar-servidor.sh usuario@iateci.org.do:/home/usuario/
```

#### Opción B - Usando WinSCP/FileZilla:
1. Conectar a `iateci.org.do` vía SFTP
2. Subir `dspace-angular-build.tar.gz`
3. Subir `desplegar-servidor.sh`

---

### PASO 4: Ejecutar script de despliegue en el servidor

```bash
# Conectarse al servidor
ssh usuario@iateci.org.do

# Dar permisos de ejecución al script
chmod +x desplegar-servidor.sh

# Ejecutar script de despliegue
./desplegar-servidor.sh
```

El script automáticamente:
- ✅ Instala Nginx
- ✅ Descomprime archivos
- ✅ Configura permisos
- ✅ Crea configuración de Nginx
- ✅ Reinicia servicios

---

### PASO 5: Configurar Firewall (UFW)

```bash
# Habilitar HTTP (puerto 80)
sudo ufw allow 'Nginx Full'

# Habilitar puerto del backend DSpace
sudo ufw allow 8080/tcp

# Verificar estado
sudo ufw status
```

---

### PASO 6: Configurar SSL/HTTPS (IMPORTANTE para producción)

```bash
# Instalar Certbot
sudo apt install certbot python3-certbot-nginx

# Obtener certificado SSL gratuito
sudo certbot --nginx -d iateci.org.do -d www.iateci.org.do

# Renovación automática
sudo certbot renew --dry-run
```

---

## 🌐 Acceder al Repositorio

Después del despliegue, accede a:

```
http://iateci.org.do
```

O con SSL configurado:
```
https://iateci.org.do
```

---

## 🔧 Comandos Útiles

### Ver logs de Nginx:
```bash
# Errores
sudo tail -f /var/log/nginx/iateci-error.log

# Accesos
sudo tail -f /var/log/nginx/iateci-access.log
```

### Reiniciar Nginx:
```bash
sudo systemctl restart nginx
```

### Verificar estado de Nginx:
```bash
sudo systemctl status nginx
```

### Probar configuración de Nginx:
```bash
sudo nginx -t
```

---

## 📂 Estructura de Archivos en el Servidor

```
/var/www/dspace-angular/
├── browser/
│   ├── index.html
│   ├── assets/
│   ├── *.js
│   └── *.css
└── server/ (solo si usas SSR)

/etc/nginx/
├── sites-available/
│   └── iateci
└── sites-enabled/
    └── iateci -> ../sites-available/iateci
```

---

## 🔄 Actualizar el Repositorio (deployments futuros)

### En Windows:
```bash
cd C:\Users\RamsesGarcia\Downloads\dspace-angular

# Hacer cambios en el código...

# Compilar
npm run build:prod

# Comprimir
tar -czf dspace-angular-build.tar.gz -C dist\browser .

# Transferir
scp dspace-angular-build.tar.gz usuario@iateci.org.do:/home/usuario/
```

### En el servidor Ubuntu:
```bash
# Descomprimir nueva versión
cd /var/www/dspace-angular
sudo rm -rf browser/*
sudo tar -xzf ~/dspace-angular-build.tar.gz -C /var/www/dspace-angular/browser/

# Dar permisos
sudo chown -R www-data:www-data /var/www/dspace-angular

# Limpiar caché de Nginx (opcional)
sudo systemctl restart nginx
```

---

## ⚠️ Solución de Problemas

### Error 502 Bad Gateway
- Verifica que el backend DSpace esté corriendo:
  ```bash
  curl http://localhost:8080/server/api
  ```

### Error 404 en rutas
- Verifica la configuración `try_files` en Nginx

### No se ve el contenido personalizado
- Limpia caché del navegador: `Ctrl + Shift + Delete`
- Verifica que los archivos estén en `/var/www/dspace-angular/browser/`

### Problemas de CORS
- Configura el backend para permitir tu dominio
- Verifica headers en la respuesta del API

---

## 📝 Checklist de Despliegue

- [ ] Proyecto compilado: `npm run build:prod`
- [ ] Archivo transferido al servidor
- [ ] Script de despliegue ejecutado
- [ ] Nginx corriendo correctamente
- [ ] Firewall configurado (puertos 80, 443, 8080)
- [ ] SSL/HTTPS configurado (Certbot)
- [ ] Backend DSpace funcionando
- [ ] DNS apuntando al servidor
- [ ] Logs revisados sin errores
- [ ] Prueba de navegación en el sitio

---

## 🆘 Soporte Adicional

Si encuentras problemas:

1. **Revisa logs de Nginx**:
   ```bash
   sudo tail -f /var/log/nginx/iateci-error.log
   ```

2. **Verifica backend DSpace**:
   ```bash
   curl http://localhost:8080/server/api
   ```

3. **Prueba configuración de Nginx**:
   ```bash
   sudo nginx -t
   ```

---

**© 2025 IATECI - Instituto Avanzado de Tecnologías en Ciencias e Innovación**
