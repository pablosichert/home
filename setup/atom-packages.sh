ATOM_PACKAGES="
    atom-beautify
    go-plus
    language-babel
    language-latex
    latex
    lcov-info
    linter-eslint
    minimap
    minimap-git-diff
    minimap-highlight-selected
    pdf-view
    prettier-atom
"

# install atom plugin if not already installed
for p in $ATOM_PACKAGES ; do
    if [ -d ~/.atom/packages/$p ] ; then
        echo "Skipping atom plugin: $p (already installed)"
    else
        apm install $p
    fi
    hr
done
