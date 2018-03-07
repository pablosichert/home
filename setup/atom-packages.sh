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
    sort-lines
"

# install atom plugin if not already installed
for package in $ATOM_PACKAGES ; do
    if [ -d ~/.atom/packages/$package ] ; then
        echo "Skipping atom plugin: $package (already installed)"
    else
        apm install $package
    fi
    hr
done
