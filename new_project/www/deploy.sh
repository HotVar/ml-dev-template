#!/bin/bash

# PREFIX PATH
path="/home/sample/www"

# DROP DIST DIRECTORY
rm -Rf ${path}/script/dist

# MAKE DIST DIRECTORY
mkdir -p ${path}/script/dist

# COPY DIRECTORY
cp -rf ${path}/script/src/* ${path}/script/dist

# APPLY DEPLOY SETTINGS JSON PATH
grep -rl 'deploy_settings_src.json' ${path}/script/dist | xargs sed -i 's/deploy_settings_src/deploy_settings_dist/g'

# SCRIPT DEPLOY END
echo "SCRIPT DEPLOY COMPLETE";

