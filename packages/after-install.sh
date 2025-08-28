#!/usr/bin/env bash
if [ "$PC_NAME" != "none" ]; then
	mv /usr/lib64/pkgconfig/$1.pc /usr/lib/x86_64-linux-gnu/pkgconfig/
fi

if [ "$LIBRARIES" != "none" ]; then
	for arg in "$LIBRARIES"; do
		mv /usr/lib64/$arg.*so* /usr/lib/
	done
fi
