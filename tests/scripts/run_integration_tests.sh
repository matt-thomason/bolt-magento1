#!/usr/bin/env bash

echo "Installing node"
rm -rf ~/.nvm
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
source ~/.nvm/nvm.sh
nvm install 8.9.4

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "Downloading integration test repo"
cd /home/travis/build/BoltApp/bolt-magento1/
git clone https://${INTEGRATION_TESTS_TOKEN}@github.com/BoltApp/integration-tests.git/

echo "Installing depedencies"
cd integration-tests
npm install

echo "Start test"
TEST_ENV=sandbox xvfb-run npm run test-checkout-magento1
