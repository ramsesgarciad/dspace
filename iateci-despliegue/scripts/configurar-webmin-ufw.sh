#!/bin/bash
# Script para habilitar Webmin en UFW (puerto 10000)

echo "=== Configuración de UFW para Webmin ==="
echo ""

# Verificar el estado actual de UFW
echo "Estado actual de UFW:"
sudo ufw status

echo ""
echo "Habilitando puerto 10000 para Webmin..."

# Abrir puerto 10000 (Webmin)
sudo ufw allow 10000/tcp

echo ""
echo "Puerto 10000 habilitado. Verificando configuración..."

# Mostrar el estado actualizado
sudo ufw status numbered

echo ""
echo "=== Configuración completada ==="
echo "Webmin debería estar accesible en: https://tu-servidor:10000"
echo ""
echo "Nota: Asegúrate de que Webmin esté instalado y corriendo:"
echo "  sudo systemctl status webmin"
