#!/usr/bin/env bash

# Tests for DevStack ClearLinux modifications

TOP=$(cd $(dirname "$0")/.. && pwd)

# Import common functions
source $TOP/functions
source $TOP/tests/unittest.sh

if [[ ! -x $(command -v swupd 2>/dev/null) ]]; then
	echo "We thank you for your interest in testing ClearLinux functions,"
	echo "however this does not appear to be a ClearLinux system and continuing"
	echo "will only result in an unpleasant disappointment in the outcome."
	exit 1
fi

# Load inc/clearlinux
_ensure_lsb_release
GetOSVersion

assert_equal "clearlinux" "${os_CODENAME}" "codename check"
assert_equal "rpm" "${os_PACKAGE}" "package check"
assert_true "release check" [ -n ${os_RELEASE} ]
assert_equal "Clear_Linux_OS" "${os_VENDOR}" "vendor check"

GetDistro
assert_equal "clearlinux" "${DISTRO}" "distro check"

assert_equal "0" "$(is_clearlinux; echo $?)" "is_clearlinux"
assert_equal "$base_dir/rpms-clear" "$(_get_package_dir)" "_get_package_dir"
