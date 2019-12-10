#! /bin/bash

BACKUP_DIRECTORY=$1
ARCHIVE_NAME=$2

help()
{
    echo "Script permattant le backup de jenkins"
    echo ""
    echo " - Param1: dossier ou sera créee l'archive de backup"
    echo " - Param2: nom de l'archive"
}

if [ "$1" == "-h" ]; then
    help
    exit 0
fi

if [ $# -ne 2 ]; then
    help
    exit 1
fi

echo ""
echo "Jenkins will be restored from ${BACKUP_DIRECTORY}/${ARCHIVE_NAME}"
echo ""

docker run \
    --rm \
    -v jenkins_home:/var/jenkins_home \
    -v ${BACKUP_DIRECTORY}:/backup \
    bash:3.2.57 \
    bash -c "cd /var/jenkins_home && tar -xvf /backup/${ARCHIVE_NAME}"