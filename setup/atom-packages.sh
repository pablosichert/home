ATOM_PACKAGES="
  atom-beautify
  linter-eslint
  language-babel
  go-plus
  minimap
  minimap-git-diff
  minimap-highlight-selected
  pdf-view
  latex
  language-latex
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
