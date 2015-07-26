#!/bin/bash -e

#  git2_framework.sh
#  ObjectiveGitFramework
#
#  Created by Ben Chatelain on 7/25/15.
#  Copyright © 2015 GitHub, Inc. All rights reserved.

#${BUILD_DIR}/${CONFIGURATION}${EFFECTIVE_PLATFORM_NAME}

export FRAMEWORK_PATH="${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.framework"
echo "FRAMEWORK_PATH: ${FRAMEWORK_PATH}"

## Create the path to the real Headers dir
#mkdir -pv "${FRAMEWORK_PATH}/Versions/A/Headers"
#
## Create the required symlinks
#ln -sfhv A "${FRAMEWORK_PATH}/Versions/Current"
#ln -sfhv Versions/Current/Headers "${FRAMEWORK_PATH}/Headers"
#ln -sfhv "Versions/Current/${PRODUCT_NAME}" \
#	"${FRAMEWORK_PATH}/${PRODUCT_NAME}"
#
#echo "copy headers ${TARGET_BUILD_DIR}/${PUBLIC_HEADERS_FOLDER_PATH}/"
## Copy the public headers into the framework
#cp -av "${TARGET_BUILD_DIR}/${PUBLIC_HEADERS_FOLDER_PATH}/" \
#	"${FRAMEWORK_PATH}/Versions/A/Headers"

cd "${FRAMEWORK_PATH}"

#cp -a "${SRCROOT}/External/libgit2/include/git2.h" "Headers/"
cp -a "${SRCROOT}/External/libgit2/include/git2/" "Headers/"

# Remove the empty binary image Xcode created
#rm -fv "git2"
cp -fv "${SRCROOT}/External/libgit2-ios/libgit2-ios.a" "${PRODUCT_NAME}"
