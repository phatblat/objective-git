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
	sys/commit.h
	sys/config.h
	sys/diff.h
	sys/filter.h
	sys/hashsig.h
	sys/index.h
	sys/mempack.h
	sys/odb_backend.h
	sys/openssl.h
	sys/refdb_backend.h
	sys/reflog.h
	sys/refs.h
	sys/repository.h
	sys/stream.h
	sys/transport.h
	trace.h
)

for header in "${headers[@]}"; do
	cp -fv "${SRCROOT}/External/libgit2/include/git2/${header}" "Headers/"
done

# Remove the empty binary image Xcode created
#rm -fv "git2"
cp -fv "${SRCROOT}/External/libgit2-ios/libgit2-ios.a" "${PRODUCT_NAME}"
