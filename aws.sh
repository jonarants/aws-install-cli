#!/bin/bash

echo "Se inicia el proces de instalación de AWS CLI para WSL"
echo "Se actualizaran los repositorios locales"
sudo apt update
sudo apt upgrade -y
echo "Se instalara unzip"
sudo apt install unzip -y
echo "Se inicia la descarga del AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" || {
    echo "Error al descargar AWS CLI. Revisa tu conexión a internet"
    exit 1
}
echo "Descarga exitosa"
echo "Descomprimiendo"
unzip awscliv2.zip
echo "Instalando..."
sudo ./aws/install
echo "Verificando la instalación..."
aws --version
echo "Removiendo archivos"
rm awscliv2.zip
rm -rf aws
echo "Instalación completada de manera exitosa"