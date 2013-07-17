#!/bin/sh

#  TagCurrentVersion.sh
#  Versioning
#
#  Created by Kozlek on 13/07/13.
#

# Do nothing on clean
if [ "$1" == "clean" ]
then
    exit 0
fi

project_name=$(/usr/libexec/PlistBuddy -c "Print 'Project Name'" "${PROJECT_DIR}/version.plist")
project_version=$(/usr/libexec/PlistBuddy -c "Print 'Project Version'" "${PROJECT_DIR}/version.plist")
last_revision=$(<"${PROJECT_DIR}/revision.txt")
full_version=${project_version}'.'${last_revision}

git tag -a -f ${full_version} -m "${project_name} Build v${full_version}"
git push --tags