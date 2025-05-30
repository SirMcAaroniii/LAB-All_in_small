#!/bin/bash
# Script d'installation d'Ansible

VERSIONS=$(curl -s https://pypi.org/pypi/ansible-core/json | python3 -c "import sys, json; print('\n'.join(sorted(json.load(sys.stdin)['releases'].keys(), reverse=True)))")
echo "$VERSIONS" | head -n 10

ANSIBLE_VERSION=$(read -p "Entrez la version de ansible-core à installer (ex: 2.15.5) : " VERSION)

pip install --user ansible
pip install --user ansible-core
pip install --user ansible-core=="$VERSION"
pip install --upgrade --user ansible

ansible --version