#!/bin/bash

# PREFIX PATH
path="/home/sample/www"

# DROP DIST DIRECTORY
rm -Rf ${path}/dist

# MAKE DIST DIRECTORY
mkdir -p ${path}/dist

# COPY DIRECTORY
cp -rf ${path}/src/* ${path}/dist

# APPLY DEPLOY SETTINGS JSON PATH
grep -rl 'deploy_settings_src.json' ${path}/dist | xargs sed -i 's/deploy_settings_src/deploy_settings_dist/g'

# SCRIPT DEPLOY END
echo "SCRIPT DEPLOY COMPLETE";

