NAME="technical_project1/s331044"
OLD_TAG=$(git log -2 --pretty=%H | tail +2)
NEW_TAG=$(git log -1 --pretty=%H)
OLD_IMG=$NAME:$OLD_TAG
NEW_IMG=$NAME:$NEW_TAG

echo "Old and new tags:"
echo $OLD_TAG
echo $NEW_TAG
echo "Old and new image:"
echo $OLD_IMG
echo $NEW_IMG

#Stop and remove containers running the previous version
echo "attempting to stop and remove $(docker ps -a --filter ancestor=$OLD_IMG --format="{{.ID}}")"
`sudo docker rm -f $(docker ps -a --filter ancestor=$OLD_IMG --format="{{.ID}}"))`
echo "stop and remove done"

#Start docker container running the new image in the directory above
echo "Attempting to run $NEW_IMG"
`sudo docker run -d -p 80:80 $NEW_IMG` 
echo "start new done"
