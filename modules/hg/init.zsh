#
# Provides Git aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[hg] )); then
  return 1
fi

# Load dependencies.
pmodload 'helper'
