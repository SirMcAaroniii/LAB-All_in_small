#!/bin/bash
# Script d'installation de pip, en cas de besoin ! 
# Il faut relancer le terminal pour appliquer la suite

# Télécharger pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Installation et ajout aux variables d'environnement 
INSTALL_OUTPUT=$(python3 get-pip.py --user 2>&1)
PIP_USER_DIR=$(python3 -m site --user-base)/bin


if [[ ":$PATH:" != *":$PIP_USER_DIR:"* ]]; then 
  SHELL_RC=""
  if [[ $SHELL == *"zsh" ]]; then
    SHELL_RC="$HOME/.zshrc"
  else
    SHELL_RC="$HOME/.bashrc"
  fi

  echo "export PATH=\"$PIP_USER_DIR:\$PATH\"" >> "$SHELL_RC"
  echo "Ligne ajoutée à $SHELL_RC. Redémarre ton terminal ou exécute :"
  echo "source $SHELL_RC"
else
  echo "Le chemin est déjà dans le PATH."
fi