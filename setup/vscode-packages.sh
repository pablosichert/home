VSCODE_PACKAGES="
    akamud.vscode-theme-onelight
    dnicolson.binary-plist
    eamodio.gitlens
    esbenp.prettier-vscode
    james-yu.latex-workshop
    pkief.material-icon-theme
    rust-lang.rust-analyzer
    vadimcn.vscode-lldb
"

# install VS Code plugin if not already installed
for package in $VSCODE_PACKAGES ; do
    code --install-extension $package
    hr
done
