#!/bin/bash
SCRIPT_NAME=$(basename "$0")
SCRIPT_VERSION="1.0.1"
REPO_URL="https://github.com/jonarants/aws-install-cli"
AUTHOR="JonaRants"

echo "# $SCRIPT_NAME v${SCRIPT_VERSION} - Escrito por ${AUTHOR}"

echo -e "\e[1;92mSe inicia el proces de instalación de AWS CLI para WSL\e[0m"
echo "Se actualizaran los repositorios locales"
sudo apt update
sudo apt upgrade -y
echo "Se instalara unzip"
sudo apt install unzip -y
echo "Se inicia la descarga del AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" || {
    echo -e "\e[1;91mError al descargar AWS CLI. Revisa tu conexión a internet\e[0m"
    exit 1
}
echo -e "\e[1;92Descarga exitosa\e[0m"
echo -e "\e[1;92mDescomprimiendoe\e[0m"
unzip awscliv2.zip
echo "Instalando..."
sudo ./aws/install
echo "Verificando la instalación..."
aws --version
echo -e "\e[1;91mRemoviendo archivos\e[0m"
rm awscliv2.zip
rm -rf aws
echo -e "\e[1;92mInstalación completada de manera exitosa\e[0m"