#/bin/sh
set -e

export NB_UGD=$(id -u):$(id -g)
export NB_UID=$(id -u)
export NB_GID=$(id -g)
export NB_USER=$USER

export NOTE_DIR=$(dirname $(readlink -f "$0"))/nbs
export DATA_DIR=$(dirname $(readlink -f "$0"))/cache
[ -d $DATA_DIR ] || mkdir "$DATA_DIR"

nohup docker-compose up > /tmp/dsn.log 2>&1 &
echo "working"
sleep 2
tail -n 20 /tmp/dsn.log
