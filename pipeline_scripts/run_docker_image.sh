NAME="technical_project1/s331044"
NEW_TAG=$(git log -1 --pretty=%H)
NEW_IMG=$NAME:$NEW_TAG
CONTAINERS_RUNNING_PROJECT=$(docker ps -a | awk '{print $1, $2 }' | grep technical_project1/s331044 | awk '{print $1}')

echo "Test echoing images"
echo $CONTAINERS_RUNNING_PROJECT

echo "Stop and remove containers start"
for container in ${CONTAINERS_RUNNING_PROJECT}; 
do
    `sudo docker rm -f $container`
    done
echo "Stop and remove containers done"

#Start docker container running the new image in the directory above
echo "Attempting to run $NEW_IMG"
`sudo docker run -d -p 80:80 $NEW_IMG` 
echo "start new done"
