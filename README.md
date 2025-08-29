# UntitledDesktopDEB

[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)
[![trello](https://img.shields.io/badge/Trello-UDE-blue])](https://trello.com/b/HmfuRY2K/untitleddesktop)
[![Discord](https://img.shields.io/discord/717037253292982315.svg?label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/4wgH8ZE)

Debian/Ubuntu packages for the UntitledDesktopEnvironment. To add this repository to `apt` add the line below to `/etc/apt/sources.list.d/ude-debs.list`
```
deb [arch=amd64] https://debs.madladsquad.com stable main
```
Next, install our PGP key:
```
root # wget "https://debs.madladsquad.com/keys/public.asc" && mv public.asc /etc/apt/trusted.gpg.d/ude-debs.asc
```

After you've added the repository run `apt update`!
