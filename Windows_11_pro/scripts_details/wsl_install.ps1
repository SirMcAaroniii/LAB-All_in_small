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