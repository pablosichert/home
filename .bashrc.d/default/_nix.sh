# To run this file before other hooks, we prepend `_` to the file name.
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
    . ~/.nix-profile/etc/profile.d/nix.sh;
fi
