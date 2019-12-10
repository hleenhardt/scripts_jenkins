#! /bin/bash

# TODO: D2finir la politique de sauvegarde des builds et affiner le tar pour ne prendre que ce qui est nécessaire

JENKINS_HOME=/var/jenkins_home
BACKUP_DIRECTORY=$1
ARCHIVE_NAME=$2

help()
{
    echo "Script permattant le backup de jenkins"
    echo ""
    echo " - Param1: dossier ou sera créee l'archive de backup"
    echo " - Param2: nom de l'archive"
    echo ""
    echo "Exemple: ./backup_jenkins.sh ~/backup_jenkins backup_jenkins.tar"
    echo ""
}

if [ "$1" == "-h" ]; then
    help
    exit 0
fi

if [ $# -ne 2 ]; then
    help
    exit 1
fi

docker run \
    --rm \
    --volumes-from jenkins \
    -v ${BACKUP_DIRECTORY}:/backup \
    bash:3.2.57 \
    bash -c "cd ${JENKINS_HOME} && tar -cvf /backup/${ARCHIVE_NAME} --exclude={'./war','./cache','./tools'} ."

    echo ""
    echo "Backup creation done."
    echo "Archive can be found under ${BACKUP_DIRECTORY}/${ARCHIVE_NAME}"