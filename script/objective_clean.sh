#!/bin/bash

#  objective_clean.sh
#
#  Created by Ben Chatelain on 2015-06-26

if [ "$USER" == "_teamsserver" ]; then
	SKIP_OBJCLEAN=1
fi

if [[ -z ${SKIP_OBJCLEAN} || ${SKIP_OBJCLEAN} != 1 ]]; then
	if [[ -d "${LOCAL_APPS_DIR}/Objective-Clean.app" ]]; then
		"${LOCAL_APPS_DIR}"/Objective-Clean.app/Contents/Resources/ObjClean.app/Contents/MacOS/ObjClean "${SRCROOT}"?!Carthage,!Frameworks
	else
		echo "warning: You have to install and set up Objective-Clean to use its features!"
	fi
fi
