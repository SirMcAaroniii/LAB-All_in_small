# Affiche les machines installées avec WSL 
wsl --list --verbose
$OS_installe = Read-Host "Sur quel OS souhaitez-vous installer Ansible ? (sensible a la casse!)"


# Creation de l'utilisateur et mot de passe 
wsl -d $OS_installe -- sudo sh -c "echo 'user:password' | chpasswd"

# Mise à jour des paquets dans Debian
wsl -d $OS_installe -- sudo apt update -y
wsl -d $OS_installe -- sudo apt upgrade -y

# Installation d'Ansible
wsl -d $OS_installe -- sudo apt install -y ansible