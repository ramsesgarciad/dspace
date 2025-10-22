#!/bin/bash
# Script de despliegue para Repositorio IATECI en Ubuntu Server
# Ejecutar en el servidor Ubuntu después de descomprimir el paquete

echo "==================================================="
echo "   DESPLIEGUE DE REPOSITORIO IATECI"
echo "==================================================="
echo ""

# Variables
APP_DIR="/var/www/dspace-angular"
NGINX_AVAILABLE="/etc/nginx/sites-available/iateci"
NGINX_ENABLED="/etc/nginx/sites-enabled/iateci"
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Instalar dependencias
echo "📦 Instalando dependencias necesarias..."
sudo apt update
sudo apt install -y nginx unzip

# 2. Crear directorio de la aplicación
echo "📁 Creando directorio de la aplicación..."
sudo mkdir -p $APP_DIR

# 3. Copiar archivos de la aplicación
if [ -d "$CURRENT_DIR/../app" ]; then
    echo "📂 Copiando archivos de la aplicación..."
    sudo cp -r $CURRENT_DIR/../app/* $APP_DIR/
elif [ -f ~/dspace-angular-build.tar.gz ]; then
    echo "📂 Descomprimiendo archivos desde tar.gz..."
    sudo tar -xzf ~/dspace-angular-build.tar.gz -C $APP_DIR
else
    echo "⚠️  No se encontraron archivos de la aplicación"
    echo "   Verifica que estés en el directorio correcto"
    exit 1
fi

# 4. Dar permisos correctos
echo "🔐 Configurando permisos..."
sudo chown -R www-data:www-data $APP_DIR
sudo chmod -R 755 $APP_DIR

# 5. Configurar Nginx
echo "🌐 Configurando Nginx..."

# Copiar configuración de Nginx desde el paquete o crear una nueva
if [ -f "$CURRENT_DIR/../config/nginx-iateci.conf" ]; then
    echo "   Usando configuración incluida en el paquete..."
    sudo cp $CURRENT_DIR/../config/nginx-iateci.conf $NGINX_AVAILABLE
else
    echo "   Creando nueva configuración..."
    # Crear archivo de configuración de Nginx
    sudo tee $NGINX_AVAILABLE > /dev/null << 'EOF'
server {
    listen 80;
    listen [::]:80;
    server_name iateci.org.do www.iateci.org.do;

    root /var/www/dspace-angular;
    index index.html;

    access_log /var/log/nginx/iateci-access.log;
    error_log /var/log/nginx/iateci-error.log;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location /server/ {
        proxy_pass http://localhost:8080/server/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location ~* \.(jpg|jpeg|png|gif|ico|css|js|svg|woff|woff2|ttf|eot)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    gzip on;
    gzip_vary on;
    gzip_types text/plain text/css text/xml text/javascript application/json application/javascript;
}
EOF
fi

# Habilitar el sitio
sudo ln -sf $NGINX_AVAILABLE $NGINX_ENABLED

# Deshabilitar sitio por defecto
sudo rm -f /etc/nginx/sites-enabled/default

# 6. Verificar configuración de Nginx
echo "✅ Verificando configuración de Nginx..."
sudo nginx -t

if [ $? -eq 0 ]; then
    echo "✅ Configuración de Nginx correcta"
    
    # Reiniciar Nginx
    echo "🔄 Reiniciando Nginx..."
    sudo systemctl restart nginx
    sudo systemctl enable nginx
    
    echo ""
    echo "==================================================="
    echo "   ✅ DESPLIEGUE COMPLETADO"
    echo "==================================================="
    echo ""
    echo "🌐 Tu repositorio está disponible en:"
    echo "   http://iateci.org.do"
    echo ""
    echo "📝 Próximos pasos:"
    echo "   1. Configurar SSL/HTTPS (recomendado):"
    echo "      sudo apt install certbot python3-certbot-nginx"
    echo "      sudo certbot --nginx -d iateci.org.do"
    echo ""
    echo "   2. Abrir puertos en el firewall:"
    echo "      sudo ufw allow 'Nginx Full'"
    echo "      sudo ufw allow 8080/tcp"
    echo ""
    echo "   3. Verificar logs:"
    echo "      sudo tail -f /var/log/nginx/iateci-error.log"
    echo ""
else
    echo "❌ Error en la configuración de Nginx"
    echo "   Revisa los errores arriba"
    exit 1
fi
