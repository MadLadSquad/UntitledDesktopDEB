#!/usr/bin/env bash

download_package() {
	cd $1 || exit
	wget "https://rpms.madladsquad.com/RPMS/x86_64/${1%/}-$2-1.x86_64.rpm" || exit
	fpm -s rpm -t deb --no-auto-depends ${*:3} --after-install ./after-install.sh "${1%/}-$2-1.x86_64.rpm"
	cd .. || exit
}

for dir in ./*/; do
	version="$(cat "${dir}/metadata.txt" | grep "version" | sed "s/version: //g")"
	dependencies="$(cat "${dir}/metadata.txt" | grep "dependencies" | sed "s/dependencies: //g")"

	if [ "$dependencies" == "none" ]; then
		dependencies=""
	fi
	download_package "${dir}" "${version}" $dependencies
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
