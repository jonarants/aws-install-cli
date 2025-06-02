#!/bin/bash
SCRIPT_NAME=$(basename "$0")
SCRIPT_VERSION="1.0.2"
REPO_URL="https://github.com/jonarants/aws-install-cli"
AUTHOR="JonaRants"

echo "# $SCRIPT_NAME v${SCRIPT_VERSION} - Escrito por ${AUTHOR}"
echo "# Github: ${REPO_URL}"
echo -e "\e[1;92mSe inicia el proceso de instalación de AWS CLI para WSL\e[0m"
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
echo -e "\e[1;92mDescomprimiendo\e[0m"
unzip awscliv2.zip
echo "Instalando..."
sudo ./aws/install
echo "Verificando la instalación..."
aws --version
echo -e "\e[1;92mInstalación verificada...\e[0m"
echo -e "\e[1;91mRemoviendo archivos innecesarios\e[0m"
rm awscliv2.zip
rm -rf aws
echo -e "\e[1;92mInstalación completada de manera exitosa\e[0m"
echo -e"# $SCRIPT_NAME v${SCRIPT_VERSION} - Escrito por \e[1;91m${AUTHOR}\e[0m"
echo "# Github: ${REPO_URL}"
echo "==============================================================================="
echo -e "Comenzando la instalación de \e[1;93mDocker Engine\e[0m en \e[1;92mWSL \e[0m"
echo -e "Configurando el repo de \e[1;93mDocker\e[0m"
echo "==============================================================================="

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

echo -e "Actualizando \e[1,93mDocker\e[0m"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo -e "Despliegue de \e[95mhello-world\e[0m"
sudo docker run hello-world
echo -e "\e[1;92mSe han instalado AWS CLI y Docker Engine en WSL de manera exitosa\e[0m"
echo -e"# $SCRIPT_NAME v${SCRIPT_VERSION} - Escrito por \e[1;91m${AUTHOR}\e[0m"
echo "# Github: ${REPO_URL}"