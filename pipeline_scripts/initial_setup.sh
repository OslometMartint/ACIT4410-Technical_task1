ehco "UPDATING"
sudo apt-get update

echo "PULLING REPOSITORY"
git pull https://github.com/OslometMartint/ACIT4410-Technical_task1

echo "INSTALLING pa11y-ci"
sudo npm install -g pa11y-ci