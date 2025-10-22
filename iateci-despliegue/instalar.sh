#!/bin/bash 
# Script de instalacion rapida - Repositorio IATECI 
 
echo "=======================================" 
echo "  INSTALACION REPOSITORIO IATECI" 
echo "=======================================" 
echo "" 
 
# Instalar Nginx 
echo "Instalando Nginx..." 
sudo apt update 
sudo apt install -y nginx 
 
# Copiar archivos 
echo "Copiando archivos de la aplicacion..." 
sudo mkdir -p /var/www/dspace-angular 
sudo cp -r app/* /var/www/dspace-angular/ 
sudo chown -R www-data:www-data /var/www/dspace-angular 
 
# Configurar Nginx 
echo "Configurando Nginx..." 
sudo cp config/nginx-iateci.conf /etc/nginx/sites-available/iateci 
sudo ln -sf /etc/nginx/sites-available/iateci /etc/nginx/sites-enabled/iateci 
sudo rm -f /etc/nginx/sites-enabled/default 
 
# Verificar y reiniciar Nginx 
echo "Reiniciando Nginx..." 
sudo nginx -t && sudo systemctl restart nginx 
 
echo "" 
echo "=======================================" 
echo "  INSTALACION COMPLETADA" 
echo "=======================================" 
echo "Accede a: http://iateci.org.do" 
