VSCODE_PACKAGES="
    akamud.vscode-theme-onelight
    dbaeumer.vscode-eslint
    eamodio.gitlens
    esbenp.prettier-vscode
    Tyriar.sort-lines
"

# install VS Code plugin if not already installed
for package in $VSCODE_PACKAGES ; do
    code --install-extension $package
    hr
done
