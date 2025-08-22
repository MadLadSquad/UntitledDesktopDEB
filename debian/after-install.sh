#!/usr/bin/env bash
mv /usr/lib64/pkgconfig/$1.pc /usr/lib/x86_64-linux-gnu/pkgconfig/
for arg in "${@:2}"; do
	mv /usr/lib64/$arg /usr/lib/
done
