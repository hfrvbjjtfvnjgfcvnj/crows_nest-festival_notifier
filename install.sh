#!/bin/bash
DIR="$(dirname "$(realpath "${0}")")"

cd "${DIR}"

function usage {
	echo "Invalid argument: install.sh path/to/crows_nest/plugins"
}

INSTALL_DIR="${1}"
if [ -z "${INSTALL_DIR}" ] || [ ! -e "${INSTALL_DIR}" ] ;
then
	usage
	exit 1;
fi

mkdir -p "${INSTALL_DIR}/festival_notifier"

cp -r ./* "${INSTALL_DIR}/festival_notifier/"

chown -R crows_nest:crows_nest "${INSTALL_DIR}/festival_notifier"

