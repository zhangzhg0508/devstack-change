#!/usr/bin/env bash

# Tests for DevStack Ubuntu modifications

TOP=$(cd $(dirname "$0")/.. && pwd)

# Import common functions
source $TOP/functions
source $TOP/tests/unittest.sh

if [[ ! -x $(command -v apt-get 2>/dev/null) ]]; then
	echo "We thank you for your interest in testing Ubuntu functions,"
	echo "however this does not appear to be an Ubuntu system and continuing"
	echo "will only result in an unpleasant disappointment in the outcome."
	exit 1
fi

# Load inc/clearlinux
_ensure_lsb_release
GetOSVersion

assert_equal "xenial" "${os_CODENAME}" "codename check"
assert_equal "deb" "${os_PACKAGE}" "package check"
assert_equal "16.04" "${os_RELEASE}" "release check"
assert_equal "Ubuntu" "${os_VENDOR}" "vendor check"

GetDistro
assert_equal "xenial" "${DISTRO}" "distro check"

assert_equal "0" "$(is_ubuntu; echo $?)" "is_ubuntu"
assert_equal "$base_dir/debs" "$(_get_package_dir)" "_get_package_dir"
