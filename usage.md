# Guide d'utilisation du script de gestion de machines virtuelles 
#sous VirtualBox


## Auteurs

- **Nom 1** : [Morgan]

- **Nom 2** : [Corentin]

- **Date** : [Date du jour]


## Résumé

Ce document décrit l'utilisation d'un script Bash (`genMV.sh`)
permettant de gérer des machines virtuelles dans VirtualBox.
Le script permet de créer, lister, démarrer, arrêter et supprimer 
des machines virtuelles en ligne de commande, en s'appuyant sur 
l'outil `VBoxManage`. 
Le document détaille également les fonctionnalités implémentées, 
les problèmes rencontrés, et les éventuelles améliorations à apporter.


## Prérequis

- **Système d'exploitation** : Linux

- **Outil requis** : VirtualBox installé et configuré pour être 
accessible via `VBoxManage`.

- **Accès** : Le script doit avoir les droits d'exécution.


## Installation

1. **Cloner le dépôt** ou **copier le script** `genMV.sh` dans le 
répertoire de votre choix.

2. **Rendre le script exécutable** :

   ```bash

   chmod +x genMV.sh
