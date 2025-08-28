#!/usr/bin/env bash

download_package() {
	cd $1 || exit
	wget "https://rpms.madladsquad.com/RPMS/x86_64/${1%/}-$3-1.x86_64.rpm" || exit
	PC_NAME="$2" LIBRARIES="$4" fpm -s rpm -t deb --no-auto-depends ${*:5} --after-install ../after-install.sh "${1%/}-$3-1.x86_64.rpm"
	cd .. || exit
}

for dir in ./*/; do
	version="$(cat "${dir}/metadata.txt" | grep "version" | sed "s/version: //g")"
	dependencies="$(cat "${dir}/metadata.txt" | grep "dependencies" | sed "s/dependencies: //g")"
	pc="$(cat "${dir}/metadata.txt" | grep "pkgconf" | sed "s/pkgconf: //g")"
	libraries="$(cat "${dir}/metadata.txt" | grep "libraries" | sed "s/libraries: //g")"

	if [ "$dependencies" == "none" ]; then
		dependencies=""
	fi
	download_package "${dir}" "${pc}" "${version}" "${libraries}" $dependencies
done

install_package() {
	sudo dpkg -i "$1"/"$1"*.deb
}

install_package untitled-cli-parser
install_package untitled-dbus-utils
install_package untitled-exec
install_package untitled-i18n
install_package untitled-open
install_package untitled-xdg-basedir

install_package untitled-imgui-framework

install_package ude-session-logout
install_package untitled-ibus-handwriting
install_package untitled-game-system-manager
