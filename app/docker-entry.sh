#!/bin/bash
set -e
#: ${SRC_DIR:="/mettermost/"}
SRC_DIR="/mattermost/"
config=/mattermost/config/config.json
DB_HOST=${DB_HOST:-db}
DB_PORT_5432_TCP_PORT=${DB_PORT_5432_TCP_PORT:-5432}
MM_USERNAME=${MM_USERNAME:-mmuser}
MM_PASSWORD=${MM_PASSWORD:-mmuser_password}
MM_DBNAME=${MM_DBNAME:-mattermost}
echo -ne "Configure database connection..."
#if [ ! -f $config ]
#then
#    cp /root/config.template.json $config
#    sed -Ei "s/DB_HOST/$DB_HOST/" $config
#    sed -Ei "s/DB_PORT/$DB_PORT_5432_TCP_PORT/" $config
#    sed -Ei "s/MM_USERNAME/$MM_USERNAME/" $config
#    sed -Ei "s/MM_PASSWORD/$MM_PASSWORD/" $config
#    sed -Ei "s/MM_DBNAME/$MM_DBNAME/" $config
#    echo OK
#else
#    echo SKIP
#fi

echo "127.0.0.1 dockerhost" >> /etc/hosts

function getrepo {
   if [ -e ${SRC_DIR}/.git ]; then
      pushd ${SRC_DIR}
      echo "Updating existing local repository..."
      git fetch
      popd
   else
      echo "Cloning ${REPO}..." 
#      cd /mettermost/
      git clone ${REPO} ${SRC_DIR} 
   fi

#   cd ${SRC_DIR}

#   echo "Switching to branch/tag ${BRANCH}..."
#   git checkout ${BRANCH}

#   echo "Forcing clean..."
#   git reset --hard origin/${BRANCH}
#   git clean -d -f
}

if [ -n "${REPO}" ]; then
   getrepo
fi


echo "Wait until database $DB_HOST:$DB_PORT_5432_TCP_PORT is ready..."
#until nc -z $DB_HOST $DB_PORT_5432_TCP_PORT
#do
#    sleep 1
#done

# Wait to avoid "panic: Failed to open sql connection pq: the database system is starting up"
#sleep 1

echo "Starting platform"
cd "/mattermost/"
export GOPATH=/go
export GOROOT=/usr/local/go
export PATH=/usr/local/go/bin:/go/bin:/usr/local/bin:$PATH
make run

#cd /mattermost/bin
#./platform $*
#cd /mattermost/
#ls 
#make run
