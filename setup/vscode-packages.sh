VSCODE_PACKAGES="
    akamud.vscode-theme-onelight
    coenraads.bracket-pair-colorizer-2
    dbaeumer.vscode-eslint
    eamodio.gitlens
    esbenp.prettier-vscode
    james-yu.latex-workshop
    PKief.material-icon-theme
    Tyriar.sort-lines
"

# install VS Code plugin if not already installed
for package in $VSCODE_PACKAGES ; do
    code --install-extension $package
    hr
done
