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

# Copy only the necessary libgit2 headers
headers=(
	# Headers from libit2/git2.h
	annotated_commit.h
	attr.h
	blob.h
	blame.h
	branch.h
	buffer.h
	checkout.h
	cherrypick.h
	clone.h
	commit.h
	common.h
	config.h
	describe.h
	diff.h
	errors.h
	filter.h
	global.h
	graph.h
	ignore.h
	index.h
	indexer.h
	merge.h
	message.h
	net.h
	notes.h
	object.h
	odb.h
	odb_backend.h
	oid.h
	pack.h
	patch.h
	pathspec.h
	rebase.h
	refdb.h
	reflog.h
	refs.h
	refspec.h
	remote.h
	repository.h
	reset.h
	revert.h
	revparse.h
	revwalk.h
	signature.h
	stash.h
	status.h
	submodule.h
	tag.h
	transport.h
	transaction.h
	tree.h
	types.h
	version.h

	# Other headers
	cred_helpers.h
	strarray.h
	oidarray.h
	trace.h
)

for header in "${headers[@]}"; do
	cp -fv "${SRCROOT}/External/libgit2/include/git2/${header}" "Headers/"
done

# sys headers
sys_headers=(
	commit.h
	config.h
	diff.h
	filter.h
	hashsig.h
	index.h
	mempack.h
	odb_backend.h
	openssl.h
	refdb_backend.h
	reflog.h
	refs.h
	repository.h
	stream.h
	transport.h
)

mkdir -p "Headers/sys"
for header in "${sys_headers[@]}"; do
	cp -fv "${SRCROOT}/External/libgit2/include/git2/sys/${header}" "Headers/sys/"
done

# Remove the empty binary image Xcode created
#rm -fv "git2"
cp -fv "${SRCROOT}/External/libgit2-ios/libgit2-ios.a" "${PRODUCT_NAME}"
