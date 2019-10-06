echo "UPDATING"
sudo apt-get update

echo "PULLING REPOSITORY"
git pull https://github.com/OslometMartint/ACIT4410-Technical_task1

echo "INSTALLING node.js"
sudo apt install nodejs

echo "INSTALLING eslint"
sudo npm i -g eslint

echo "INSTALLING htmlhint"
sudo npm install htmlhint -g

#chromium-browser is necessary to run pa11y-ci
echo "INSTALLING chromium-browser"
sudo apt install -y chromium-browser

echo "INSTALLING pa11y-ci"
npm i pa11y-ci
