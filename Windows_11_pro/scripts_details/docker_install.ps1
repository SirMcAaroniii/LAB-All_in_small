# Telecharger Docker Desktop
$dockerUrl = "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe"
$downloadPath = "$env:TEMP\DockerDesktopInstaller.exe"

# Telechargement de docker.exe
Start-BitsTransfer -Source $dockerUrl -Destination $downloadPath

# Executer l'installateur Docker
Start-Process -FilePath $downloadPath -ArgumentList "install" -Wait

# Supprimer l'installateur apres l'installation
Remove-Item -Path $downloadPath -Force