#!/usr/bin/env bash

download_package() {
	cd $1 || exit
	wget "https://rpms.madladsquad.com/RPMS/x86_64/${1%/}-$2-1.x86_64.rpm" || exit
	fpm -s rpm -t deb --no-auto-depends --after-install ../after-install.sh "${1%/}-$2-1.x86_64.rpm"
	cd .. || exit
}

for dir in ./*/; do
	download_package "${dir}" "$(cat "${dir}/metadata.txt" | grep "version" | sed "s/version: //g")"
done
