# scripts_jenkins

Ensemble de script pour faciliter la gestion d'un serveur jenkins dans Docker

## Pré-requis

* Image docker jenkins: jenkins/jenkins:lts
* Image docker bash   : bash:3.2.57

## Backup_jenkins.sh

Script permettant de faire un backup du dossier jenkins home depuis un container docker nommé **jenkins**. Le dossier jenkins_home est stocké dans un volume docker. Le script l'extrait et créer une archive .tar. Il est possible de customiser la commande tar dans le script pour etre plus selectif sur le backup. **Le container jenkins doit être arreté**

Le script prend 2 paramètres:

* backup_dir       : chemin du dossier dans lequel l'archive sera créee
* archive_name.tar : nom de l'archive créee

```bash
./backup_jenkins.sh backup_dir archive_name.tar
```

## Restore_jenkins.sh

Script permettant de restorer un backup du dossier jenkins_home dans un volume docker. Le script crée un container temporaire permettant de créer le volume docker et d'y extraire l'archive. Une fois le script executé, le volume jenkins_home est crée et peut être monté dans un container jenkins.

Le script prend 2 paramètres:

* backup_dir       : chemin du dossier dans lequel se trouve l'archive
* archive_name.tar : nom de l'archive à restorer

```bash
./restore_jenkins.sh backup_dir archive_name.tar
```

## Start_jenkins.sh

Script permettant de lancer le container jenkins. Si le container existe mais est arreté, un start est fait. sinon le docker est crée avec un volume jenkins_home. Si le volume existe déjà on l'utilise sinon il est crée

```bash
./start_jenkins.sh
```
