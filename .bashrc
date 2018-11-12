# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't return glob pattern when no match was found
shopt -s nullglob

# Load default bash configuration
for module in ~/.bashrc.d/default/*; do
    source $module
done

# Load custom bash configuration
for module in ~/.bashrc.d/custom/*; do
    source $module
done

# Make PATH available for child processes
export PATH
