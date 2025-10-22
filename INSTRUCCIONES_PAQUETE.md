# 📦 Instrucciones del Paquete de Despliegue IATECI

## 🎯 Paso 1: Crear el Paquete ZIP

### En tu máquina Windows:

```bash
cd C:\Users\RamsesGarcia\Downloads\dspace-angular

# Ejecutar script de empaquetado
crear-paquete-despliegue.bat
```

Esto generará: **`iateci-despliegue.zip`**

---

## 📤 Paso 2: Subir al Servidor

### Opción A - Usando SCP (PowerShell):

```powershell
scp iateci-despliegue.zip usuario@iateci.org.do:/home/usuario/
```

### Opción B - Usando WinSCP/FileZilla:

1. Conectarte a `iateci.org.do` via SFTP
2. Subir `iateci-despliegue.zip` al directorio `/home/usuario/`

---

## 🚀 Paso 3: Instalar en el Servidor Ubuntu

### Conectarse al servidor:

```bash
ssh usuario@iateci.org.do
```

### Descomprimir y ejecutar:

```bash
# Descomprimir el paquete
unzip iateci-despliegue.zip

# Ir al directorio
cd iateci-despliegue

# Método 1: Instalación Rápida (Recomendado)
chmod +x instalar.sh
sudo ./instalar.sh

# Método 2: Instalación Completa (con más opciones)
chmod +x scripts/desplegar-servidor.sh
sudo ./scripts/desplegar-servidor.sh
```

---

## 🔥 Paso 4: Configurar Firewall

```bash
# Permitir HTTP/HTTPS
sudo ufw allow 'Nginx Full'

# Permitir backend DSpace
sudo ufw allow 8080/tcp

# Verificar
sudo ufw status
```

---

## 🔒 Paso 5: Configurar SSL/HTTPS (Opcional pero Recomendado)

```bash
# Instalar Certbot
sudo apt install certbot python3-certbot-nginx -y

# Obtener certificado SSL
sudo certbot --nginx -d iateci.org.do -d www.iateci.org.do

# Configurar renovación automática
sudo certbot renew --dry-run
```

---

## ✅ Verificación

### Comprobar que Nginx esté corriendo:

```bash
sudo systemctl status nginx
```

### Ver logs si hay problemas:

```bash
# Logs de error
sudo tail -f /var/log/nginx/iateci-error.log

# Logs de acceso
sudo tail -f /var/log/nginx/iateci-access.log
```

### Probar la aplicación:

Abre en tu navegador:
```
http://iateci.org.do
```

O con SSL:
```
https://iateci.org.do
```

---

## 📋 Contenido del Paquete ZIP

```
iateci-despliegue/
├── app/                          # Aplicación compilada
│   ├── index.html
│   ├── assets/
│   ├── *.js
│   └── *.css
├── scripts/                      # Scripts de instalación
│   ├── desplegar-servidor.sh    # Script completo de despliegue
│   └── configurar-webmin-ufw.sh # Script UFW para Webmin
├── config/                       # Archivos de configuración
│   └── nginx-iateci.conf        # Configuración de Nginx
├── instalar.sh                  # Script de instalación rápida
├── README.txt                   # Instrucciones básicas
└── GUIA_DESPLIEGUE_SERVIDOR.md # Guía completa detallada
```

---

## 🔄 Actualizar el Repositorio (Deployments Futuros)

### En Windows:

```bash
# Hacer cambios en el código
# ...

# Recompilar y empaquetar
crear-paquete-despliegue.bat

# Subir nuevo paquete
scp iateci-despliegue.zip usuario@iateci.org.do:/home/usuario/
```

### En el Servidor:

```bash
# Detener Nginx (opcional)
sudo systemctl stop nginx

# Descomprimir nuevo paquete
unzip -o iateci-despliegue.zip

# Reinstalar
cd iateci-despliegue
sudo ./instalar.sh

# Reiniciar Nginx
sudo systemctl start nginx
```

---

## ⚠️ Solución de Problemas

### Error: "502 Bad Gateway"
**Causa**: Backend DSpace no está corriendo

**Solución**:
```bash
# Verificar backend
curl http://localhost:8080/server/api

# Si no responde, iniciar DSpace backend
```

### Error: "Permission denied"
**Causa**: Permisos incorrectos

**Solución**:
```bash
sudo chown -R www-data:www-data /var/www/dspace-angular
sudo chmod -R 755 /var/www/dspace-angular
```

### Error: "Cannot find module"
**Causa**: Archivos no copiados correctamente

**Solución**:
```bash
# Verificar archivos
ls -la /var/www/dspace-angular/

# Reinstalar
cd iateci-despliegue
sudo ./instalar.sh
```

### Página en blanco
**Causa**: Ruta incorrecta en Nginx

**Solución**:
```bash
# Verificar configuración
sudo nginx -t

# Ver logs
sudo tail -f /var/log/nginx/iateci-error.log
```

---

## 📞 Comandos Útiles

```bash
# Ver estado de Nginx
sudo systemctl status nginx

# Reiniciar Nginx
sudo systemctl restart nginx

# Ver configuración activa
sudo nginx -T

# Probar configuración
sudo nginx -t

# Ver puertos abiertos
sudo netstat -tulpn | grep nginx

# Ver procesos de Nginx
ps aux | grep nginx
```

---

## ✨ Resumen Rápido

1. **Compilar**: `crear-paquete-despliegue.bat`
2. **Subir**: `scp iateci-despliegue.zip usuario@iateci.org.do:~/`
3. **Instalar**: 
   ```bash
   ssh usuario@iateci.org.do
   unzip iateci-despliegue.zip
   cd iateci-despliegue
   sudo ./instalar.sh
   ```
4. **Firewall**: `sudo ufw allow 'Nginx Full'`
5. **SSL**: `sudo certbot --nginx -d iateci.org.do`
6. **Verificar**: `http://iateci.org.do`

---

**© 2025 IATECI - Instituto Avanzado de Tecnologías en Ciencias e Innovación**
