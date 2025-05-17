# Script d'installation WSL 
wsl --install

# Affiche la liste des machines disponibles en wsl
Write-Host "Liste des machines disponibles en wsl :"
wsl --list --online

# Choisir la machine que l'on souhaite 
$OS_souhaite = Read-Host "Quel OS souhaitez-vous ? (sensible à la casse!)"
wsl --install -d $OS_souhaite

# Mot de la fin
Write-Host "WSL est installé et configuré !"

# Creation de l'utilisateur et mot de passe 
wsl -d $OS_installe -- sudo sh -c "echo 'user:password' | chpasswd"

# Mise à jour des paquets dans Debian
wsl -d $OS_installe -- sudo apt update -y
wsl -d $OS_installe -- sudo apt upgrade -y

# Installation d'Ansible
wsl -d $OS_installe -- sudo apt install -y ansible

# Telecharger Docker Desktop
$dockerUrl = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"
$downloadPath = "$env:TEMP\DockerDesktopInstaller.exe"

# Telechargement de docker.exe
Start-BitsTransfer -Source $dockerUrl -Destination $downloadPath

# Executer l'installateur Docker
Start-Process -FilePath $downloadPath -ArgumentList "install" -Wait

# Supprimer l'installateur apres l'installation
Remove-Item -Path $downloadPath -Force