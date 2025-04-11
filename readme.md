# This is my personal C project template.
## Use
Clone repo
```bash
git clone https://github.com/kanogame/ctemplate && cd ctemplate
```
Allow direnv
```bash
direnv allow
```
Compile with meson
```bash
meson setup build #use 'build' name to have ccls highlights
meson compile -C build && ./build/template 
```
You will see message from main at /src/main.c
## How
This templates uses Nix dev shell for managing programs, meson build system for compilation, includes wrap file for my [personal C library](https://github.com/kanogame/klib) and some python scripts to ease out some of usual C frustrations
## Tools
Everything except editor is included in flake.nix
For vscode: meson + ccls + settings in .vscode
